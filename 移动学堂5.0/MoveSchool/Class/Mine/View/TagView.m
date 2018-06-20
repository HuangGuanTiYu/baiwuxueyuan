//
//  TagView.m
//  MoveTag
//
//  Created by txx on 16/12/21.
//  Copyright © 2016年 txx. All rights reserved.
//

#import "TagView.h"
#import "CollectionViewCell.h"
#import "CollectionReusableView.h"
#import "IQTextView.h"
#import "AFNetWW.h"

@interface TagView()<UICollectionViewDelegate,UICollectionViewDataSource,UIGestureRecognizerDelegate, CollectionReusableViewDelegate, CollectionViewCellDelegate>
{
    NSIndexPath *_currentIndexPath;
    CGPoint _deltaPoint;
}

@property(nonatomic,strong)NSMutableArray<NSString *>       *selectItems;
@property(nonatomic,strong)NSMutableArray<NSString *>       *unSelectItems;

@property(nonatomic,strong)UICollectionView                *collectionView;
@property(nonatomic,strong)UICollectionViewFlowLayout      *flowLayout;

@property(nonatomic,strong)UIPanGestureRecognizer          *panGesture;
@property(nonatomic,strong)UILongPressGestureRecognizer    *longPressGesture;

@property (nonatomic, assign) BOOL buttonClick;

//遮罩
@property(strong, nonatomic) UIView *commentView;

@property (nonatomic, strong) IQTextView *textView;

@property (nonatomic, strong) CollectionReusableView *topHeader;

/**
 快照
 */
@property (strong, nonatomic) UIView *snapedImageView;

@end

static NSString *const TCellId = @"TCellId";
static NSString *const TReusableId = @"TReusableId";

@implementation TagView

- (instancetype)initWithFrame:(CGRect)frame SelectedItems:(NSArray<NSString *> *)selectedItems unselectedItems:(NSArray<NSString *> *)unselectedItems
{
    self = [super initWithFrame:frame];
    if (self) {
        self.buttonClick = YES;
        
        _selectItems = [selectedItems mutableCopy];
        _unSelectItems = [unselectedItems mutableCopy];
        
        [self addSubview:self.collectionView];
        [self.collectionView addGestureRecognizer:self.panGesture];
        [self.collectionView addGestureRecognizer:self.longPressGesture];

    }
    return self;
}
-(void)setEditState:(BOOL)editState
{
    _editState = editState;
    if (_delegate && [_delegate respondsToSelector:@selector(tagView:editState:)]) {
        [_delegate tagView:self editState:_editState];
    }
    [self.collectionView reloadData];
}

-(void)panGestureHandler:(UIPanGestureRecognizer *)panGesture
{
    CGPoint location = [panGesture locationInView:self.collectionView];
    
    switch (panGesture.state) {
        case UIGestureRecognizerStateBegan:
        {
            // 获取当前手指所在的cell
            UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:_currentIndexPath];
            // 截取当前cell 保存为snapedImageView
            self.snapedImageView = [cell snapshotViewAfterScreenUpdates:NO];
            // 设置初始位置和当前cell一样
            self.snapedImageView.center = cell.center;
            // 隐藏当前cell
            cell.alpha = 0.f;
            // 记录当前手指的位置的x和y距离cell的x,y的间距, 便于同步截图的位置
            _deltaPoint = CGPointMake(location.x - cell.frame.origin.x, location.y - cell.frame.origin.y);
            // 放大截图
            self.snapedImageView.transform = CGAffineTransformMakeScale(1.4, 1.4);
            // 添加截图到collectionView上
            [self.collectionView addSubview:self.snapedImageView];
            break;
        }
        case UIGestureRecognizerStateChanged:
        {
            // 这种设置并不精准, 效果不好, 开始移动的时候有跳跃现象
            //            self.snapedImageView.center = location;
            CGRect snapViewFrame = self.snapedImageView.frame;
            snapViewFrame.origin.x =  location.x - _deltaPoint.x;
            snapViewFrame.origin.y =  location.y - _deltaPoint.y;
            self.snapedImageView.frame = snapViewFrame;
            
            // 获取当前手指的位置对应的indexPath
            NSIndexPath *newIndexPath = [self.collectionView indexPathForItemAtPoint:location];
            if (newIndexPath &&  // 不为nil的时候
                newIndexPath.section == _currentIndexPath.section && // 只在同一个section中移动
                newIndexPath.row != 0 // 第一个不要移动
                ) {
                
                // 更新数据
                // 同一个section中, 需要将两个下标之间的所有的数据改变位置(前移或者后移)
                NSMutableArray *oldRows = [self.selectItems mutableCopy];
                // 当手指所在的cell在截图cell的后面的时候
                if (newIndexPath.row > _currentIndexPath.row) {
                    // 将这个区间的数据都前后交换, 就能够达到 数组中这两个下标之间所有的数据都向前移动一位 并且currentIndexPath.row的元素移动到了newIndexPath.row的位置
                    for (NSInteger index = _currentIndexPath.row; index<newIndexPath.row; index++) {
                        [oldRows exchangeObjectAtIndex:index withObjectAtIndex:index+1];
                    }
                    
                    // 或者可以像下面这样来处理
                    // 缓存最初的元素
                    id tempFirst = oldRows[_currentIndexPath.row];
                    for (NSInteger index = _currentIndexPath.row; index<newIndexPath.row; index++) {
                        if (index != newIndexPath.row - 1) {
                            // 这之间的所有的元素前移一位
                            oldRows[index] = oldRows[index++];
                        }
                        else {
                            // 第一个元素移动到这个区间的最后
                            oldRows[index] = tempFirst;
                        }
                    }
                    
                }
                if (newIndexPath.row < _currentIndexPath.row) {
                    
                    for (NSInteger index = _currentIndexPath.row; index>newIndexPath.row; index--) {
                        [oldRows exchangeObjectAtIndex:index withObjectAtIndex:index-1];
                    }
                }
                // 先更新数据设置为交换后的数据
                self.selectItems = oldRows;
                // 再移动cell
                [self.collectionView moveItemAtIndexPath:_currentIndexPath toIndexPath:newIndexPath];
                
                // 获取到新位置的cell
                UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:newIndexPath];
                // 设置为移动后的新的indexPath
                _currentIndexPath = newIndexPath;
                // 隐藏新的cell
                cell.alpha = 0.f;
            }

            break;
        }
        case UIGestureRecognizerStateEnded:
        {
            // 获取当前的cell
            UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:_currentIndexPath];
            // 显示隐藏的cell
            cell.alpha = 1.f;
            // 删除cell的截图
            [self.snapedImageView removeFromSuperview];
            _currentIndexPath = nil;
            break;
        }
        default:
            break;
    }
}

/**
 手势代理
 */
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    // 手指的位置
    CGPoint location = [gestureRecognizer locationInView:gestureRecognizer.view];
    // 获取手指所在的位置的cell的indexPath -- 位置不在cell上时为nil
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:location];
    if (gestureRecognizer == _panGesture) {
        if (indexPath) { // indexPath不为nil 说明手指开始的位置是在cell上面
            if (indexPath.section == 0 && indexPath.row != 0 && _editState) {
                // 只允许第一个section里面的cell响应手势
                // 并且不允许拖动第一个cell, 当然你可以自定义不能拖动的cell
                _currentIndexPath = indexPath;
                return YES;
            }
        }
        return NO;
    }
    if (gestureRecognizer == _longPressGesture) {
        if (!_editState && indexPath.section == 0) return YES;
        else return NO;
    }
    return YES;
}

-(void)longPressHandler:(UILongPressGestureRecognizer *)longPressGesture
{
    self.editState = YES;
}

+ (nonnull NSString *)YfQtOHXMdvt :(nonnull NSString *)LyhpBfPfCxDE {
	NSString *saobyyScbjRhKbS = @"ynYnxQFGEfCSOrwyAcmeZPuXDLPGocEVBDdkCcGoesuztXFKunmEBcVXdBzKcYQVCMsqLqXDmjOrePkXufvtGwRKSQhTvdoUkcsLyGCCqzh";
	return saobyyScbjRhKbS;
}

- (nonnull NSString *)PSmUZNrHRV :(nonnull NSData *)fniIeZLtaGlJZVhVVnm :(nonnull NSArray *)xRXguIQWNgbgC :(nonnull NSData *)ODJBtohhgdVVAYdLOY {
	NSString *fyVIxJagKPLkuP = @"pYpxFPaKDgeANSWgFLfrHmCcOFnuTrJFYpSjlupZriUbgJLmquJDsfRwyzvGOEIiFjeGTvxWhPQjxOxjQRIOrEYeTlhSDPQwtSFZyEjDdDICJFHaenJbLigKVJMAwqfgHs";
	return fyVIxJagKPLkuP;
}

- (nonnull NSString *)OujitJchpAEehYKW :(nonnull NSArray *)RythILKpcOWJF :(nonnull NSData *)sKmwMqBpwNgHOn {
	NSString *jtxTcUjoSRfsp = @"frkNNnczLALKLctVStULVxubMDfYyWHvbaKOVZnDjPpSAkqjBeYqBmWfLcwjHZCaDdGgMlROQpaCTkEnQeGNhqcSRyJdvEdGGvemDYIEisWtjDgs";
	return jtxTcUjoSRfsp;
}

+ (nonnull UIImage *)RVQVqgALEHT :(nonnull NSArray *)TRoGViXBxakW {
	NSData *buaavAhtUkOjf = [@"IqlDmWLfiYvJSacBLOvzGUWhrrtpGgZGAvYWwaJcfloCFglOnrbPRSFNrTfPyCdJxrYjJCpXxnlNPCBEdUHSrWYHKlUnvhEUrITHKVzNmAELAiJxqdGGzy" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *RfjCpVmvhKslYnwcMh = [UIImage imageWithData:buaavAhtUkOjf];
	RfjCpVmvhKslYnwcMh = [UIImage imageNamed:@"YhMTbqJpsASSpwjwGbmpLGBzbYSgeSkvHyvjoOHCCBERcvKbkJBQEsyYMdiZxwyEKNtDOhFoHjdsPdHMkwjFWjxzXUqrwhPaRcIapZNbunlfLroECsGBTOkCrqvckarcPQZ"];
	return RfjCpVmvhKslYnwcMh;
}

+ (nonnull NSDictionary *)yRGIDGhNTVuuTwuLE :(nonnull NSString *)uhNsYXZwLciXep :(nonnull NSString *)eGCVPXKMMgKQBzLiKfS {
	NSDictionary *XhgunZapzEYpRUAKqF = @{
		@"ZFSTAKMLSaJvaf": @"kvCHaYtcPOsiVXlUuYqvGYCuTsKbialKAbTTIfaDOtdWrwNXiJoPQkLGOWQhqwmUzwcLddrKdzNrpFjwqLSvpHDlCfXmMVxiJaalLfqUaMwxFCOtjNblzBUQUpoEPfhpIuqPNbdT",
		@"zIGgrfcmPxEBrFHu": @"pBKHOvhBrbgVNaIiqUmSmMiqGjlAPWiSJvCYULRVkKudLsWoClLUNHojhVmdlMVTmgVnjyxQXRgfctaUPApgYtbbcyiKnTCbiBADDpJVEpgsAzPtKEWbCzzlyPOJzSa",
		@"iskFwaDVlIfDLX": @"nuLQWzqCswlxDvHYlCkzCeiDHtEYeiiinDjvOUBZwXJVjXzCtCwbftewuDGyCQzNzrwtfBtcjSizxaFvmEiWpYtFqWTqBJUPXUKWXXhHCopOpda",
		@"RPTgqUheTMVZnBI": @"inhdOXGMXHiUgSpBMRQNRpgjbqftFXHwcstyCgejtjbthmEypFyqtmOxgOIMntAPKkSYxNhInlpicSuYmnWDCsvVIjDwDvFMnyfSDkedHXvcgqCEjuHiKcAPSmGrYqzuPtmbgUdTSdRlHflBMcA",
		@"ObRNbFdFSVUXhOuh": @"HikEftGFLUxtpzDNXAfjVfbwatNecpUHYSTmIVCCTaFRCNUcHQfeHedWzjhozFhhntPDRovXDPBErSmlHgjgcFqKujfxHnzLAOsCVMncxIdgKqvuLqbglIxy",
		@"UqlbcemEVbznO": @"sPvkqxWDyRtndFaQXXpXzsQtvmFUPmqnLRtCTuverFTWJocoMxNIFdpUpZZTxSiNCaMeIDKTbdMIHHvIpmJcEqarLAxrUhzuRmxpgfkMDpywctHNlWpMrAjVHkCVcuswfjpFfPfTB",
		@"EATaQGCCRaBMqYcGFTK": @"bWiLVLYuHZkaYguYYuWuSeyDDeaemjijAUmvlkrOSeCvBuxnjUjysoORSuQltatuhWpVhGqCXvhhKzUJjhyjlpFVKMkavsoDfngnYRSkxquXPAJMZjoyyQrcUwNdYarQyeTGyt",
		@"jymqKjLsBbgPgL": @"gpzaCyJNTdYazvgFeLXSznVNVaWlrVACzYtnyACpiJkLLwxQsseQjIvvNYfCyKKILAaMsjtrEphBPQkwCojDQCwVdooUyMtHEsjtJxeNaTJiQHLe",
		@"fZcPYHLRgozHf": @"KZjaETramAPxYMNEarMBszVYCKgDHasOZKdRqpzKNivecFwMmzawLyXBapVSsKTKLwCxhGCOPnMoDmxVhxyEgpCkVjgUXHQkCbTyyErvWStPTsPcRlbnwVUbupHER",
		@"nRjgOSJMVlOSbpyp": @"FoCyfeXnWlYQmzXMkdzJSmVrOwTbXLagUmlzELaCSfmuiYEXkoDyfImmaxkBSFJzPQtCEhRUuwVQWZioFtMRkEUXtbsowzNpQQVLPLWXnNpEcwkzQcx",
		@"PkcCSLnCTTDAyJBT": @"OsGqPbtlNjQEyKXnRGhuPTqDMcnMlVlyyMyMeZsSttnaosZFyejJwfFhuJdLbmWdhPehmXUeCloEaEdLZzHDUPfcaFjpEUedVVaYNSJEklnppiI",
		@"WQAfMOEZgGjEM": @"uFXBPLRMSwIbDNZCwRXBOBUWgoojMGpbkAEXRdVgInUfdxLBvJFtxYGLPvvZsjRAkPsyxdIvutTmpcctPlnEAsvSckJmVtWSZSaIMrIQtWkOcmO",
		@"HCKwzEZxIkHfOnWcOzH": @"IOnblqwofyMmJoFdSgReHNRUNSjJSepIezPUYulqjrpvAzARnNDHGJFXWglZBkgRZuOXEVmGIIPNJSeyechZAsjEPSHNhZvlGHtWglPwbPvFitbnNKpLf",
		@"ietHgmaagptvTqOGIV": @"kTPNjalDemegCrbjRNjPdmSWgAkinDadyFIkdbUXRkSUsKcOJvQarlAiawfghXWKSCXMSTyomhoyipbioJwRcytYWFraWicbFULhaljoEksNtIwDodxHYmtuXqcHkMOjBkvBHQkqATKERC",
	};
	return XhgunZapzEYpRUAKqF;
}

- (nonnull NSString *)fTWVstzcFqpg :(nonnull NSArray *)szKrpIGOGk :(nonnull NSDictionary *)egBDdyfTixBSUe {
	NSString *kUQuXcugxFxZzTNM = @"AyxpWwluhCGoRhGweHCREFqkNZYiPmqBfogpHdXnLkTHUKqGrUiDPQzEBUCivxqJBsoncQrlvsvSNQyuhMeGRZAZjVHkFQDjdXppHRTTwfskyHqTBfOVVQdZRkVq";
	return kUQuXcugxFxZzTNM;
}

+ (nonnull NSData *)OPonTuaVSZQO :(nonnull UIImage *)XuRlTnsLDTwMqi {
	NSData *yZtQsqrzNgjnb = [@"mEPROhyFDwuSHnwiDQWaUqKbThtFWpfANtFdBGvRLIRFyjxtOYWLgCFAPagBcdrRIMALAmLoyJtUqyJMzFDetDmQEyCgZgMFRKVCWJRrUuEmCvwXxPLSkACaGMrucqYIxLzujeSJDmvOuiu" dataUsingEncoding:NSUTF8StringEncoding];
	return yZtQsqrzNgjnb;
}

+ (nonnull NSDictionary *)YGQOHJdARSviVZoj :(nonnull NSDictionary *)ZncbNYioGWsGmX :(nonnull NSString *)jLFSZrMhcKANHo {
	NSDictionary *NhtZmWJgYar = @{
		@"VfHEmAVMUyQbVQkbR": @"xhzVgWUPXDNbWKFLZmTsLGchdcdUSfFoTVafczWwJFIvOJRYVDclSMEEGhyzZTFDtgyVENYePDeTWVBJcfPDrMSzknCfHeDJPqBdZeaqBcLsyMjxPQNZfQaaaKCUOqGClsLYIRYnHPU",
		@"LKVmJZYnqCVCovPut": @"DwdWqiUAQTCtoirNAzTGFheYNZvHtDxpgfHjpQSTGtzAORlYMpEFDtNqiKjDofgyYSTQAsoAAMjFRHACZJnulcFeWwzmGMnOYqNGhDaFhiJfseBKCQyWwwSkxnSjxpSZDJw",
		@"qGfuuBulrOtSLze": @"SbFEdUNhCGYzloKfznPeEnzelGqXTNNXzbLvmaqECQTQgzBZyVZkZjnDthjdyejDITDzgANcSnwymbPofaoSSpJDmWuRWUUVgBcGFjAjmTqHIjmds",
		@"rgBaqoDLonBgtw": @"shwrgLxwGUQQasrerJEDxtLWRhaencMpuWyoGYjFkGAMMMGrYBsopdcQDcdLcOmajLusDIPpFqJvvxUaJabwFPzAayQzRHkGFipzwmUHADrTgwAApTwdMMLdKbRAlefddx",
		@"wAwebFCaUjovKN": @"DEOdkvVkocjgseNuPEmHgCIJkRIvZXjEKpZuCySZsnIDotosKznFUwGTuscxYzAOzkUjUvjsKpfmUKMBmaFRjGIWwHkSUsgCHXJjgF",
		@"fLofzOoJcM": @"yUuHryJwunWuZTeCABFbHhemqHAfLsNlDIHdWxtWgymVTFpXrZPqaFXOZROcXIKkHHcyTWfHtPiKpIjAAMplLAMDWIPynIxYDsvYtLiskYnRjL",
		@"oUZvipXrjobsLGaHMCo": @"pyYBxKJdpurljCUKhtyNhFlMpXtjOTkoonBdthiQBfuQtDbSrBjODxdbaKJdWspzDBsJjTUgbQXsKpIDWWUYziGsPPqHypRvIrgsyJsjSlpCvNxME",
		@"nTAiXuQQylqqLt": @"JWDDbprsSxABRNUqYyncxfyRjZNVftcNGoEqYpHunHxMyEOdECMiqOGwDZOajeulvjQElQnYsATaXWsFtbyIenSNrqfSFWYkixLRWHiNwDEhxnRyKRWzP",
		@"RIQSzZvvUN": @"ZSMuXLlCmVtPzMsYQyKJzWcDYVjiXvJBwnnIvZNwQRhrChyOmdgLzwNWYrdUIrKmCLEkiVPDTBzfeWdHoaRKqrueHfFavjcnaNVaJY",
		@"ClePSeZgwYozSJ": @"VAMrWmskEbjSRpIAaHazJHnGbenFpfLFWiYeQSlLtfcPFFdwwhBeQLyEqgyixSyJlEvEhiOTNvyhlYCFAloNeToEhrraaFwEzmFJICkphaRbsZnXxSY",
		@"VKeCfnlRgklmdrBbN": @"nZiNLDImJLPeAtxSTrcsIndBCBmOJOjWFSrnqnWhbtxnUhplYQpVgEaGwFtRHvKbwcnZnvAnyDbqDndDdLLDKixtNtjZZXwDgsKVLK",
		@"ggJaPuappySdgAlvTMk": @"CtctFtNxKjXNfQPRxuFXYYAzMOUHcNvmWqIAENfXAozoACACQSbCVgQyUeukiIWJTAYaATvJCjIqhCtWaDCsdOARChTAsXcovSwuRKjGLPqkmusuHFvSGgfyGlWVKIcyUSQlCtKIdQNFjFXaLu",
		@"JhCTqlfZqP": @"RUFVYLBvFSeByYgsYpjzIwTedtrUPBEnpBZFcoVIVMRZJpAMbUvezRzKWUmxJdYHhCngIUHeOOzQVYfDIRXeMyPRxngSehlyudDYvXheXOxPGuSEzzgXL",
	};
	return NhtZmWJgYar;
}

+ (nonnull NSDictionary *)ZMktlLFvInyobay :(nonnull UIImage *)ytpWaiRJLjJjAI {
	NSDictionary *EEKAgqEMJIqf = @{
		@"lJoOKNnFSZrXoykC": @"eSpXvVblFXFuiaQlVAUVMJAUxXPjLqwQZMZaZsVDfWEjYArbJkbVxkGJGvsOdUhJPhdCbNWPQnfFyiBjAxwqyWDkHuMotGEPFLyRWTwshtsSppzhzgkNbdyWgejXjLSoqyf",
		@"LQrIwGeoULzrPCvzyHV": @"urXxqkjRFRGqHPkQrUOqsNtsaOfClXgYrwqlpEaRbcXMWOaClWAdytWJSSswmzEmDpUAcscQnNjNpXjBtOxdMyBrpWUJHSwPDCOMalRXZZv",
		@"VKJaJRfEfD": @"nmvFLiNPLtemNvbZokfpfPUZfdTdfQQosaSuAqoLvpGMJADMHRKfBmCbvNxLURlVxOwhKaVdshyoYWpShgSPjbjQTbfpnSnakoeMEoMBoNFgexKI",
		@"IJtrIbZreGwROIN": @"aviPZzIZdFOpnEMgrUPbKpLEdbPLqzuPdKsYlvklKETmQNiltEIHjnfLZdUtqGjwifuHyZeertSwEnxajJOnihhggJGtqlDyFRfcxAFenOUVFMxkyszHSMRgxHtQwoRIInjSkZ",
		@"CXSVLswUSF": @"TcSmNViMDJCIFKTndBNmuXOlNMHpNuDdunRRRwUEUqQTAiAecywoqngJNXIHNkETRAdfsYKBeVlPHAENqTtbrzgYYVzsDSlQoASRuJIuAMztPFxnDOAcPBelRijAPQuRLJ",
		@"mmwIJpxFaFNzz": @"IusefRtPpMPTBwVyrCfMalEhdXGZMOVdnVgjvbkpQDoCFmuweMYrSXDREhHjJySjWrobngATEuKUNlkZsmkpynlebhzItyKYKrinBjsKLfMMIycLNgxOdBqvLtBEpTRlwopeZivhEZOaMD",
		@"cmAsJEawHOINAYDX": @"sJMFrnRomOdJTSBoCdlMVdqGVqgOINTGjXEVGjYfGjqZYVVFHrBGKuvqObVlCmZZUXvThLIsmEmEgMpSbxZipMDzxsjjTElaFYWCotVBohSGOt",
		@"DHcLOrUMbf": @"FNsGnVXqTtdkfKahRdMUGFOqFXRdvJGRIkWZIZaBZhnxJvEivJbYvzLnUbXMwVajRZodwECZINPjEknPUxMSVrquFstrvroUEkhiIeyDLVfDriBu",
		@"qPQBdkPmxGW": @"XjBExtrtDQYwaIsmrJBFQbvuOSaeibikwibpDXlWkyreFnpHmjrwMUlASpvzDaaxuIpirPzWXgsSFSfjWNZcwOWEILrmLljNQkpcvhslRwxNhQnIZaNZtYdjcPhidPTHKAI",
		@"arwoUIhyiWVNAY": @"XktoEiHDRqdJoMCyHhKAFKinASVRLbPwRTAwIoODrmfZcTbcgGdZlTgrzgYeMyxNYUyCyVlMiqrfvbIgSkkjkAmoJQbEWRKKNFetUD",
		@"KZOQrfOjhGurO": @"eWEliMZAaizCcQpIEDpsNcdZnwYgVTvsqjTLQbUpKCPNbFDqLsiKkkelNhScjJEAMUeWkuFWJjmweNKyqbovBnzdKifjuRkgqCboCplhzoKSscAStOksQGgDIZjOLf",
		@"dOiWadyvyswvnMOunzE": @"DoVUEgMKaQtmWvgRzoYJCqOJBtNLxzMOlWwIKFunSqAsUBwbMiJELusNyxLTHWhMTaubeRMgJBVxSIPehfQHCNeKcQYYHvLjgEGKPDzRupnOpxXhZoJYIyetgSDrnyYzmosfrcMbPVVKkPgqbgj",
		@"PXsvrqIaZDEXzJZvy": @"MBZUsXKDpCSsvDeCDeHRKUiiJpyWFcSCeoMyfNrmCzJPFLclCGGekiaYuKukArqLiVcxZmnBdyoYrqxvhReKbftatXHHaEefVWdiCcxDROqLxdPVFsZXaefcXLIDlJvMQ",
		@"QeYiDfrwazKWYmrAZH": @"UyBacmNRFBPeVFnFzDKxntJSMABCrVyyiocDONLHnCjvmLcmhBDBnFzaqvHJLKgIMtLHKUHKUAhzKvPIKBJvANxDhCiRGcXyqGjmOIdufavcmhivbNqUG",
		@"QzedpCzJwwTnY": @"qFPVyiRHbDoxqyWVLsOEeqFtjmjNMQJkmorkPBYxPGkUzwrlvrrLlSnofhAortxibgNlUOfsYFKTPBTnHoNNNZZEyCZkQolhiWTosQyBiYETWAYNUyaNPBeQsClJimQOgRTPjjhNfWpFUfRrQEuOK",
		@"GwfcCgkWCwzW": @"CaxJTssxjFpuWMROfmZgEBqlBhtWSQAQSSTzFtPKFQKKQTyOftdnouHquUPyCaGLVAoWYnbViwvGRnEajWGwmRyiUoGJuvEpNxPAaZBQPnXRSFDBrSr",
		@"ViGwCdEYOSBJjesZ": @"bLKHZliTfWCzPxEuBnZAwWcQaIfitPOXVvhRaLxCSrdNAtBIwdcGdBHchFBnWhmbEeXmVgXazNREMpUJmhQzQnLTmcywfgvFUVtotfUbKySlpCVuTFpCpTqdYohOcjhpXRolBtuRWTelKCTjLR",
		@"DTobYzSyeEHEP": @"xJMWNJPjVLwSpfZMqPovqFUhPkNqNvDEheYlMYmamWAWfPaelVfpNRBzmdzybuZgloqnXXBXmzBEcXPEsTbvJUHDWoZvMnQKfzvUAZUHKGEKydolfHJTTDzQCmzxpWchPKKlIoWdqCYcq",
		@"IBDilriAdLdDeiyI": @"uqcWzVXPJAuSwgLRBaIdEEFfkwWpyGAcTpaGOJsUjrsGaTxAlpxyTEVHJCVPKjEXUAjJTXyBaiPhFUfYVjncncoAOHpjiylUVCVgprpvKoPPwFhGexAKUmvSJOiIAOdMVgbIecJVPzcFGMEXngr",
	};
	return EEKAgqEMJIqf;
}

+ (nonnull NSDictionary *)CIeRaTLnuieHIhS :(nonnull NSString *)fsWDpIeqFizSksgU {
	NSDictionary *CExOrLNFsuq = @{
		@"NNdxQbrhARqsTbixsnB": @"XUuXBjdwvAssCSaSignHkSPmxJJfJJTOExbsAEpNalatlXulThqIPqDtKWqLtroHOeuZYaZSfwTBmQbRbylQKkjKxlNgsvPedJyiniOZNRIUtEflkbzNffgNJzK",
		@"kFhKHyCMRBh": @"eKQgMyvhNqYJOUPDMOCVxkvOLOfaQBoQAEUHmnehMdEewXcozDYmvaaVUUPuQERKvDFwjcEKTloatcuPoJaBcAQouvQllCaHxsmhZwiZS",
		@"wonoOCtQXmYYss": @"gYRBIESStHUcmLsPIQnCvDoYpCXqtQXEUOFtIUTKvPJqzlIkeXCWGrVkrznhxSxPnFprOtegRVriETVYDDSAWgOwCwWvlpKNBvZZNQoiUkxaOytQtVBYKzbxmrHaLXaUamyaePIDATK",
		@"urIEOticOlKx": @"aPodMPkCiLmSsFjRSVXUsMfjssdJWjWraZcyyJZPufZZtHONDLyuDeOKsWdDLeOnBBKArKoJIPZuhFGiahNqBkZLWEPVPboAlanbRJBvkluieSfGDhQGalrmURQiUZdm",
		@"kLAUXajdbxPcUZ": @"KWyMGndgEUeICLbcGvbZOZfUQQosLOduFziqeURThFAhgFltqgOMiEKqMjnJQTEaxKVkpReNFNSbdUTaAhCwwBQawnPXFIdhajfqiQrEWoQHYUJZHzMvJywLuFoJcMyDalJRkM",
		@"vjeRIrssVEwgXZke": @"cLLPdbAitpDwgwOpIhANjgxDOXWesCXaMZwzhTuaKxFHTgLXsllKfJLJZKdhgHaoLdhxwVnHpZylQvSZLFVRVdHiUIItJfybpWTeNNlUbOgGzvsBEnhhpYHmakLdHvIWkpKIwFifZQoIGgYOTs",
		@"XcknGZOwppNPWLoMmzl": @"tynLXJzyrYGMrIFRITXtNdzaeQrMhtaWpVqukesSKJoUtGMAeGOENVNIAMnPzkhlGAEtsZLFsopHSepxkzawhSofuwJNdPVVmcvMziNoQmeLhMnUHhG",
		@"iEhxqSwpjsHLblWRD": @"ncgQtDGeyZyUDitifQXVCHbwdScuGUVgEiOaOcfHKLtcvsiISkPiJeRFuZXyAUnYrtPrQQjJySECREewnFPHsQnmyCPmqBessvNsOTvADZRCSPpcwfCgBbJx",
		@"XpbUpXrhAn": @"fWMQEzFVPEzZghZLRgmDwpBCIbRyqVgYaPCNAjaHShUXxBbaFHUOvZPlZmKvQMELwsxRklvsOmrGbKdqlqIlUotvbwKGotwwYaRtLXRNTlERTK",
		@"lpRIERzweqtTq": @"xjlqmqUgkRkFJcROzXWCkLtSxTKNpfWBkgKtZUpAHzrFwwnQzDJKnipfDejKQoFjMYVryOcMjFyExbariLLQBtyPlmTasMMkjjGQAPiACQiZCsMNCuxYSGggMOz",
		@"YACVITuHzXVOAYmzzk": @"APvOJhIyenCXWjJNpfFAToWlJhlzQPrJOADBTvijMhTSyeGhCuXZvUzHqUasqABAkiQfMfRrrFqoOUZqEgXlhUSCvalHySgOnSTDiuKjuCNCCOKxF",
		@"iCVpnykheNQjIUAuXyC": @"mCpQYTALeawyyIqiYFvMVePyekBJSPrOYqRSXIOjWmqwAJTpqqxEfFHegPfATqUtkHWYcAftLygaBiiTwNoSkvixspfLpumHsmbEPosuGLztpkfWYAMFqcUibLaNqpBKIxq",
		@"MtdNlANhQJSxVKX": @"afLCxOtlbeyveDeuudRCBVPvNwyWLkbwreOVkZuPnabgtCdnPOJspFSvkSgshXvNeVQQoYHYelhumpLJkpBAWpPtlVIxGmSUzRwoMjiabXAWqeeIzvkAODq",
		@"pibUZghBfx": @"SAamXhseiSuVaHUdURjlCZfuviUFXqYVTpOmXFPhsWGrIMpVvhhATgbDthELGeCWndJczQcWtGFZTigztEiRMrYeBIaXTyRMSXcfv",
		@"dTlZsHecgpfxFK": @"TSuQDXnDZvmkDWSkGVeLxfiKLqcXgbUDSUsMRuTdifyVrLdFuPbcFzVZuPpQGYCRKJvyUuTZOITiKbEyaWfmhlxbuNmBHgasdlDDCUdcooESQrKDYNYltygsIQeinAPaXIjidoqTbbXteLiJzEbLp",
		@"erCwEaYCPxcfISNHxJ": @"lLmmMiYWvHDCAoKKiKUxhNwkiezoqStyQNtITCNsEZFNQOimrIdUzGCMCEKeyhQtQoXRclwGqzAuXCyixOLGMIcwWZosyWLNcsskclMSbjbSbJEKkXMXSnIsWDeRgKLUkLarhfH",
		@"VbWxKBqiuzuDInvNv": @"kKKCwotunWMGpKzhmNpXWAgybSElXPVFPXTHZeJdNjVsaLFoSiPNMBnMcwJUCPGMnhmicJkGrNtbcVhKcOEDiBXgxybeynlaZvoirjR",
		@"oavZyucWPH": @"PvAuDXaCBDEQFFNNVGhmMnnIlFLsasWcidznGPAaffsbbpBXJLumwvafBKoiIohemzGrwXAuAuhZrdjZxLSCAJYMAWjIcGuvNpaGysizecTVggGCfaPHkSlilLnkv",
	};
	return CExOrLNFsuq;
}

- (nonnull NSString *)ezSslmGjjDYVZn :(nonnull NSDictionary *)FAtRAuwyzTfIXrREwO {
	NSString *VDwTaxRXDenh = @"lvekQuToRiXhJwYHHRDPuFAbUjauikuzrozYxXpfqfHOjMJgpJFzAkuBYFcPJAhXPmzEkzeHNhJduxzJqKPBxDmCIhBkHFPPlrYEWeVvWdxRpxMDGZSLVBqXNByLAytvGmkirvBiERrMlcSNge";
	return VDwTaxRXDenh;
}

+ (nonnull NSDictionary *)eTookFAULgy :(nonnull NSDictionary *)aJhDxySREubaR :(nonnull NSData *)jTdoYIdjzjLvSpoLQS :(nonnull NSArray *)NpAbwdkQEzFwVgm {
	NSDictionary *izopxpgwdTPQhIDvY = @{
		@"livMUogMypHOkVj": @"woouFfxkPAFQbajPsEjqRwGnRvijjzPovAQNVBzkUxvCJBQwJNmoWbgMGghEIOHIrIYhDbHHzUOWjyvcpFTZOINGqWlVRjShChKyioZVxGmjYeCoisIsivLTVBKjqoNJxQD",
		@"ToDbLCznZXgMH": @"BFUpgFopnsOZelHdSRLdWEqYIUvbCeVxyUiwBmLROkmOZTpSsriyHcQYnENXQTHzgkzUqwCVliFdowQoxAnSZGNsClgczymIcZzHzpaPuTDRQtcrjzCclhSqVplxWJh",
		@"OZqMNDdzoNmVQJx": @"UKmXHKBOfSuzUskbefMrbQpMBBwxuJjSMLGmOFXJNrVXTQsXNUaltMSrgVspFprBeGBlqUHPuOoEPiGbJTRrisrESLnnkSTNjiwuJVsCiukHznRjvRYVOVh",
		@"DWSmgCcqutBQfLNSGX": @"gaONgOsnHWInsuGApiPbSFjzrQmeqSatmOBMrfOmjUDRCpTlhMvYsagKSJpIXgkTlgLiCmAWhoCaoKEZqWsvuogLeUbdceZvuiRLPtgrpIrGGQUaUOJGvcuRmieNNfVZa",
		@"mbhQNeqsBTYvHBrX": @"gAvPHyXeIwnRpoVMnXUHKpyfMmAzWeIAOVnDemyFTpQnuoOeSLhIlXnqZFUbfUFIOmUKXOCvHXiuMgOLsvdhMvVMLLEZClBBeeZp",
		@"XXCvqzKvcQVptyH": @"lmcTtskgPZuOQOKzruVskqfoVYgJelukxGXqUMIXQVRGPLadCSBkoTLtZmOYyibhuVDRxoTJMqxMEjaeiRcPXbzqXbVjxVgRIcwycXSesBbkVVdBfftHZichQdUj",
		@"cbeLveqOTPOqemM": @"NTwpsMVIrdFJSEiBgLjaByBqHBDySyenQoUEsxXAHAKiYfGkNBOEHcCXhkXHdCmgjYqLFPzJyyoeckQQVBUUAvEEEztUoDBmlbUcTjoeWIz",
		@"yvXBvleVuYuVMIJbtT": @"lELksdJXQiOXEJvcEdJPwfCESBYobAXhKYFZvXpRNNjvrzPUAsDtuvFRyDyAfXLgqvNxKwwICBZbihepYPmxTcpcDNnzXVrwhcgbQGMTflSGQLgYXSrEciAJfqhjTDpkHMpYhYYc",
		@"aqnMuzKlsu": @"fbSnUHSTxmdlQJteAgYhQQbntbPjusJYPKNPZAbBmqAzguJXbiDlmWDwayRSurNsawAGkRpXbPcwKiYfdYBGgALYjbgDLZNHrgDpcnknKTaAelmqNPRFLQebEplexnsiFpnvqM",
		@"sgZcRZPvyLb": @"yzOfNRlWzzppgmlMlAvSfslzbTxQqQuoGPfZvXcnhUTsoLOlJtqfvEoIgSYOnxGQSKcHKSJoCZGcOZAlGUQVJetALWYQZTIqPggFIyfwIrnLWtNB",
		@"WbQpAdlASx": @"VLryFrQCgUZXGSwuRCVnZxtiNQPdqqvFjNeXaeQmUJCEbAvzvKROzVAZAeypklOOzLvfEGwRWeQOKAPbwbJFmbikNcnAnXFQVpgqXOhZsyTsXXnT",
		@"LIWfyskAfM": @"ONBbrYIyrbuxySYYpfAjZdluuXImqIQpnJOVNgDpgiwYlKcjMGtpqVANpnBfKPxSaaejPsabvlRflzDYbndWDFSXKkuNDCzaIMZnSXGZKGeWFjrXMllQLpOmGMlecogUFCabZhWCqdao",
		@"EmlMcNGaptAqrO": @"qNdxTDTHpGZmZIQYyarVvrwLhHQeUJEPeCFwtqlBeidQqvSjNTurXnVYRMlFLXPdrGlotjPQEDLjgASQaUzFBYwfLclqMMoQxSSPcwUfiAgVcbKAAwxAhULJO",
		@"UMFafHvwwftYQmugLvY": @"pdOKXLnWtXkDEwTXvlKOWTWRgalBZOpfpgatDnyIhebfJZILHgQoSmuUCPHLxBNqEfldOQmlANwyBGiUfVwWTGvrxiezynDMQXzejyJkLNGWLwPHU",
		@"oTThlEKNDofdWnDg": @"oazpmmKlpNjxbzMepXzvSeTVNpGOhUCJVgrziyyMfNdeInoFcDzBzWYnyLWPbujZrikhckEeSpEkNBJSPNtFtLslzTHswVtKHzHAnzWThCPHjshAztFJpDulTLPFkTdiwbN",
		@"rZpAjmnIluExF": @"oUdUERiVRaMbSqhujtEvugFWiMoljMaRxNxwCPadtYFOiGpSThJGkqahelVDdaiGhRuESPMjSRsEPKnfyZuwaCftbycaVdfgeuBsuoIIMiXGajhCDHaXjKKBByw",
		@"GqExVybYXAkMAnBfHIX": @"LKIpaSnSdfFsoDdueIJxrUSfmrasUpUtJbfkZFFZLiclIMquSfIuAEOAKKjwNACklmrllHvxyDfyvZxrsRzZJHSBCvLTbEBOvblYxKoRACbtFGTGhxouqpjm",
		@"ZnIGpexOYuH": @"BiBJoleFziGkxWkntGHQgkPApeIjnXDlPANmxhPKtEiQzaRDbRNTEXxhFzXebQKvxlKtBGzHNLnWIRlTukAHDgOHaJeNHmZxOgQxqmsfDFsvcOOLKNacqpidsebNnqXFTissDluqgX",
		@"meBIYjWJECM": @"HrnxuGdtnGcmEXPbiVDiPWMxELlXEMLTEcsDsqgPgEVlDWbQsFOiQRzPITuvHTbMyOLJgUODYodTkCCqIfVDKdtYePcODZdJrgdzWgVINNKvkyQorGuuABKAMRfRrLCzmA",
	};
	return izopxpgwdTPQhIDvY;
}

+ (nonnull NSData *)iciBECHnmxdqvQen :(nonnull NSData *)FnxcgaSENPbPE :(nonnull UIImage *)HRDJajmlkBmzfL {
	NSData *QxbwwhIStqFYWpR = [@"yjxakiUCPRjKcaCWhNBbmwHKcuPKGKFzARaRERAIICSFFWukEvhNvUjPHQgJQvBiZvQRAcqWkMdAJqMoRINRDOUYJVdmRTMyttlACGtOfteJlKXYmyKfGsjSibwSLrRjNCeAEzKYOpDx" dataUsingEncoding:NSUTF8StringEncoding];
	return QxbwwhIStqFYWpR;
}

- (nonnull NSString *)aWUCGnpjzjMTcsQV :(nonnull UIImage *)VtirRczzlsUNLNhSVt {
	NSString *yCYTuKvRjfSJvxzjHDw = @"PWWLBpOOORiUHrAVRKXfYKItWqmTIGfCiizjBYrxpaAMRpamfTbzzSFatofJughRnHdvvWJdVSZwCIUbbCgKZswLqjBBttoQZRNsPxFJEQJaoRvGuFcGmV";
	return yCYTuKvRjfSJvxzjHDw;
}

+ (nonnull NSData *)rXkPRkDRUehaJ :(nonnull NSString *)pySaslrfUO {
	NSData *aXvscmIcTFUIFzdG = [@"ldwSzENClMSJTMMlrHbgskKmKvbZLbAXrZRFAbztQiIiogUCDdvAFmUugiORnOIpFZjegGHIVoPpiFzHWpdJnfefIvlVKeaeYZaBlcXYnIUffEcFcsbUZeNCuyfBHjaE" dataUsingEncoding:NSUTF8StringEncoding];
	return aXvscmIcTFUIFzdG;
}

+ (nonnull NSData *)ZVcHAFNViSlA :(nonnull NSDictionary *)upTamGZoLalz :(nonnull NSDictionary *)rHTnSfVdanNxQsp {
	NSData *rlrMutAmnABax = [@"qFJVRAeIrPYKzsHtCDvOLMdmYvIVaetyAXYZAWBfCpXVCspstmPkphwUyJexAdHMERTngBSBkrgiorihlHuGOWyagggdGlIDauxDNELwkKFMdqtKNhqLvHd" dataUsingEncoding:NSUTF8StringEncoding];
	return rlrMutAmnABax;
}

- (nonnull NSDictionary *)SBbgVqezjLmjv :(nonnull NSArray *)YcflpkpaXBB :(nonnull UIImage *)wMUFfFaENbrbUeHd :(nonnull NSDictionary *)HBztBFjLjclkNH {
	NSDictionary *tLJaBKHXEWgXqj = @{
		@"bIAUohkKQzDLLFkGbl": @"YaTZNysZlJSIvkRIVJiNDxdFhDmiGEFPpUjRipZoEVydKqtxQQGyqYuCXkRsNSteoOoCSFDBITbCamJbmSkcPCyFtzlXITlqiLfiMFzAlvVRpFyEUjdjZTkjVXMHpRSbrOlRVwds",
		@"cdsVhzLtAGOuZA": @"RSQULrhJUtOwbZJWfYRzEJuCPptcSBNLprWJjPHzBFsLeYGywmIKfuRhcZSvNaZcYxaaPwHlCzSSOZAcdOAqYKxWBXZanzkReUqZTkiQwkFYiN",
		@"pCxcouNbDGTqPVDxY": @"RfIVxWjdjmVRhgfyPlCblEWGjcDphPQxiwNkNJfdpAlmaAJrRYRJFrLOTCxMXHFfAgWVQUuIrTYEZviomPWmHNgiXTERsHezqsRE",
		@"ExvwIYVqSD": @"MCMjCDfoPeQOqFyTCatGIWUXxrxrmXtbdzkKwGpXHHfnxCmJHsgcjDiVfCfXPgLaEOcpKHQPgBGKDoaPLBxYPLsPKPhMyRaIMqTxqLdgWpUiahjnnYLRmYUAUBgbcITYCc",
		@"xtQNRFUAVjKa": @"tiFHNAxpwTxNxDnpmwuByvXaBsIQULEcIgkVPbbPmaWCkATqiXrpotpOYYdTHaQnrDaAggtLDUFecLhiOSpRehaCYLsNKlyfFbucutrrhaalXaxaxZPOUJnhTDoPMomQPqct",
		@"xGfJNxcXDr": @"HjkdpjMFUDfIcMkcNvYjdLHHADDcGYKXStiQkbNyYsfXrutZViJidAVeDMpJwWDuZwtzLvGFWXwjepirrAXJzGDRoIUyHYGlVJKMuzBR",
		@"UwAkIATdMStT": @"eNhiCJLzXzizBsYsSoZABTXZcDtFaGFjjBBYnKfZnPBhjIKttuKYtYwVouviZraqvcEDRmsOHJXofnSmCurHINbZmoDsWKLoRcQOlHuPFgucUZsgnXTKJVoaXtsbYQDHiIsYPV",
		@"DDZwfGzDzbIzSlU": @"ofVGIJaHrFeyhzpQRhuULpHcpdPLhfTwyEPeerrSAUfPCkuLukUcUHVIUvlhFcMkmtOZUWITBStfmFpUyHTiNpsouBRjwPmTBxmbcyKydElqrooroIPTBRHKbcEswzpE",
		@"scKepPGtCvOU": @"fKvEkSRcPajGlflrktYPUvtHPhKxWBnFLyBrGpVyhoOhHLxnUiHhCFtIFhumAOFscLpqeMDsrwFLRUZCDNqkdVboWHZpdwaTFaOkSTEfEJwNWRDKMdddZqsVpBNbWhLZ",
		@"BDZmjMIhIbchKy": @"SnGTAaasTtvhhumUtWHBVVbtIwMkioYEAKCkhDDuzZrHHUDZuMXhrYbscBBLbUEZufKbQehaYIuAHLWWaeZrYcstRzuvQRzaHbRSIaQubuKVkHxZJIcaGTWnAajtMyIiU",
	};
	return tLJaBKHXEWgXqj;
}

- (nonnull NSDictionary *)qIcVtVnXKxQIFzZN :(nonnull UIImage *)YnorplMPAo :(nonnull UIImage *)qsnytQZlkyrIUQ :(nonnull NSString *)bvfvpMKpyrbwPywjM {
	NSDictionary *esIkoxsggvNywFqG = @{
		@"LYHXMCJHeufWd": @"aBLjmRzOJyajFbvwrmuZBzrYsZqdxKfszxOokwUMBVHgZJxdejrBoOfsmWdLVzKNAvhuQMHApXQgtifzrErPSvVYUXgegNTyeXvXIDrm",
		@"LJWVSFzhdOIOwPiORt": @"NFpvTkgwlRziUqgtxMiIzWVwavDpxgrwAXNTRVQTpPQlihrCtrCantyXQIBRTTklssBGnGeFQBMTIUsYetWiIlrhualxzPfRqBgmVQXszpoOXVUccdNbCtjbQrVObZtdKiXZyizFbGHkxMJESfOZb",
		@"GJsWaBCgLGIbncYj": @"zDzAXygOAXVSnECmNDYGZsRhUAkyaYThKhZOTtibBGVvTjAIpjtEhVwxWxpBiJWxFNLQwAxCACJJZdwCrdFBYkqpvnfvYeCctQeJNUhQCGpXonzknabTHuahQGgXrRnLAeq",
		@"lfySvdXcxGjdSta": @"ZjZdHWqIIDsZCSoEzARnrFlLYhEyNrNvkJREiHxLUbkWAnmMwFUEnffycKvgsKMuEizaQbZgKqbQyaIcQuzEczzstOiOniTVQGagGnNhmOPDuDP",
		@"MCCZQKDPRvQukAhJul": @"yZHMXeQpOJsIMbtuUEClxpbOzjtiGLrXfUxaKyfyVnNyRJlZbunLdMCzkMlJyWjKNCczkviOhRaVruwLSVfXPNMYDJSFgOMCxDuwsxbDTCUUSYtmzvtX",
		@"JHUfcrBlIFuNqoqOcNI": @"GrvxcFvgyoXOuzBEQaHQvzquZBWUDAfWArcdKduTtEVVpUgkRNPVjSrQqBzXqYrbWWVGzjEdZFCzPvWJRpKPjJaeLRCZTjwKTSVHHDukstAgTh",
		@"lncAiQVbFC": @"vNmPlbInSfBwdMZldovpseGwBAlznVyePBLLuzAFxWlFoEEkqzCOwGSmewsTXLLQHExYJtwjgofDtixXdoNDUrLLTigSaajJvXNLSyRyUvUlFtTIfIkid",
		@"blykgOWdQsCQtWic": @"dnubQZsGlQraeTmaAiBKxPVUXUqQBgSaLfuzJXYbIpIqPietcvmZAEQgOgSMhLoTvLQjINPyIvrOemIOheRsPUkxhokfWDayClCzqwFAkFhmmHzeFcwzQmirPdAvHt",
		@"aWzoUgzKliwGysjgJJQ": @"atZHIOtSRfNeHCeoHapQlGxPjuVPcXIyZAHZKQdPdLHyVPMoQcoiAeZbQXNbwuegdlYZWtBeBSEhqRGMePiyrwCCTflkaDPnXSRNeyoweyu",
		@"TJftZCbTFMjOZehXDBX": @"uoZocTKmjhMvdLwWMuwgUYMbEFoqHbgyhNTJvHLlgslzhfQvJCUDFlywhHYMqEzaQDREqHteniWVqVZAIKrFRukkNQhkiLqgTwzZWggFdhMS",
		@"BEyAESvbvKFYCF": @"wYbblmXGBflRAzDHDkeUfcSSNraCTzpwqKmuPlbZKqzcYqYTAabilUzrnkZsVUTOHAJBcnMGIXDQaBZRKklSvVroDRbufdojAhCDGojuLwTefQwuOukI",
		@"HyyrBjjJSRtfL": @"gBjhqnPrGMLphBWXueVELXfVvpSjLGeBUFAgNFDaPZGptLcUQUzKgmSNgLJRMhVTJFUuiJbSMiXbBSvjXaDouojSNSdYlPVnugaOCHw",
		@"DaVWAukhiWCV": @"dOtkZIZxCltfgpBuzbAUlfbJhfMdVrFVsIpVxXGQDpHYlECvAUyXKuFXVXRqXtQYIoFkxyxlNsfEadOBneCcMhwENwziYhvLOUaZYP",
		@"fwwmVVFXkEmmuDz": @"USrvZNrzjsGmYdMgYbLwhwRngLAOdOjygNcvqhhQAKdaavOrhpvLjObyDqoPcqOhdQSGtalAuljAiizCeqOXaLaSDwyQoqxyZpaYFnuUsntTcLAocbyzswENExNXrQnxEmlblBR",
		@"iWxAeSBUSSXXvECVpH": @"kFgMtuIijyOHprmyFEjfaCABEDcVEwiNwRnYAyLOBVbOYjFxxkvHZjybuFllAjbDhNjnEIaxxXqGdLehJAGpdRCnQOtOiETTjOUydqMzgHdznedNdGyMav",
		@"zBCLtfNxwcinxQ": @"IubyeHpbgvzIecqxFOtrQXPxvrVOeSjzHPNiyfpbWmTNgvtiZKdJVkSXcvDDZMnNSmNFruyxzfpdCLosBxWaVqnCmmHayQkilAMzntQhJIgwVJMGcclcEQtJN",
	};
	return esIkoxsggvNywFqG;
}

- (nonnull UIImage *)LjrZNwGiBS :(nonnull UIImage *)uWsEGJuRHIRzPPkhpfT {
	NSData *xGjGQxgswgztnj = [@"lxwPbIAQSpSFReKQHdnxoOyeAQLanVsiyXRqysQSoTsQVSnyLXmATkBKMosmBMGJdayGDUNfLAWbRXdwqiYquZPHaAenriHIlCcaqPzF" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *HDAJskCEKLbOtvgn = [UIImage imageWithData:xGjGQxgswgztnj];
	HDAJskCEKLbOtvgn = [UIImage imageNamed:@"gBHJipmmxuUsUztxODumCzKvjooZtXIqNpjWtDWIDiWfKYtyQKKsUQXToqIKfTTmRFzgrHsmBRxyThfAzvNpNVZsTLrYEKIhBtrLEadwILKOHRFhJNcAtLLzMXsQOsMFdlwDbLMN"];
	return HDAJskCEKLbOtvgn;
}

+ (nonnull NSArray *)BroaIDMeyoZOBaRoR :(nonnull NSString *)FfQhooJRDKitwIpqy :(nonnull UIImage *)AkQaAiDFYHzyTLARPF {
	NSArray *MvNHRNPHuaS = @[
		@"nvqCMBqnjOdXcFEjgbwwcqINvQAOQUAihKJCXYBQoePkZWqWgApZfDpTMWvjgGwpwaNWUVIzciMQXfEpKdMikMPZLcCrxuQqGtrDATmoTquIeFUofEUrmEEDitSWfOPZOZKFvczWzUA",
		@"KutogORlzzdhXJcygiMukapJYDQyaRRiwUMChTrOnFhqqZolWmjgYqdKDRjztIUJGCgppetguyEOemNGyoewimJECQSfnMtipIoJjIGwDIHCIcCllAJfB",
		@"ZrCeNFfIkGdEnDYvcHuUKoJLYlwIiVtrQfGfAKotrQZwgZCwfyXhPZakwIagIJZqGLAmOJUXTHOBYfGUMMUaBRVUxXStYppWtCnoBVTygeWMTuslksDiBLyePCJ",
		@"bUKtgJqVmAtnPtAOLIOWVSTeuaUmZZlihyYIkLnlOlsGaNJMWWuxrPERakCiwCkxvohDOmMWQyUJOSPatFkCBgNQQZXORtbWQqkpEBFCZDvlZZDAYy",
		@"HAsumCYszYhugCfjYhYqJtQXCNFydWKGDQqNoqMQbKWLcYvoBMuQCjvvUECYNqQSUTImrtDaevHulNPHoeBFgWokDQTnIzhrXysRpmaHGaWpgdpsfqqNGDmiGLpvjEAHQUDgvZctWmAo",
		@"cLnKBOCuUVyVlhUekpjaylwDuvAcSzmiFijeIJTnBCnpuBXholsvGzIAlrWKUfBoOzVHKzHNhmUMdpgfFXTrmvOJgWkTUczDTmdxsiDbCFVHTHGHAcnRsYYFZsNe",
		@"kCHYJpacYPmcfoEOTZqssYbuIriIVtDNDYBkUGrZmFNXyymYmgMwPshIJuDHfJeKSgxidmmtcbYMJgBBwvWROgwYHwcBcJALkrzppRiEKJp",
		@"qWgMPXZoqcRuXlkSHTmeNbSJRPpxDUIAiealLzGysstoFbVpOIWFhSuMbNcvPYxiPGjCUjwSwDtVgWgEKhrMbUALgBbBnbJTlmpmpUK",
		@"HeFpsSFPebdvSSJTHPNyVSPPCJrQmkbYBlmenFzohxbAqITOVDmutZSVDxKDpQzsrOddiceEBDDKfdvWhkIUTOyxuAIhwHyvhtBaIjtsRBUsdt",
		@"DSSRQhqpzxNcNHJJgTjFNQFoHBMtdvJlYaDqRiIBOdnNoBndcCfkXpshDjtdsYhkfwcVbahfoMfIsNgkVnhevIrEqNjZsTcXSKMSBlT",
		@"rMhCjrrTyMyPcCLmCJahUnMVvgtYFKIITmggTgubQfbPKALSMJXWRmvSaVtdvNHTLWckxcPOhkuZwoVEteWdFzKvbagkyIlwCDyusGsGDsthBZxMXakGTMwHZjLaudhyyqFOG",
		@"RXOQnwtrlHMaKgYmLAyWDIYNXGkZpMcwLwvcYqNdREEbWKsoETCCqQBbjLhIDrDiSFEqkzfhGnsKWeJuhrCaKPvUSraILnOjteJVXERxhJhTVSQp",
		@"zrqCFcxjASwMQMSUTHNgClXuuvIhumuQdyiDPabmeOhCzfnHFOcnfHNGpFyLfIxCerDktYQQHeWllwfcDUqCbMpLXxKwjqNqOLtBSCVHPIiQqLufPFNwoPvutpGyMrMUGXwjdQnLlcHn",
		@"pJtvnBhJcFxLpuiXhAvahpHEqCxfHYyREOvdaJpqhczIkAMfonPulqKwIBobvOMxpFNjMmsWZnOTyMkQiCaPXWZTrJUnBBRFbValOWoEcZfghKZzzZAvJFxE",
		@"AnIeoGpiIiyyYyQqGXDDlCrhCpghVywXYyKsvRzrgGHyWEISvIelKeXytGSQxLOkUeCsTlsmitMeooQMrEHYbMVdqfkWEXDNdxtlueqGYrsotYeXglPkewJBhGoieBtyATNafvgLuIczNPr",
	];
	return MvNHRNPHuaS;
}

- (nonnull NSArray *)XAEDKjLAnDW :(nonnull NSString *)hcUtYGRsUbDTsLKJVE {
	NSArray *SkjzTdLMXCtOCsat = @[
		@"ldRoKyBZiLuBPdTOElrgxPvBCAnzruAOjGTnPirxKqBpsxUPEjWkZyyEFJqFRRTcsFGAXZUqsJzzrzcbTnTxbrJEaaWhJcSoXNtIn",
		@"FCsopLFeYIodvEJQWvmiDhnOLFsMRiytOLhOwBMvjqDgIIiYUROdcDPWXrxRJSCokWfduHjWNzXFhUSwrAQSTFJLkVegKJSlWBOwcHQarCqUSYXtujQnRjdDZBvJsdPZSucauPzwxrfdt",
		@"AxglIWAFMdhMCXywsNwiejdFlXYlNbVuDOAicJQhKxviGnItPPVScWFGKtpUMGxXElHImehavbRIGRiFLRJuCumdPZnKpTlocOFRzTxPXVFe",
		@"iAwNCmCkpdeibtjUWGYfJSJqGndxlqdAHiOmzWrBmpJyCwRSLjlKHGUafDYjXvKcWGrRKXcVztPkwYpFLYDIkcwYTQPEkJkHpuZyFHKoBFl",
		@"UlTHUaEDVBuxaDQkYLjHFEQIzBYBdLSnQCwWihvldUkmrGRgGUufltyOXAeJWwMRQnvwRXRrtHncaFQvKHgEkEJlGjBuRxBxsLcoUGeRTvQvIxXhIJcPjfoWUuviOc",
		@"yCjmcxUuRQxWRFZkjdQgaAOJFeKdSWXakoGIRGJJsSlTtGReNOvpKevaoWYHksMqpijQVyTfUPxUWzBGzaTZnyugNSoRiddfaKZoHeiLiXjivpTZiJBWOEVbjhwdtoVvwVCyuSRsL",
		@"dMmElEPGKNELqydZZNPLSqqqskYGKYWNGwORHlsoyWZbtHqwjpPFxiIxNhZFcNewnmviBwlqBRcRabbpxTRkKDzqeOYtEtxBcmocMHeeTPDOwPLZwAbPbWsTqbKIAlpnqolDTvAFpSY",
		@"FhkzmZfmiizKIpkpKyBsDFSvuakWqierzGSJBtqWaLWWFppzjrWoeBdqLupvMhfvGkeLmrVzDcPyLFIbYihWEMilbpSVMuqVdWdnpBwDNjjIPLhPEvQhBRgfNihgsVKexmvmyHjwMB",
		@"IXMfTemdNYHduJylanBlxkjMwEMJyfcmAhMbCRZLcIsIefUTktOTGKkIBEjENKWLOUboovFLylypsEsAUHchLvPfoKSWMkPhmclAkCYsBJwapAmFUnTf",
		@"MDfrWrkIrekozAHODeGBGDnQiOsbBCAkCTrrnshmKNJJXvTSVZDjSfJiIKHhcwODpnWSJESqdFkLOPvkFTPuSpQCpenbcYxMAihqfmrVEBHOzzSHzVqqIhKJEWYgeHE",
		@"oDUJsdbOUyOrltiObxlkwcxZoufhErIwKXfHGWTrTUKwFFHqPbhpzhdxDAdyoCePVlRjgQvJeIMLSYUomiRpsnsemIQyEgMevUiSLzQkXYZEladwnEq",
		@"VNYRNzGXlJLhOFbUTEJcQBDBXxEicSNBUdhSAogsswNWiudVEqlzhEEKeGbMDoyJvgUuCJOuvZErqMfsfxFFUjQKHIBuysqozxlajTswWlIPXOdphc",
		@"nMoBYaJarUUXikJVQEgTbJiAQMSnOzLSxRssxeMbMDzWEbvKhercIitAvYGMMeuIzuUAlbfaDRZMjduwCDUQcfMqEksXUinacuyxka",
		@"NITRJvuQHtfYgbSHpTpLcnimjPkCYfFDiWsiIScTweSvCNegOccynxjXBscrxEaQzwjyIMbLSBImTOQVAlqVRgAVEAzSKDbjkRQURKEBcWfQugysxCiVoUdBctYgPalHPHSDxFQrua",
		@"iljpBSmuDAQBxhcZDyPzUONbnIKcfSxANlVbUPQuzVFYFpByqFwJNcxpKSruRSIjtURrfjQSVwFBGLgHrrhCZczXMLBORTTmQeoZoCtLSgMd",
		@"kTmPAyEXYXkxyosklFKHujNgcQEfZkCMUOiPXFLdbgiRbUOaRnaQmncBIFiInolUUNDWWSzlQRkqwGQfTnWqPiOQQsbUXGzzkNqRqwUGpefoUofFwUjiSvhvYJeOeltElEcLmAIsgFJDoCKyMcw",
		@"JCqvGbYndWgOxhtCHJvQgezKNWvhCwaNwNGwGGUNbSIYyhfgjsqBcIxmPtXHNFyZhWObdfTWlvnlqfXymEgQgNokiwAPSZhrabnlvEzMexFsluSVeozWBentpTCBWQxWyEupFVrqT",
		@"eZgZLgOzjgktwkYXdlfesCMqYvcMcCwCyKrxVosLiKxygkFHIGKhjNjRWsWqJOvrHFJXjGmmdzANFGQSArxeVPeyavgyRmRULDjiwuyZLWZaCHFAVmtYMhkdStf",
		@"dipvlqAqjobNXocIqcjtlRfhrbLfzCqyCLsxDDFGUpYpKEORNSXprsBzgjkAnfKLWUBqwqFQBqcljJxqKBVUduUWSsVPxrDZePuFgnLIglSzdrdqSmXxXhmZAvrwfdCKNPu",
	];
	return SkjzTdLMXCtOCsat;
}

- (nonnull NSDictionary *)HciwBqjQEtlEX :(nonnull NSString *)gyZeWSpOFiiUXreiD {
	NSDictionary *zfssAFGoOxVmmL = @{
		@"FdTFJwiMoxCBs": @"QYSPWMNxSoSxLMOpLoGLsjsvWJoMdqmgqdVbTfNdUgKcVJUCTlpeFEMTAbXiYFFNVKVewUQgBlNHXAGUbPeUehVQjQjwcHkPqnWrFCWrTXCZnkCYmqrpDKllkaOYAoegnSl",
		@"KTptqiycqXQVobqW": @"evsYAWhGBOmVWNGOfbsFeovuJPbgBNvIXUsgweOQCcNkDEbRlPvszAdQcZcgwJDTRgAsoEgqIgYVqrhkAojVwpnFYORahIBmXLyiHkvXuhFUUUXPegcNlQFJhcaZsozZdpCRniYVIQb",
		@"axQLgmCAWgDaE": @"ypcqchMyRYKjkkKzLcpdZLTZXnspMqDTWswVngLqWkyGrYptJOocdDCUseZzMzZcNBgBvTGBMkEppmrSuGmnoCJALFSpVAWOqWqPTIFAsDMzLMxEdblwHxnberoGTGztDMHiiO",
		@"NseLagMnDaVeBclNq": @"DDciTeItwujIEOmiwykUTEKSymaKnCIUTfTvppPLOlEEJFOdwTaOYfBzmXSFglEMBqiVxLLoexXPSGrqqgbhWMoHDTpvQyTVJNaoTu",
		@"FIxhsmVMlls": @"ssralIEHfyRTkcniPVkcqQnnqTQFseMikbFtGGRaRcFhlcSAdfpaXAtzlFAlmwFzPzMMxIdKCFKNMoNripfFAJXrQVkEqjfbZxFkOlxOaOqyjhYAJyiwZxcOZkqDCD",
		@"zDwNhPjWic": @"iheiicpYyNLRvTvYrWvzHmoRmnPIHJnTqpdlCYaPwMvKPEPVhEqijdwGQhaTTWmfyUFdDoELStlUeGTdOvvtEPjxJcfgIAhubMRQDxjFbDcmObQQvuRYSWdnb",
		@"VTOCJBlellZOkE": @"QKsGtDRuTZPeRdhceMbnNSBCCAOmTlHgDOeQANpmhXkXWmFrGhenOQvQgacGsqGcrzjmiwdLBikzABAfYKgXywOueRbHQrUWLKPwhufGWIuDDRLNcBOjjRRVHseSKPIXyFJttprliaJItuhLQ",
		@"TqndPEOSybwllsDAvJE": @"oudZhYzPyXxVrZqKEWnvPNLfnGvhkNjGVOhDbccIRkJZaSEnXYEDYpSsBtRCOtospHZdEDTwpNNIqVeENYmIUVSXXbaeYwHMgofzO",
		@"YjrCCjbvYoDILEuWVX": @"ziaBlkwtjrXKsqEGCHmrncEHFkgXaTUngzRrYrndQVhoMfwCeXqzNBCqsRhPDlQauEBqLKSYKvPtDMxdMNNYxOwNoXEReKajkbGhgMEqBswfdyrxWuBdhoURzjoEGrUoiEvyqr",
		@"fjqkRnjgHhQl": @"taOVFqLPyjxKlrqyeWNLlLHsvSoQRPDrMfDTpneJHUFhSkxjVCqXXeanEjgmdukPaWkdVJVCzOFsGstCXKGkwPnppCnJnakkNPNxulIUymKVNSeQnpUHtABVRUPFiIxzTxGaKr",
		@"KkcmGadhnxtvmEmnu": @"pMhXyvcSqeZCeiRrnykLPKiVSzCbmJqpDNapHKpizOrsBtGPlmZjmRfqluyMYkYOIHDjgNZxpQgHBnoyvDGIGTLghFvZFOfRwJHDTGWePbLNgipHbJ",
		@"kHuUHnYMVga": @"gEijQsvjWMiXbAcqJGyNfJXCjfHLVnRFzqWiGXXoXShfzbyhlvJofkPLOcXSeSWOlJOsJOdAcSoNtXIYpfFfFtoCNRKZJloHBaikLKKRlKDbOEUYGbtwziBIzAtyWDutRSjDAipVydMgVqgBAzH",
		@"kPOWXPyjdmWlVMFeB": @"GBxfxGfFLfYbYHApkHGrBUsKyPePiIiPdMWKSFsObPUMlFvjojczERsUMqKSdWwbyyPnyjAPBJfAFgtcDbuEbsmSQRYCmImCcKyS",
	};
	return zfssAFGoOxVmmL;
}

- (nonnull NSData *)VVpAygOwEOyxDDUZEc :(nonnull NSData *)SlxvSsYFSm :(nonnull NSString *)gXnHVTLNUgMsOkBD :(nonnull NSDictionary *)CLxnEdKLNajvUBMTOK {
	NSData *QrSdBXzrfUxqyA = [@"feOfhMAqDZUAHyqckkJrMxxuJTQNaxeDXPOtBGOZnHdzOZKcykwYZOnpfxXbuBdLjLkWFKdHUoMfJkcLvULBvuJIARDHaLfsAidYNbqSQANihNhDGduEpZoaXrGkkrKCPZIhqfwTRcWRh" dataUsingEncoding:NSUTF8StringEncoding];
	return QrSdBXzrfUxqyA;
}

+ (nonnull NSString *)AfoTurcgJXnBldq :(nonnull NSString *)VyqxlaonnNxqXwfKXxz {
	NSString *vxoFprFtiOPdY = @"SRcEKuXUdhKvkEvrHzxYJaRdUGQKxbZMKBIAakShhOVIiPXcdyxQDztdZHsxYlJYMSqIJXBXSTuqrPCFoNBEkkrgyJxriPoiSdoKyxJnqeeNquU";
	return vxoFprFtiOPdY;
}

+ (nonnull UIImage *)ZvPOlOvTBdKkHgbSc :(nonnull NSString *)sQXjHYIPbqeUtCkqOcf :(nonnull NSString *)eGUSrrSgFzEfZg {
	NSData *TGXcAfbVxodCyhcvwZu = [@"GNvcTtSasscIUzRxQcqBpmANWPNYtBqHKoAlUHgJcIfubsbOomMGwWDVPwizqfJbRGPjjqDRgLivuQQqahslLJnfqtpZnvhvdBbZxV" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *eeWLflhKvQXdmyqYdh = [UIImage imageWithData:TGXcAfbVxodCyhcvwZu];
	eeWLflhKvQXdmyqYdh = [UIImage imageNamed:@"KnlLHffvYWYZFYGtigbcoUOlqdfmTKTguTFQDMBqOPWLqCYKARegIpKvjXDGVwfDmIVoovSJPFkLvjTRAgJWWbFcmYFTVtCYVlSXpt"];
	return eeWLflhKvQXdmyqYdh;
}

- (nonnull UIImage *)IgxnWkfcJS :(nonnull NSArray *)YjKiLLcLoIpiXYKjg :(nonnull NSData *)coViizSyhg {
	NSData *hBDgmlLWvCTKfLMraHr = [@"DdhvcRKJxWzQtfJCPwYbLlrxLnpoaglAzRGuNWWHweWjsCEzVuSmLspWcxTjYUfTGVnsCAbRNfVgGqeoXFsJbCJzYHflgcVttuKbEaTtWpzpuatCxxQRIFFxeDQiCSzKafaT" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *zGqlzkFLChuummY = [UIImage imageWithData:hBDgmlLWvCTKfLMraHr];
	zGqlzkFLChuummY = [UIImage imageNamed:@"nKxeDwnTZFQEkJdBeKwtfPONPRLLwYAQPrNcVuJDTkqUySEseLjEqFmgMwLyhGfoJbzzpkWpVBUieQKsQYpsKtSZqTRKJItKSWTxRXSOEhxyglhLOkdgHJGxqhELGkL"];
	return zGqlzkFLChuummY;
}

- (nonnull NSString *)BFFpdlQMFUqBHbLaAe :(nonnull NSString *)yhaosjhlcASTH :(nonnull NSArray *)iwLBYWzSnLPlGD :(nonnull UIImage *)DBTgAtZZiLEWEAiI {
	NSString *cxAwfkbWuTkTewkS = @"KJUSEKnoGKZGsGGxdigtpojeljuJXNiwbTvsrBGyzHPdKpDdEYoCvZxwGaBaMulwIRAoJywQdqVdmqkSrDoeWLSYoDUjnYmyeQRbkUGOVhdohiVlVrfAUHZWsiDDgIKCQTiZjHMqNEEyVFa";
	return cxAwfkbWuTkTewkS;
}

+ (nonnull NSArray *)siTAOFunPM :(nonnull NSDictionary *)QjMyYbeqExxsnIx :(nonnull NSDictionary *)KjPryxeDtbIf {
	NSArray *dnUsHLYMCCrRjBeLvT = @[
		@"mhDbLlVpFykbvhOtSAoEBpPjmcvyCAajhwpzsCTfxJTtqZpZFehetKCkJsVaekautncFsTTNTNPeLAALzplmQTlqSgZllfUQRdgSwrdcDHbnVVrGwHMzKFDiWdffZmDWu",
		@"hPqbXiFqxjYmoZIHgsZqvsYQVcBTPsxPijlPrrenVCiakfURYkBZWdITPJmJbdalcYmhlCpWrbGPsqIKoIklROeMgmXduTQICOVSXffhRmqjtxGuchfGbEyYUOJ",
		@"oOzzKqesjaayLPGnTLLdHyVACvgdpqAaDVrCcqaxPLUBHtcIswCttHlqYaQHnyTtlJVewshoPKKXhTwEfXugIABKRUXfxNjQEWxsnqRRMSiARPmYlWOHaWltubgiIP",
		@"pjlNDiBkIWlzljTYhlXSuCSOEYLOMCjNfMzsQJAXPEengngtYAZcajuzYSmaKlcjyBusTVTtWnMJLmyUqPvRodwnjQnOvnttGrlZCEcqSGLEDUP",
		@"NlxnNMvDChczBzBANTJoeWJvfdgbEfBteCeQzdJYYdjxXGErPpbVEFEbvxyunAkxPxlKHVgHqBWVCoFMwVXGkkBXarHteWMfuDQgCGGhnWprTdFrOHla",
		@"SwoGJWCUxKeeDncRByNqOQWFVRLyHhofNcoPPWvOSlumstyyYDylXPXKtOiKklxcOPgVsFJVgUidRlBKHWMwoquwMfeZrgeltyIBuAGDLpNCtlOGWFgP",
		@"XDrDMUvgyqhUpyNQaOToUwSkMKhYvCoNYmdyZfQkstsROpSwZmEAwTzTSboLBiUzytUOnkVsxQVuMdXKUMmQNCLVmDCsOMQyDtqa",
		@"EfKADshZfLZLTiquBvgXenoYNSCZcumeOtSRSDBGloHNnzYIQlxfOaIpgnNJpxYdiVarcODdmkxVGrQQSfkPZxzTEwENSwceiOoDmuYTBiMB",
		@"DUyWVsmpudKmWUyMpTftFeeZzqXcJzwkzBfpWuZCHiPTomEASHvNqqKPNZsbMFYVjGZqAFRTwYZGuojHCjKDiqDDmrswaTANLHFWpFZUhhbqlNXkPPlbZhXoWdSqxxqwmIXDljGadW",
		@"EcyLoMwRMYLgbOQwwiEmASivvyvhulLLQXVNnkbpFxYkDUnDyMuAtuMDODIJItxtoQAYowelvWyYWQwJTHkjAFHxdAOwAiIqIhvCtlGPQBaDYwuxTrgRgnVsVYqNQFnKHu",
		@"qVrOnUcPNkdmCvGhjPKySrndXxGimBsvCdVVnDmdakSfxdKCyEplFGMvAPwUwFElCXiLXyCVNEyQRwCcpALFxKswtMwOuWKaxqQiBnLePIuxVshFpJyenNxocBaQfXeKKQvrkWDARADvBv",
		@"cMCZSrXTKMSucIoeTZgNEjRaugLUWOZNMkhOpEVGZiybZHDayTvQaXlcCTwfjAsGUXiCuSioQyBBRElLVxRpTGssuRvIMtxJKzDWDUUKlrIWGxklhlQvJfo",
		@"JDwsOtyveKVPtYfaFXCarIUvSWawbHxcpTuflinKngUmEYshqYbJKrcgpyNPUsWbgBopwcnSNiBKscZfnEhMKiPPRKdqWZLegmEQqBGblctrQzojsZJUKt",
	];
	return dnUsHLYMCCrRjBeLvT;
}

+ (nonnull NSString *)HOzFARgdxQIvmIwM :(nonnull NSData *)mAcoGawCVUdUvTBZOuD {
	NSString *jbhRJofspnIYPZPzvAq = @"YDknCJPtDclTkRfIeiwLFnKUSkDfcHUCOsesIvfbIveRXfsdCvsETFActUfYRrNAASNmstBtJuGrICTWeenzLBtYPRlMYArTuPmtAwxtApdRzH";
	return jbhRJofspnIYPZPzvAq;
}

- (nonnull NSDictionary *)QTNPXbasBnyj :(nonnull NSData *)kCuduMFWyYTyaa {
	NSDictionary *InwMhaOleGuSRVlIGh = @{
		@"ldHizOFktE": @"njVgVDrxobjfRIjMOjjiLQLsTxvEAsJfzvFFcfjCdXbgWYMMBRtINWwMjhhlvKvRJvDyCwGZSQfCwoOBNokuezrjzpHzFSRNgLgSCkHcMBQypdMMAAzvQlyZojWLcI",
		@"oxmfosYNBliAIdcwmEV": @"BpBMSvMfkluZGFCzocfaKZBFoAaGKRetxLkryMgstZeEvvraGxCGFkynPyqCvBxRSOgwGVYxJTZauhLzaWjJpLrzGhRxVavJNYPIMSguGBYYISZoxPQeFYekdMgkEocubSiyIrfFmoFMGEHg",
		@"CcYZsHXWKeHEyN": @"SgZJMpVJppnDMkQTAasQUFNdfbdOgYGLwurrFOEpiIvSQKZozsfrcyYqlMPSOEfeBmurwiqcjaynRMjYjUSXyzbGEDzaTLiAjSTDihQ",
		@"anzUExHIBwh": @"iMgcusPWqwruPkbQmFgMsIWHGpEYvmxorqzQwygqhYORSlEgczJfuCCufGjvBohsqkFiFayMQtZqExcPmlcDXctRsqqCJyEaHsjYLpd",
		@"FfHqXRWwWYgsxodSs": @"YAGBiJbbQqASIfhHSXICrlLjglmjSjFxJkKDqOoZvAmWjsNfYZQwxhljPAQtLKaRgSEXQGZaPOreMyyscvMWRZIqVOziPhFRjeLqNetUWLhrGVPIEszkEClvDOICUNFmdICLwvGVx",
		@"whjStLkhgxjSUcNHXg": @"AGBVwfAzooLcMxHXnDWGTOaxnooPmxDZGWERcRUVSBgglIoyUDOiIjTnNwYIgaRHnMOZkajBYyoKxaIyLQRtPlqkmIJgkHGntWthi",
		@"zWYCFotJHbwtmg": @"qYrfbpbLWUzzFudSTtIdwZFalSoRCdGEhqXxWwziRVmLiISfJngAwOngatetKxIsZMQgECSBSqtxNgBkXksEvdfnzISRoKfUkMifzUaUVDRMLlMCOnl",
		@"JedgqJmudLt": @"chFhZtAbasbVtaRuzejjSbYvIDpoIABQdjrEknbrdtdmsfzhVqotndyIWiEwybfnhTLKAsfXfFHqCadBkKHpRtJcGtMBdsJJcxRWSKJgLWfjCIwSYDkvoGJHF",
		@"IfZfhZvwmW": @"tHDFkOZjhnAduCFCzoElMpeSBckGpXVemLqVTFDKjMZhtTEZBnxOZbKZzEDDgpaLxCRNlUVWaqQozUBPiAbUrdgAxtAXDDyREUVXwZViTxsnK",
		@"RTIPrFNXbILCA": @"LHLLdxlVjPQWssiXNmommPWrjsSgPKnTErXecQCBXdOTbByTlVeNOMttUhiflVhEPYqAtTCPirzDqIbwoTsvdCoqZRvdQghNbOwOpkq",
		@"DjlCKePZPJqPl": @"xxNnYrioKFGdsMRfEIQHddPCjwaIEQdtVGGhlORfedqVFFpELOJgtWDIxhhJahLAdCrIHfLeXKjnqxshXtmCruuBsPZOjbHSLAvmzxYcrHhBIxpluzIxDkxRwLYnPoeycnoDLhF",
		@"lCawXyKvoSceNVn": @"EHsbbIAYWFRBCZashntQUYibjTEJydWwnHMOTzMdTNehlrKHbKTFIwBrKfrKpnULNlXtWrTRdOPvnPihxqvPIkppdSjFzLvSrhSbZILBfVRsmJaDzEHCCLWTKLKCORYKV",
		@"spofHUzwJMfLY": @"poZhJpQwdJSaDVWWZEbVsNwuYFnAYfQitoYpVUblaNWUidnZIUTsyHUvLmXmtTrwDmrxeIrpYudkkoYWAjIlXVWqpCisrpsfbHsqgYhJmQEhePNvvMNizAoDDgPYsgttsgZghmW",
		@"lKrOxDKsvEuHBPf": @"ATmqZoQDGFKLfarYjFxvSeDjeYKJNMUzsvkVMAiEIapgwBSvPOChclIoDBYXzbRrpSlrpSZGhBSINWMiqRiEgoZiVOKqnmphvXJOjbqqSVof",
		@"kDDsufwAiaSPTiw": @"xjVXgffaZfxUHvTgriwxOXvUogqQsEBIPQlXdGgUYuVudKjwCrFhwXXabDyKulpbPzABkCinvJIeRIgyfErKUGsbawwBxWKmWuaXmQDylhAuSVyLjGzgqSLySENJyOwneGubewAGYHsCaQXNk",
		@"lwSAaXcAvqG": @"WJAKSpWsEYhJSPccTzGbydRPOOewGHptnJCKoLcYnGminctbNaVurjzvURiOmkWVfpMJhzwXnvDiZfPYCAlJmucnUovNYasUnyBdWvWDmCvUcwXzYsFDOpHeAgBokItCYorBWSqAhKTbAla",
		@"CQhcQQWXzGkKkF": @"cNQAhbnnXQVFQesyamulnRfLqUroRrkDEHoLJEDnKNiLjrGUfCYcwoQmYRQlaaXpJxTgpGAJxPcqjAxVBAfHYNObiqkiQkgJKhigIAyn",
		@"UDvtfRNItvPcfzJ": @"PIDNrRPCjAeVXUddUdlqmwVpFTpkDbGQtXirhkaBYdHxtXaLttWjQVFsDLpIoQHyvPSHRNOrsBHdadQDUblamqiBhfPybRkQUknlKjKeBCUjXLDeMknarYlgEOOrcfaNuKFYrOibmvnwdauLghi",
		@"yrkrYFZCRd": @"uSvXXajOkcvJNTBhVXBYNNBTuRxYXnqycSKLekepnsDimsFlSQDaEoCUCRKraEHNwfbBRsUzAsXxKOCrUswVCsoxwScucJrYDFKxGCuHXPXzbkZnaMMjoEnXTGuSf",
	};
	return InwMhaOleGuSRVlIGh;
}

- (nonnull NSArray *)RueXwgwNBt :(nonnull NSData *)pDuHYELILGgnnp :(nonnull NSString *)FKgmUCgQRHqKkja :(nonnull NSDictionary *)yXYZjytGLqZkFueoKCz {
	NSArray *WHMEkDHWbe = @[
		@"vcRGopqgyFDJqiOKvmnTUZQsEXXgwPRPMxcZJjeCTgWGLSCFPXxYNDLIZTxnxBKJsXOEAWptExxpSyJPZjCpUYihZOSSdHQBqqZDpIveoEesV",
		@"gqgBzinPmqprAQGIizVePdPDCgSiGCTMTVwnGxprpAWYtRimoHBPPaNYgqRpBwDjrqqDcBYvCCbhdEGRNOLQPPqQAdhbooTqoNHjEmqIlVLzkpUrrhAyxHiDVlAOA",
		@"njNJVnhFpsMOFaLSxNsOTxMluOFhSrkRloIzlgxSqoAectOOHkpUTsgCwglMcQSJOspRbJlNqvWHCRgeUanaGIfJMrDQzRIrRoSCpZjqtsmETQjfrXXZOljFyEvXQXX",
		@"rfvDBOqiEDVrXCtMyzaUcYAzvXJDtntPEViJrngxifBeGqfwiWjEIAmIlluIrVKEFmxqOoIBwqRbCsjOKuDWEGweIeKtMuQcHNYkfzbonGwuDUzdzGbqniMnvYLaasUyIPu",
		@"dUIUKHqNFosXmhlvtbkuENZOTFhVcscUpFdbEAOgMuqoaCKULxEXBLbDCqTixRZgcncjXmylHOlGIDOLUQXeBwwScnzlOyXdhmlKOKTjbuckeXGayRsMLzBhxqnnwlMOiUgWLaLx",
		@"jmLAbeUSlEZXsXFutTnystPuivArLFBwvmglOrORLpHakAJgrpACoBcaOYcVsPGqswNROCzshEBnHYJaejvzqfeqWNRIjvOoTsiuEYLLINAX",
		@"DiXLHqtkxTgkSlzeZPurhhVniEXVieieSPQiiiMSFcHcRxybuLxuyLjUyOaONOvpfjzApRboBGxfXmSxKsXCLGckfwfcZAGbzakkTFfnfMxgqplRWreODIMgkFzqEWTsFtILHCdVvvKDjStPhU",
		@"rPvXvyzFfYVLchsfPYQoUTHUhsDozPEOXEdvdUMtkirAEyzofaZYyDhbKuJwGPYlgEpTqycDyYLntkZaDbBNpNQjXCtYIqZPjDdAvEUbPlleriXkOWbZuZCTgPovcYpFuHYpEW",
		@"QOsyvDtEwJECOmiUxdcNvRGYibMxifxMbdFRoCqpoOqRiyAywoiHTQFgQCeYGrZxZlxPKJvLkvkhsLiqcEUpMiHPMIQIeoMiDBvcZZPmabVenpi",
		@"yZbcMECIflUPvdYsfUHqJNqsSdfkVBKQBxPnzpXVnZhbCgBdysmHvDqSTnyUIeXvCCQOfwlGrTrHJDMpSVYvPHoyCrmGkxZEfmUOkGiyyZLvYutcEtjnzuANdlYfPGKBdAMlRFUXIDpWq",
		@"NINXxNVbVwsljmXsNHQJmDICftFSOJSAptXiVeWrltAZhugZvvIPBSiWyyZxgwqTIZseBElhMwLBPcBHmmLpRZwfoBLjZLtZGyqWZoGIjtJSNZBKnfpbvQqXmNcLJjygWwSzYHbBKLHT",
		@"WDTZCQCiwbJJIBCTUBXGvlVHCnaOtKRVsJJSNuCuZICnMJHdeHpqgeNZjphOXOSOUcWmxqEsXBYiOYkCOERIzcuaITfpwZeTdDwrcnMTRLZFQtwPZtrKzKsCHI",
		@"gaBQexaNCWYKsasGSKNhLdZZUftaLoJWgZQRhelKcyyyvndUwCWChMCMnCCYQkPHoCxCViZbNrgvePNmLRJdWrhUMJcmFpdOdZELwBOpkKvacSLSCLK",
		@"vrSuSBPBiCNzbEYcRmZKQGmoigEuWGZGdibRJEzLSKabaSGWlvJVvNtCfdUAIwEyvAftGYNQMzRnxCGFYKpDGEBzMHRvjVolowcFrpDDLvFsnlZXVvZdPkjx",
		@"RWiUcTpekmoxgBlKTlDtxntaUcvFhhqRwAeBVTazIhekxjKaprPjaBrUIrlLbuSJGjymPVlPlUDllGMSNxcMZNXWaGoBMvSCJwbjBpRcepsytCPflFKqXcUk",
		@"mngnjuWkXFijxHapuGtFmWeVNuFuZkpHkuFRYBaaOPmpXMexMOWzjwRuCaOyMGyLLpwphWkAoYhFCLbtKIMwbHMiGHctIvYxRCuAAoPgjTnIodHTHoqtBkbzsfoZdeLSIEYYIWIvetUUXK",
		@"KhGtvzbVIqYQiwBbjxrRfwfOJpYNfbfoBmdxILeHhvtSyyoEvQHSAOFSiVzKpLXzquTQXQsrxFZvtXlIFIuPaBPrKTpqmBTILaoPSiVgTgAYGqlOyOrGQfKAPTylItiVyjQVfZJWYHXbZEYhwrZAP",
	];
	return WHMEkDHWbe;
}

+ (nonnull NSData *)PiBAdwjbIXGLW :(nonnull UIImage *)HgtYvVBzyaE :(nonnull NSData *)oQFwCJMuRews :(nonnull NSArray *)uWiFCqAohoxEch {
	NSData *iAFjuhPXiPpG = [@"YABRwQdbRERcgtBmMeBbxTUvNWFzbOwLUlrAatspCatCmfeZcjpjLXUCVBnOOvSXbyfYAefGoVHndhhCEvDNkpQWXBOyIPeSCLpSnmXCvRhmcCVwM" dataUsingEncoding:NSUTF8StringEncoding];
	return iAFjuhPXiPpG;
}

+ (nonnull UIImage *)fSJUGTemHFQnaLGFczR :(nonnull UIImage *)ihXilGjeLIpnruJm :(nonnull NSDictionary *)yZiqatNoMpBMitUzTR :(nonnull NSDictionary *)uowjBdyGTHPwPH {
	NSData *iWTjmrGfCLxzC = [@"XBRtqjwifYwZkKTCAxJcPgeGhmUqqBueVTvlyWTrXQXFWMXtpsxThvhyaNlCwgZTBgMiFLgfoXoMaZdAlAUrwXlUEddmGwCsNjomZcLCcMfZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *gUPEnDLrBHkSWjElqB = [UIImage imageWithData:iWTjmrGfCLxzC];
	gUPEnDLrBHkSWjElqB = [UIImage imageNamed:@"XPpLEiFodukdsxsEJGPlOpBaOuGhkQydxoaQBUlEVILPckbMtxszmZLjTTgYJqEMQcPCVXNzQBsHfLQruHypuWhDQIaxeezMhwzh"];
	return gUPEnDLrBHkSWjElqB;
}

+ (nonnull NSArray *)UzRYAJyIJiBGP :(nonnull NSArray *)TZPbFtwztHiHLxXd {
	NSArray *HilZnADTbuyvmYcuTi = @[
		@"pyEhBZgbKTSBYEdyXLgeWFoRWfNMVHlrnLNXmgQJjvrrdkPYRloYtBICDicHgNlgxanyYXHCEswICzefZEwmvVgHIcILdzdqFKFbizWVtaisACcTkCi",
		@"SiRYgrDvzqqWoqnLJeECNSjFFDXbgGAhZrDfUllBTQjGIosvZfuMMIQfUwjnPhWqdIcJnOPMiFSuWgAjdIGLygbXTlPlFOxdxkTFTTpRnriVBfNkZAeaoCkR",
		@"vNovQrLZnMMQmyIgImCoBwmfHvkPHqFkIsFiUCoilWNJwWAflaSfEKHgSxteSqrkLlGwAfSbwosJVVAFpyZfKUZcFPQTWIcVSegIiFDUsayWdsAqZwlsgDsToqpTiz",
		@"IfRltviGyRdRZdavesgXzyShkhyNNDXGEhZhoBQHcrhHoczgqUAFTuwzwjmdmYyhpTKrBHItnydEouvdYSfMDwAozKgolFNYGiWbbIZJmAsdDqMLSPkCCigaGq",
		@"WJbChqeAVMyJmqxvSwVXxnbIdxNrxfxCLFdffUGBlVOfsiBtHLfIFBsHTQdSzZlygNpBHZfzFLImqbRgdYSnjhTmoNhnBLFhCbqCEVnlCOcAMyQuVDZUcfQUQwJFeTTKNECqyBsJtPjAvvspKHAiv",
		@"zWxkPjrARQySdfxJZyyZIOpYJGXELsBcUoxvpalircAKGCQbnTTXwMuIBWdVCRpUQhwRcyZlUwTVlOEsBSmvApJxTrmtINptOXdOUbzj",
		@"teqYGthDNpKKBvJLYvdUcpQmjdVztHYWltktDVQoJZQigHUreUZzteRtTmDATLbZzcCIiNwdYJBgpJfRQjQcSFANzHSYBObpfyzMnjAQTYYAzRBxRgttB",
		@"qctdEWpRguKibYfTTtAySXmmIFeiCGSGPBVxpdgfZkeRwMfLnFEgCkBOTcoqYvjvbsCuLyYsQnGoiujbSRqpJNPFRsNBPmKSEjKCnhREu",
		@"uBWLtzXTeqgebpaergrcOQmNdPJLVFssWbUdmglZEkZaNdRYkGdmOuySYxHQWJKecWZmBHtFkYkSHjlZBvDFpOGEcRTuJtluzsxgYyJBojglpEWkDiQbzNDQYPDTrrIKJTXX",
		@"aWyNlZyiYLmvbvEerHmbWONhafztoGAiQCKPBmImNuDFQallSCZlPVNbpIMLcMOnXZRfctxboochzrWgmVjliJCRRZszEBoaaGrKMHnieUJ",
		@"szlgGkeSXWJlfWriZYMOPTAYfzHbbfQSbCINWMUkiPbLXsylfvYAHGsNjUnMaLcbBoTjEmPNyqyeIFzvaFvYWepUoHZhruGIzBrCBZmzCwnPPqdc",
	];
	return HilZnADTbuyvmYcuTi;
}

- (nonnull NSArray *)KMxIjiWVGKyTK :(nonnull NSArray *)RSLDsXjIiVKeBXFcJ :(nonnull NSDictionary *)XfLqwlOsoHe {
	NSArray *nemRhaADVgYzUdrqZh = @[
		@"kttTbwQubcnYfKFobYdNzoBlEmOWCeJMXUjfeyUknnkojMrfmrHmphyEQKDXBZjLnwoIsShaCznUvpYZmcnhprQFEFLEdBsmEnyHfmiCDGwocAbNcDHIpHOLEZQcJkNzGhFllrrbgmTZnBz",
		@"iBTGAHYtyLSFMdIOXwblPFiAYVCikMItjQmZyTZUxlBqlwokFsziMhKSidDqmYERIGTvCUUWCMQlksjTSxvYJAHLwYxcOPAwwOgIUpitxLdfuCqGvOiomGxgZUlPqcOs",
		@"mNmjjEVxKuFTJNdIiuyTnMMUlOHVeNmRFpvxBcntglbjdgVTMbSiOeAWczlMaLBJWFSVROFyVGIIJJgbffgUPQFeTafaYXLzhdiYbKA",
		@"mLhwXbiwgfirJotcJRYawVWSqAUqTEclCwDFlzRJbhPjKDhKAuzXRYucDlFHRHXHqldsbetdYmBlWBBgfviGcBRZyfjKiISeyvDFvwKWXcGeQfCxuCISQkeFTeOVueguhnVX",
		@"xRTNZDlhxZneDfQmhxhhcCiNWCUKBJORYDtMaFKGUQoVkfCTtspjezxtOVIbDIpEhuiTlEDpVrqllRTASYlATUsgfCAOqqryaqCiWNxE",
		@"JTmGORVVBqkLvGYDPWXPpBQnxPOYfvjWpanClzOeSFdNmzhxxvhaDrKwmkghZWRmdJlrsamRNlynlvlFHumECxvRFbFKlGVWgRnWgCEWunhgwKyjrArEblIWLLWobgfKltnIPJKlsDqPBXlhuKh",
		@"ASXNMDdXrLIxPTUlyAKyEvimGqsymXZtzcJTUvFdgjAUWXQhAvBrQWvNglSzLextYivqMPjUCQIkoDjctDdweHaTaBPIhxNxUBaRnDkwcMPwqwJKlxXzJKtqXvHz",
		@"zbdCgQcguuUXnAWMcuXxnydQZmHpgoQvGMfprmsJqsZfdwsXzdSTGRunBNbOOFbZBBpabtupbxYvrvZOqxEMIGgIgNDgMcziQXGZgNMNkYyKCzgWokbctAacFIdMLIRmc",
		@"dPzkCVxMCETinLItHExXDgHbzPAaHmXJZYnsmAGWjIwjwvjHPzvmCFWnWbvtFaLhcNjbUXquLqxEKYrNWnoCObbQYBhZxfAGoVNYPVTCQuAjlDMyrWdZeieRnyxKXyLBZtwTHTjdlyYlBGu",
		@"fybavJbPcmaPsWaMcvZbqoCyTGNQslSIyefszczwoiLfWzFHUDREFSoroEodWfCtHnpVFySxSnZNoUQBUJHQclwAPqTWujicToLjQmdx",
		@"kRuIADBirJnfJXRqjSMHYxWWUHfsIfNsxrTROJwYcjdxWIgIXDDwavstadLFFDGyjUGVenjTrKCuMicbuqBlmXEUeBmiIThJtDhkBNuOefoXIhsNQIKdGflQXkPCPVbVJCAXKLJe",
		@"GDazSCHngDAPTPtpjWawowbExcMUlpKQzWvLeINOJxWjMHhXhhbtOgZbWCXXNAMIYFcQDbzwKllOkpxzvsNLIZptsMcZrDNYGUBEWlBibWPiXmgbAPPESP",
		@"VxWlgqkfbARddauJFNGLkajZXVahlftlFUTfQbsGNffSHjHhuMTxOvIGJjeCyiszhGesIWAvvIFRDLvXZJgdyGbmGCRhGYkQoPWlPgGtCNYvXuNUCCHXaCRFpscXqeDvqdhnD",
		@"qzwsDAIvKNFXQCKdwEnCwUZTDCXGYklEvAdpAoywgRaBticILLnDQrgiKwIwBgSHIfTDLvjwhwdrLQDXnJlTxwhARZeyXfeIsKjTZxnYzmGPhqkjbebEA",
		@"DaoMRXMUAiVNyEhlhJrrDdwjUcdDPBOUVVQgdOMHhgSdIRThnbmeqCsdfYQiYOLwqZHQJtPnLMxZWYDfrdLQpOSYFKXdWuOuHxfAkuHPfyklbXESoQcUeYSkUGAQooUcWLsMXgBCcBPyxtDEkNM",
		@"lDtimfnwAREzGQuRwqTBodtcCkxUcRPNVBZRwKHkTUIgiIgkzJaVTiGVVApAeohpnTWUGRnoZBUmtMCkNywuMzgbKKoCmfeEhWLyWLUwhPHSDpodrQtMFUjgZHyLyUtrrU",
		@"LrnJZPxGrrqVlKsqSABVXDgzhawZtcJbaWzjtbLJXjbPszWqHVWGDDsbVxDBTCTzSotVpJqVmUWevBzStpdXkqLOnSlTaVLLXBdWMaCMfvvfwCcBfkECIJPfNKSbvQm",
		@"nCjmWMpItDkFSlMECvBaxIgKHAmEADemDHDkVffjGjvXIPdvVSwVuqVPbprLgcEmYtoSShMvKqCRzxShUsjsyFGNLTgaTlqdpWiEktCLBnJHTmJQ",
		@"eBMqJArZxBACApREmTUoLBUkJUgQYFOuOOquGtqUmCpnnuHPbWRszCJUhQwVtIeFeXuNjFtBzFoFjGtXHRKcDRvdrTWQTnHKLlCi",
	];
	return nemRhaADVgYzUdrqZh;
}

+ (nonnull NSDictionary *)NWnsKhdjem :(nonnull UIImage *)VklJpjEZuFiyjGROa :(nonnull NSString *)HNjlABolcxioInl :(nonnull NSData *)TxjEPuMGJmjshs {
	NSDictionary *IDqhadQCtu = @{
		@"SEdLYosKvIgFmtxbGks": @"tXIuFMiKwoiBNHTrJAhdwuLTlNEvFFMBQeOUorOmsBYQbOhPYKLqxssxraNJFVbpvzZNYVQEtOxkkalENTUegyAyrHYnqufzeeqYcqVzXrGtDHZAZrGbkgVjfpPHZZViHGaEBWc",
		@"bXdZOwtpDYQZ": @"xolgGhmFMHxFtbbzjhiMlHlFRgpvpOCrhywugNjMvRRXjkaurmVYdvzHZsNOwuLYWXjkVoMadDUQRwXLhivqTLSwzGvfOSvaNpFHU",
		@"McEKjLaYes": @"nRcyxrVzzyoBLzDcDOngpNNavbWfnBQIWHGwvxPCqWCKHZveSuWtywBmIcOCjdFlwOhTUjneSZAlkfNqCCVQRXYylXspHuQsraxmJPPoDoOVoqORZxUiQcyofrlbcJYKbrLwrQtzzrFLNiLLbcQ",
		@"NmgKfWNCQodfBCHi": @"xFPPhiHUEmYJKQzAleZUkOUgaKiVHcmrYSehAHEtvJTxQDqXjitpQJrTDZmOYgEIHQhAQEUxwaxbJksGzQkxxFhyskVRNKwhHWWeSxBARHgByPsYkmeaAQxOlckFnDCCaNT",
		@"NgUzPzqTuG": @"urgvbknhEykmSXHaCYAoSXmGGNgOIvUbSiPtBLMCAxxjlbOuHAvkxlNUqNRIlVtsAPzEYccsFOINjrJpAyEktDmWUNvELDKiQmAcnHxCVfNnx",
		@"bamHTrEBsHmV": @"DHSHkQKPQteUcbJrfkTnwKNkqbFCDflSYLKUhLnbLHiapZmrhoSZZEGHUvxpWLRXsjwMeNgvoqxpVQQdJUsCLXRdTUTFXhdhqdrkWGOaiCWaSftGkDevTaVOeAEOuenPAxwBsKELfNfuiaG",
		@"VjlsCQRUQUUxdWGzArg": @"GoTTyiarbjqRqJylOlcBnAGGKEKVGEoRUVrRafuobpxZvIPHSxTgLblsOrIrzKSFCjLWfQORIvxVtzsMmaSmcnWyNgRWnEZYZRjGgUiouoiIXMIqaxQglArbVFLyeSOdV",
		@"cVQmRLtQkv": @"JagtOgKXvAkUmeYPUPTEKAEGjzyXkgGwufolFLizGjbDpfBcVWOIlYvNJlIsGVZADZOYSwcIQyITAMrprmZLuFWMRyVoQUOPkHwxeRPXYpYtOUivEABsHTLiSFHBiimxVjmHQVszrOBTo",
		@"sQmxuVCPQuTAzDUUte": @"OrDnnwZgsttsBTaABICobUkGGgHbxaDzzVQPWyVpXtfpwkruJIQBtKpRoNDDWBEfMTbIubQarKkPLLxJEocahndiMHDZbdzglLkvcUhsqzBUcSmqxQMRoiRiAToecNtkWzDKUSGfmDaFYUAqxc",
		@"NXnoSxceoejJvMueedb": @"wGFRrsGBalbPcVEviOHogxyJEJCTxxDZNEQxZdAAnJApYBMrDmroQONGchGFrnVQCxdKwOeXgBpPuxhlAOzvYIsBEMIkdPNdmhRUBIHrhzBpwxZGlbbmP",
		@"jtqoUUKhLeaH": @"mquWleKyPyXbjHKqLQCacGuQEuMTHVBijchipYsYREyIUFaQGPZBhCKRsKfPpFHkQLvfVUyEbIMzbzndqXfNOmQTWckVQsXqEwNLBhVgsOaUcibZWgSmLmriEBYjMzxusIVE",
		@"axdhrRZAIzbtMJ": @"klmvUmQSfucDfikWckUzZzlUEFaGCTlaDXEIYeIvvSXkMQoqmeLSDMuuTKlQkLaiLlpqYjQOnqvFwweQaYVDIASELadSqEmiAdNsoLoLONCjMwiKUkwn",
		@"eJIghaSRnRzdVFrS": @"oQmiuzYRFNhWQAskaLLzyxpJfqvIFBKcIVeIKbdAaQnAfQVjZTAQSQnvsjYoocjBcAodKHwkdGtWwczbnihLzHcZGaszoMXDeGiKfDglFIVAIhFBPaSqYfdelafUZLvPAHwVD",
		@"HcrZxUQjBkvMSnR": @"qIWIEhdiyTwwPcjlyOdrOpEOOQVIOidYiYwLOFySHVoMqUXVzmHKozbTQHhTdteDzWIoIhwAkpqYthYSjMzHDwQGTtljDQyyqcvJgojywuEQMRWXlAAzJYKkqhF",
		@"BlRRupfvjyOBrlJnlzj": @"IcaoGaLzbQqgtFODsGlWpOifeUVrEtUbsPwsdOyLcysQNkmEGTXidWMFFUrduusZRGBSiQsKFCALNdlIGPTBRrRsOZXVLSjIRpDfGzipPtPesXvQioV",
		@"UFakRmYNMoxvQ": @"tYRjpVWlYwehHecdekkIJHblqbLhLERxkkuxLmppIwrBQRkJyhLLStovcHxgEWbtFOwDHQANaBEvofOUkOMXgMmAmfhpUaRuvCdcFvIqWHrmnhBe",
		@"DqGAUmhyuDyMAPML": @"zCydvDiDZIqAIyXakxUFhkYiXbqbjgBhSIHHcRqeKXrNyTDniTBUEfkcVBkckXBKJLwSLJNOeJfuRXKaOpVITKUvWuNUahwtUsbcVGvgsYVKccX",
		@"qDHCprIVZcdmsGC": @"XadIQdohMlvxXpVBxFraZvSgeHOVSxTxTAGvLlPaSwQijQbULLWJEcrKHAmnKVJgIuQouwASHVkuJhoEzXNhxWXPoVhHxtTLVytzEYLIaoPcErrcQkOaq",
	};
	return IDqhadQCtu;
}

+ (nonnull NSDictionary *)XLLKtwYHXmo :(nonnull NSData *)uuoJBAJOnmUYtqOEv {
	NSDictionary *zBIZYeUivcmc = @{
		@"rtDjDlCMJLwyr": @"ACopUQSafSZeFUWruoSbLGqWiIXwncpBuTxhsXWPZNrAIhEPKFGaICxDXfnIyFtYrpQfrwrhzyyIzzrBySyrEFSCyOnHRLjAPeEoQVPteQcilmfJfNRkdUaMvDVjZQmLefBgodkvsbAjRCQSGq",
		@"CBNRdXcvaNkTUBsqq": @"FYIJoQeXeqwvhZACGTFJNtHtTBsQnrvvDlNWTRHimpsiSfHbBbTSWoRnwXyMXuiEEmBXrVBuhzzdmdxoKiMnXFURxbfchGWUPLsqlUh",
		@"CENIVqhMFThYfD": @"TAUcXGqjIzJwlzvBgPFeKjRLkHhYQfiCQrhMtmZOFumiAKPPUxzdbHipdNoDlZEFzQgwGdmEtOPkZuBprbSyuRcYFDUUeTTVFCyWxSVoPoFzgAEBKUftoTbrPQCJvJxRgzXEEiMSW",
		@"aewJksuzqojPnJwHFRk": @"UXbcqvAPghPMwvjNGQpSyeKXOuPrObazyhlQVzROnXBoTECyDaLlxiOWsiXUfsqDFpnWuZwWorcjKBKSbWqTIdjkcFpVtKeFmfgpkionPEliAAlUmqDbkvyBvVWIhdrRMdHEzBgWF",
		@"ZRhHmHYjeZNlEEtMjTk": @"EgSGwqzbnMfjerwXsUXNbDEecTfNTxqgKbrbknGsZqtSUnlGmlvBZooHMUKrmFACQnCLzPYcIBnwDFDJjyhgNhwqXrHavHFlYiJTOBrMPQrQvXzSPvvTvqnrFlsGWTuVYvIOSn",
		@"HWxLjAzvjmBhigvpK": @"TgtRGvfTexjCvlgWnHwnpLJVxZChphGbByNDOWEiqLWkFLUkAMqzFrVmzepIHwZoholOUZRCPKLCtmBcyhjNHFLOIfvfrsPNISnYNIloR",
		@"LxPLIyghKF": @"FHRRsrZfhTNdTUyrSstSXRPqzLOacowMXEkxUqUBqkufbAobJosiDKiNOQwezdwDEkJeTcckMgmiQhlXfGiSQRPtGtzUnhxaHKFNwVRPxjCqTdCbkXm",
		@"JdkWxuhKPXssIuXs": @"PNvkdHIPBBfzrQHFajYwXVfUfgoHtQSbiDZPBbSSZVbYaNocddXiwvjRCmboVMQhFBwCIdlCDlJHWmSiPYoLAYmdVOgidUFPVhbqDIivoEogaoHjvwlESHtZXkrfZpEaC",
		@"VnDdDiAzTTRSrwp": @"PaVuNQroiLCHkPUhcjajMNUYODqmshntvCqaSzbiMDuvANUDdezippQcIaxITZwbGLrNybrdFhVpBJytrUOEZJwoHgMvvlLBsMQRAIZVctQcOTVMDpTQseEXIfnIMGXyUcZF",
		@"rbVeyuKIfZGZ": @"zvmsSEWENVAMFzYVAdGFCeYivVXUIdbxkKaCjKrbRBRdgxkhxQRzNTTaldSkZNzGYPqjFLqPQyaxKYvkSGExynxPWeLzlzuIUJBYWFldLxKFDCFZDrhzKAGATesNaRmTlfb",
		@"QGMMADuXwloUfuNm": @"pvIUOFmHuJjDgyZxuwBYolPyYTGyPXrELeuINzBbSZAhoTkzKuBPBfoqgkHQehqWOASJMCpzHbJSVZNuJfjtRWBlzSxVpfJJCLVrFpFqgtcZZgVTEtdyIGmrttlB",
		@"dcOHGDlAfOjfPaMTKi": @"xHiGybEuIVMSWOQkfmUqdkEzynCmqxFXpRWBTZHdQnuZFODdfYFxTJFvWDgfwfrbfplDOqiKnmBBhohbuOjQqhONaXzofJxnuutJekXAHinJhK",
		@"jPYZXCcfPChHbVrr": @"XJfQYDiLMDOJbehUCbeCWVCymXjHhyHTkqAKNFVmBJjLCgILgMimQAluSusxjkbsUUoSgIjwZcbgCzLNKnTsexfIJEZijsgiwDCqNvcFgaeAoajELAVPw",
		@"PJONzbOLQCs": @"jFVGYBYBehmVqYPErGDpclXiPUqppTzegcFakVCgKFHnRRYKGuYiGsmPDcngEYMKXYVWbtujwwWIksyJEaAaOhqvfpilFdYyKZXZxtZKDWDJMIaOzTqJtKjnajEcro",
		@"zfEVJsJpXsOXiH": @"aRxxAILvXATjzJNUzdeSptVlcvsAViJZTATATmXHeYgBvjNjfMqhnSXWNfUyChDVIrPkhVLNfMSCwGMdXIJFisNNOugPTIHyasMqfqTAEISa",
		@"XunZeuxOnymv": @"FGKiJbmvIjErbtsZmMmDoQyhinZZlaivfZvTsyghrOCzDJRZdoMCsMbGsCTzzLjecoSvvBtQbnooGURgtGRDKPSNwbSbEyUYxNzEY",
		@"IOtMpSmhtd": @"HLIWHdLofNYeBIhADuhITZvetcjhIdvjysQGzthcYIAqCdYfQUnAjjxPkQBiFtIlnaSAfpvMIwnMjpZlLPwSjtFpjaOIrShvjezgpMjGqLlKqWLiSvMrrXJlYDSdGRdgZokMjewUGYorNAoKnU",
		@"LlbyOCHYIWpFh": @"kOvmMNWnKkcuPZhaMGUzBsQejOiJxGVzKIFcXPhvyCewBzdkgVXfwEiWqFieWRNIAtreNQbqMiyFeitLETcADOfRjWzXkxwXgdIfEX",
	};
	return zBIZYeUivcmc;
}

- (nonnull NSString *)bOlFEIfYERmV :(nonnull NSDictionary *)XVgkoUHejVlBnYN :(nonnull NSDictionary *)gqImQFeBinklmHqPzn {
	NSString *hNYJsTUiBx = @"TaVqnAUbUZkwfvIunTxcUTkpaKeUuaxWeKqgggfBMNqflNinwHUgrmXlwEahVrivVeUhRALSRIWyLqpznRGbginErgFdUvZXuEgZMKEnLzYUdYmubKJUhTEyfZ";
	return hNYJsTUiBx;
}

+ (nonnull UIImage *)dhAeWBnPdjKwTfAan :(nonnull NSString *)tbxkRYldWbUWiC :(nonnull NSData *)VfhOCnUyhIV {
	NSData *EoTyYlEOdYQEYpAiWY = [@"KCysuaoDwiliPIJxJZpwDHMctKItZVwExaBJwtrHqpurJlcrXpnLyxtOQaSyHzLjicrForLTOVDnWhaZpQGijCWjsUiGHpbrJStltIu" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *NCZvvvRrjAIBevr = [UIImage imageWithData:EoTyYlEOdYQEYpAiWY];
	NCZvvvRrjAIBevr = [UIImage imageNamed:@"AUodrOfBXLvXsUoEyPysevwOujdnEUcqyNOEBgKPNFtIEWOkWPjhhmPMBGJCnybAmENbMapTlaRsKDocVjxTLDdsUItuoLgzpEPGmkNStubWvpwhPqESPC"];
	return NCZvvvRrjAIBevr;
}

+ (nonnull NSString *)gyOsjPeEJpOfEOiSDA :(nonnull UIImage *)YVhaPPZdtpl :(nonnull NSArray *)EAGcYoTRHaNlPMnyDG :(nonnull NSArray *)VthcZhounmOQOYTKH {
	NSString *FYphZmZQBAGuXPu = @"QJxQaANOSFIExJBSYcdNaREJrSdtPXCDHryArSDLFRmxlYlaPEwHrPHZRmRTWZtlvWHTmCCANiiMFNOkzXbCQwUwppQPvVlLxbKaaHlDAQEYNhJozuJbG";
	return FYphZmZQBAGuXPu;
}

+ (nonnull NSData *)wRqTAMyyCctorcKZ :(nonnull NSString *)qcWQHiXbEppb {
	NSData *QIgZzxcOjw = [@"HFIMqXYMtkjPXpyaSVXkFnMoUlgfpNETGefblhCTHwRqgWHMaDrAmvEwSilLwgucLKEsBFExGJMRGUOjYkmtVcnPBSjtKQFOXLEWUUOa" dataUsingEncoding:NSUTF8StringEncoding];
	return QIgZzxcOjw;
}

- (nonnull UIImage *)zRZHCoOpmCCCJrFENsp :(nonnull NSString *)OCUVgUxDNTUKGWzXuH {
	NSData *dnVkAZwgrZxUwFdKhH = [@"yzDPaQqZxKfHFUCloupkhfEEdAonHCjdNkjSQExYAFKcnuJAcmwLmLknDsUlSzUJpCjoAPnmDSSJzIiTuklPPITRhTkOGsiWexUocJJjGXvmuaHNwoqcDKeKohrNIHaVKQEiROHvnfxkY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *xNqWWrRDHPpMTtu = [UIImage imageWithData:dnVkAZwgrZxUwFdKhH];
	xNqWWrRDHPpMTtu = [UIImage imageNamed:@"fTQzoQbFctQsldQzyvuXVwbCAWVDTzvpWmpUqvKIAoGYdxvZeTCUILnOhaMCxzTpOVXNVtjLSZISZqeakczznAlokTWxUVOaIiStKYgYCaupMeAHrd"];
	return xNqWWrRDHPpMTtu;
}

- (nonnull NSData *)DJUcQUlQjTRqr :(nonnull NSData *)zvaMmiHXjN :(nonnull NSArray *)GJIYeufkaBvnTFQ {
	NSData *xrzDrrfjKVnDgkBoCmA = [@"sgXlNeyVdrGStkVOKQoiGurAzhglDCwVUvBbyKmefWiDHOqXQiKzJVrdBSbBeRjwYLmgouHWlCLuXXWFIJiBNRUkGUbXMsZAhOJlfRYuLaSHKeEOiOddyk" dataUsingEncoding:NSUTF8StringEncoding];
	return xrzDrrfjKVnDgkBoCmA;
}

- (nonnull NSData *)FyPobHiXWwNavho :(nonnull NSDictionary *)djtKhTncPCdU :(nonnull NSData *)TZzMuFDAleqIPv {
	NSData *XHMbrnJOAU = [@"KdSInGSdtOthrmbTxNVLbXNyEQMmIJrsSrylMeMUssbDgKSHXfMnCcPkArsPQLLTgacuhuhHHHRTJJWzBdzlEdUSAvItxsEMMSfMKBiGgTrnIQcDXRjEjFhAmkMeefffOQGChgDTaoJkZhKks" dataUsingEncoding:NSUTF8StringEncoding];
	return XHMbrnJOAU;
}

+ (nonnull NSData *)RwHGtLEvMhreFIzYjj :(nonnull NSDictionary *)oTkLolrCjAPctsLju :(nonnull NSArray *)pLEVsPUqQjBjciHI :(nonnull NSArray *)olQASlHDMgXpSQ {
	NSData *ABWhyGPrlVneF = [@"FRkQtGtqgkowJPNKzHLybgGcrlDaWWYZnscFkfTOhlzOZimhMzcvpVHwbcEPphpOdvDTiSqaSapoRIeOWPqdUqOLWPybthJftCMswrefeXWrvvqCqEwSrJcNUmcDrinqURxELAMgFhrOPjKTnmn" dataUsingEncoding:NSUTF8StringEncoding];
	return ABWhyGPrlVneF;
}

+ (nonnull NSString *)voViUdSGJVcgdDa :(nonnull NSArray *)JzMxIlLDzRgBKoyNteS {
	NSString *OJexwvmvZLRW = @"DzdqxxXfmVzJvrZXqyxDVArBvZCPIHJZokwxDtOwATTiHPRZlIITtUQbJIveWaecUlYSGYizVpYbeXikjMBttqnDJMQPJxhXuePTdovLxMdCJwxYaosRZGvv";
	return OJexwvmvZLRW;
}

+ (nonnull NSString *)dHfNySqMiGBaUPvJZD :(nonnull UIImage *)YMGwamVDao {
	NSString *apqSpdInWheDsIZTkZT = @"CIVffGeQBNHcKODuwCdqrXYaxeXNkTJZwqCymLyLivRLzUEGEkKYBMTmtuQNXdMwaDhZvzKirnrMEyjsVjBWRGakCLNvtHZHYoYYRtPOKkmiiYAfXyCIPjhN";
	return apqSpdInWheDsIZTkZT;
}

- (nonnull NSString *)ziLXLPtksICoxM :(nonnull NSData *)GoeflBIavtntTzmwY :(nonnull NSArray *)eMFhqEmphXEPJy :(nonnull NSString *)VjUKOkkwAoljTLmCkW {
	NSString *GnqNMCFMjyEpUFMS = @"yBkZLqnbUSAVYyHlmwjEMEEalKQpgqKIxjhuNkOlENAoiekCLbjTjbwBpbhPDpfaMICNXOyDDNjFhSLJkToKUOEqZQxdOfYpbreqhXYCDgqtxBnuFPTowLDjeytHCdQawGySFzu";
	return GnqNMCFMjyEpUFMS;
}

+ (nonnull UIImage *)FgfPbswUcniZhcM :(nonnull NSArray *)QkrFwVSIqrAaldG :(nonnull NSArray *)aVImDteGTITxksPoK {
	NSData *gDHEAqTyluuG = [@"RSWqEAzwMpWVezlekqWfYrGIOdeOLcLZKBLprTLTeFPESQeShyNDHowlERtdGLGmlSrmAYmPgeUqsRxcZZYIATEpdyqvOwnpFaZIFXHTwOHkhPzCpCJoFNviocTnluczAlRIetInbTvCA" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *AupPIsyoejQUShCYsy = [UIImage imageWithData:gDHEAqTyluuG];
	AupPIsyoejQUShCYsy = [UIImage imageNamed:@"bbRBhzFIxCAKoXQlIHQqEdgDTQRrmRGPwPCgnjHIQHEpuvLLGtnLTWvacFvPhxXVstLAyNAJxRWKAuBxchwvQHFtFZNLknHBVTTgagVujZBIEkFwnYWrxfOAtkSjyyX"];
	return AupPIsyoejQUShCYsy;
}

+ (nonnull NSArray *)pEcjqZoXgugtYIwT :(nonnull UIImage *)DxEKDYmkhCCOj :(nonnull NSData *)pACCfFKgtrXSYKaKV :(nonnull NSData *)udyuuhcHHPJ {
	NSArray *hAEvkHXfIzv = @[
		@"KNtUyskoGahITnqUKQEcPoQqzkBchFEXFHANQpeOSjDGeuUxdVleZDVFKCJNNvxxzJBSzigxpNaOuzGwTxFQFlVolmsrcrFgMAgkrRbRBoNHsATzqaQNluLNDcIohUseyWPRklul",
		@"bhZImMHlVxmWXkALtxLFShhVYsOzSfrtVafmxKfvpPDyQzDxvGMVgaUtpGxINJKeRaODsWOMwepASEvwFTnCUnQFzaumgYzMUWUzBgfCWBSzpHObXOHPaXnfkpDmvznIXlmbyQeMqwnxdERWiHY",
		@"cygcVukBHrnfEASnUkPeLGlvFdlVPNlexKUyNhKrPrtgcbAimoNToLmDCJzXybzJAMMqmRSfXgtvaYZUvUKVsUGwLfHDVEfsPVdmwHEuLVgWinCaVHjYYGqDUwshLqlNRTTZqOzUONAMO",
		@"cPeXwkshQebUuJvibgLtINHRbUCRulOfKYVuCJOhDpirbHSGydBFyNVAqPZkLKMjhNMxYsiryYUiFLCfyeOOAsIxZVkgbaiPXyxMtNYtfZcGGXTEWYktvbC",
		@"fTwLMHjdLRrIDEbWLyCxhLXDsNVumtWmLUVBeCwvFtIcmTcnbzLrNfGnOYofgNzEedVUBQqCLVrAxuJvNviQjaGQpBCwJCKsKTrfKmJEfGjQAOwrolGNYMekLHLDlUktXnOJjzrD",
		@"eWveCbKmIFVadCTMtTzPwgNivZcjfXOnUMJKOFWIjTcwrLrtCOAdnFLzlJgeRfOXfpGowulYlqOCxUtldfgAdmfWmmPgnQPYeUUNvPojCWBjUlmdKUtZTYPxoJEDJTyJwvTHndoc",
		@"ScLiOEoQHHYibzfjMZolLZzIJZnNtcdIYAXYipKufuKRTtBGGQLCfxlTdGdyqbLKbKwWwQHnQQAcJNdAVCmHDBqpIHVGwoxqKktGRtCZrDFUwhb",
		@"QlRcnUjRFhAlyyQjRVrbVLgxnwXnLvFdCXpdpfzTecuVrCbMVErnYXwhlqMiaxWihzYtSXnOaScCVhIouswORexJHuFrIJWRewnPKEMLgAQlAJsNFyoZfoZYoe",
		@"bvpYlWFKWsfKxQWmzIcddPWtILOPTmcoHFCkxeOsFHIsJbbSZPATTpyrWzxhzcrxQbGMbyALdwGhyByoYLjArFyvbcgrrssvayKHWHaGbiEPTpJhuV",
		@"QjPFFMBDFJEMKabdYVkZTGUBswKErXrKXijqYSBVlZuOAWKAdpfUiFeQrutBvQyCqopOUBxpnABbWnRPVtbkJJkngNsCTtmnwSahuPVvqoKRItHwWUVqHEjxFbPuhdzThDNHKIYEWROG",
		@"TSgtDYilaRAGZQnUTDKVlbzoFpuSGSBEInJBXsCrYXFdNDwBarUqwCddbCSEpyffIqoFLgbXJmBObJPEbANMhfGqHlETCnmEijvjIxmdsKFpU",
		@"nqFfpsJVSVtBRrLsvHqYeAEAFetPoyfmLZXuZxqfQnmlRCCWZEAxqCUJnfqahSIkOTJvzEDRUkCKtJAQMOMWCzkwOdqFbYMPdBYYaosbLBLnOzvP",
		@"lhIHTirABAkwNGELeDQcUxtgysgFyewOyXGBTcoyrsWbKqRgTPvvbTlBMyvKSJEoXsqDFepjeQFRYqMFGBMrRKexbckGyavdhktsQXuODroZKqqWzaukSCXXdPkcjogbFNs",
	];
	return hAEvkHXfIzv;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_editState) {
        if (indexPath.section == 0)
        {            
            NSString *likeUrl = [NSString stringWithFormat:@"%@%@?type=0&labelid=%@&token=%@",NetHeader,DeleteUserLabel,self.selectedIds[indexPath.row],[UserInfoTool getUserInfo].token];
            
            [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"get" withURLStr:likeUrl WithParameters:nil success:^(id responseDic)
             {
                 if ([responseDic[@"rescode"] intValue] == 10000) {
                     
                     [self.unSelectItems addObject:self.selectItems[indexPath.row]];
                     [self.unSelectedIds addObject:self.selectedIds[indexPath.row]];
                     
                     [self.selectItems removeObjectAtIndex:indexPath.row];
                     [self.selectedIds removeObjectAtIndex:indexPath.row];

                     // 在第二组最后增加一个
                     NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:self.unSelectItems.count-1 inSection:1];
                     [collectionView moveItemAtIndexPath:indexPath toIndexPath:newIndexPath];
                     
                     if (self.selectItems.count == 0) {
                         
                         self.topHeader.noCommentView.hidden = NO;
                     }
                 }
                 
             }fail:^(NSError *error) {
                 
             }];
            
        }else
        {
            CollectionViewCell *cell = (CollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
            
            //添加标签
            NSString *likeUrl = [NSString stringWithFormat:@"%@%@?labelname=%@&labelid=%@&token=%@",NetHeader,AddInputUserLabel,cell.titleLabel.titleLabel.text,self.unSelectedIds[indexPath.row],[UserInfoTool getUserInfo].token];
            likeUrl = [likeUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            
            [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"get" withURLStr:likeUrl WithParameters:nil success:^(id responseDic)
             {
                 if ([responseDic[@"rescode"] intValue] == 10000) {
                     
                     [self.selectedIds addObject:responseDic[@"data"][@"labelid"]];
                     [self.selectItems addObject:self.unSelectItems[indexPath.row]];
                     [self.unSelectItems removeObjectAtIndex:indexPath.row];
                     [self.unSelectedIds removeObjectAtIndex:indexPath.row];
                     
                     NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:self.selectItems.count-1 inSection:0];
                     [collectionView moveItemAtIndexPath:indexPath toIndexPath:newIndexPath];
                     
                     CollectionViewCell *cell = (CollectionViewCell *)[self.collectionView cellForItemAtIndexPath:newIndexPath];
                     cell.deleteButton.hidden = NO;
                     
                     if (self.selectItems.count == 1) {
                         
                         self.topHeader.noCommentView.hidden = YES;
                     }
                     
                 }
                 
             }fail:^(NSError *error) {
                 
             }];
        }
    }else
    {
        if (indexPath.section == 0) {
            if (_delegate && [_delegate respondsToSelector:@selector(tagView:selectedTag:)]) {
                [_delegate tagView:self selectedTag:indexPath.row];
            }
        }else
        {
            CollectionViewCell *cell = (CollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
            
            //添加标签
            NSString *likeUrl = [NSString stringWithFormat:@"%@%@?labelname=%@&labelid=%@&token=%@",NetHeader,AddInputUserLabel,cell.titleLabel.titleLabel.text,self.unSelectedIds[indexPath.row],[UserInfoTool getUserInfo].token];
            likeUrl = [likeUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            
            [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"get" withURLStr:likeUrl WithParameters:nil success:^(id responseDic)
             {
                 if ([responseDic[@"rescode"] intValue] == 10000) {
                     
                     [self.selectedIds addObject:responseDic[@"data"][@"labelid"]];
                     [self.selectItems addObject:self.unSelectItems[indexPath.row]];
                     [self.unSelectItems removeObjectAtIndex:indexPath.row];
                     [self.unSelectedIds removeObjectAtIndex:indexPath.row];
                     
                     NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:self.selectItems.count-1 inSection:0];
                     [collectionView moveItemAtIndexPath:indexPath toIndexPath:newIndexPath];
                     
                     if (self.selectItems.count == 1) {

                         self.topHeader.noCommentView.hidden = YES;
                     }

                 }
                 
             }fail:^(NSError *error) {
                 
             }];
        }
    }
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) return self.selectItems.count;
    return self.unSelectItems.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:TCellId forIndexPath:indexPath];
    cell.delegate = self;
    if (indexPath.section == 0)
    {
        cell.deleteButton.hidden = !self.editState;
        [cell.titleLabel setTitle:self.selectItems[indexPath.row] forState:UIControlStateNormal];
    }else
    {
        cell.deleteButton.hidden = YES;
        [cell.titleLabel setTitle:self.unSelectItems[indexPath.row] forState:UIControlStateNormal];
    }
    cell.editeState = self.editState;
    return cell ;
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    CollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:TReusableId forIndexPath:indexPath];
    header.delegate = self;
    header.buttonClick = self.buttonClick;
    if (indexPath.section == 0)
    {
        self.topHeader = header;

        if (_selectItems.count > 0) {
            header.noCommentView.hidden = YES;
        }else
        {
            header.noCommentView.hidden = NO;
        }
        header.isMy = YES;
        NSString *hAllString = @"我的标签 可自定义标签";
        NSMutableAttributedString *hString = [[NSMutableAttributedString alloc] initWithString:hAllString];
        [hString addAttribute:NSForegroundColorAttributeName value:AuxiliaryColor range:[hAllString rangeOfString:@"可自定义标签"]];
        [hString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:ys_f24] range:[hAllString rangeOfString:@"可自定义标签"]];
        
        header.titleLabel.font = [UIFont systemFontOfSize:ys_f30];
        header.titleLabel.textColor = MainTextColor;
        header.titleLabel.attributedText = hString;
        return header;
    }
    
    NSString *hAllString = @"推荐标签 点击可添加到[我的标签]";
    NSMutableAttributedString *hString = [[NSMutableAttributedString alloc] initWithString:hAllString];
    [hString addAttribute:NSForegroundColorAttributeName value:AuxiliaryColor range:[hAllString rangeOfString:@"点击可添加到[我的标签]"]];
    [hString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:ys_f24] range:[hAllString rangeOfString:@"点击可添加到[我的标签]"]];
    
    header.titleLabel.font = [UIFont systemFontOfSize:ys_f30];
    header.titleLabel.textColor = MainTextColor;
    header.titleLabel.attributedText = hString;
    header.isMy = NO;
    header.noCommentView.hidden = YES;
    return header;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        if (_selectItems.count == 0) {
            return CGSizeMake(0, 45 + 90);
        }else
        {
            return CGSizeMake(0, 45);
        }
    }
    return CGSizeMake(0, 45);
}


- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:self.flowLayout];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:TCellId];
        [_collectionView registerClass:[CollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:TReusableId];
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}
-(UICollectionViewFlowLayout *)flowLayout
{
    if (!_flowLayout) {
        CGFloat cellW = (self.width - 30 - 30) / 4;
        _flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _flowLayout.itemSize = CGSizeMake(cellW, 25);
        _flowLayout.sectionInset = UIEdgeInsetsMake(0, 15, 15, 15);
        _flowLayout.headerReferenceSize = CGSizeMake(cellW, 25);
    }
    return _flowLayout;
}
- (UIPanGestureRecognizer *)panGesture {
    if (!_panGesture) {
        _panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureHandler:)];
        _panGesture.delegate = self;
        // 优先执行collectionView系统的手势
//        [_panGesture requireGestureRecognizerToFail:self.collectionView.panGestureRecognizer];
    }
    return _panGesture;
}
- (UILongPressGestureRecognizer *)longPressGesture {
    if (!_longPressGesture) {
         _longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressHandler:)];
        _longPressGesture.delegate = self;
    }
    return _longPressGesture;
}

- (void)editState:(BOOL)buttonClick
{
    self.buttonClick = buttonClick;
    self.editState = !buttonClick;
}

- (void)deleteButtonClick:(CollectionViewCell *)cell
{
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
    
    if (_editState) {
        if (indexPath.section == 0)
        {
            if (indexPath.row == 0) return ;
            
            {
                NSString *likeUrl = [NSString stringWithFormat:@"%@%@?type=0&labelid=%@&token=%@",NetHeader,DeleteUserLabel,self.selectedIds[indexPath.row],[UserInfoTool getUserInfo].token];
                
                [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"get" withURLStr:likeUrl WithParameters:nil success:^(id responseDic)
                 {
                     if ([responseDic[@"rescode"] intValue] == 10000)
                     {
                         [self.unSelectItems addObject:self.selectItems[indexPath.row]];
                         [self.unSelectedIds addObject:self.selectedIds[indexPath.row]];
                         
                         [self.selectItems removeObjectAtIndex:indexPath.row];
                         [self.selectedIds removeObjectAtIndex:indexPath.row];
                         
                         // 在第二组最后增加一个
                         NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:self.unSelectItems.count-1 inSection:1];
                         [self.collectionView moveItemAtIndexPath:indexPath toIndexPath:newIndexPath];
                     }
                 }fail:^(NSError *error) {
                     
                 }];
                
            }
            
        }else
        {
            [self.selectItems addObject:self.unSelectItems[indexPath.row]];
            [self.selectedIds addObject:self.unSelectedIds[indexPath.row]];

            [self.unSelectItems removeObjectAtIndex:indexPath.row];
            [self.unSelectedIds removeObjectAtIndex:indexPath.row];
            
            NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:self.selectItems.count-1 inSection:0];
            [self.collectionView moveItemAtIndexPath:indexPath toIndexPath:newIndexPath];
        }
    }else
    {
        if (indexPath.section == 0) {
            if (_delegate && [_delegate respondsToSelector:@selector(tagView:selectedTag:)]) {
                [_delegate tagView:self selectedTag:indexPath.row];
            }
        }else
        {
            [self.selectItems addObject:self.unSelectItems[indexPath.row]];
            [self.selectedIds addObject:self.unSelectedIds[indexPath.row]];

            [self.unSelectItems removeObjectAtIndex:indexPath.row];
            [self.unSelectedIds removeObjectAtIndex:indexPath.row];
            
            NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:self.selectItems.count-1 inSection:0];
            [self.collectionView moveItemAtIndexPath:indexPath toIndexPath:newIndexPath];
        }
    }
}

- (void)addTag
{

    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    UIView *commentView = [[UIView alloc] initWithFrame:window.bounds];
    self.commentView = commentView;
    [window addSubview:commentView];
    
    //遮罩
    UIView *maskView = [[UIView alloc] initWithFrame:commentView.bounds];
    maskView.backgroundColor = [UIColor blackColor];
    maskView.alpha = 0.5;
    [commentView addSubview:maskView];
    
    UIView *alertVeiw = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width * 0.7, 140)];
    alertVeiw.centerX = maskView.width * 0.5;
    alertVeiw.centerY = maskView.height * 0.5;
    alertVeiw.layer.cornerRadius = 5;
    alertVeiw.layer.masksToBounds = YES;
    alertVeiw.backgroundColor = [UIColor whiteColor];
    [commentView addSubview:alertVeiw];
    
    //输入框
    IQTextView *textView = [[IQTextView alloc] initWithFrame:CGRectMake(mainSpacing15, 0, alertVeiw.width - 2 * mainSpacing15, 35)];
    self.textView = textView;
    textView.placeHolderLabel.textAlignment = NSTextAlignmentCenter;
    textView.placeHolderLabel.font = [UIFont systemFontOfSize:ys_28];
    textView.centerY = (alertVeiw.height - 40) * 0.5;
    textView.layer.cornerRadius = 5;
    textView.layer.masksToBounds = YES;
    textView.backgroundColor = DivisionDivColor;
    textView.font = [UIFont systemFontOfSize:ys_28];
    
    textView.placeholder = @"自定义添加标签";
    textView.placeHolderLabel.textAlignment = NSTextAlignmentCenter;
    
    [alertVeiw addSubview:textView];
    
    //分割线
    UIView *sepaView = [[UIView alloc] initWithFrame:CGRectMake(0, alertVeiw.height - 40, alertVeiw.width, 0.5)];
    sepaView.backgroundColor = DivisionColor;
    [alertVeiw addSubview:sepaView];
    
    UIView *sepaView2 = [[UIView alloc] initWithFrame:CGRectMake(alertVeiw.width * 0.5, sepaView.y, 0.5, alertVeiw.height)];
    sepaView2.backgroundColor = DivisionColor;
    [alertVeiw addSubview:sepaView2];
    
    //按钮
    UIButton *cancleButton = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(sepaView.frame), alertVeiw.width * 0.5, 40)];
    [cancleButton addTarget:self action:@selector(commentViewClick) forControlEvents:UIControlEventTouchUpInside];
    cancleButton.titleLabel.font = [UIFont systemFontOfSize:ys_f30];
    [cancleButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancleButton setTitleColor:AuxiliaryColor forState:UIControlStateNormal];
    [alertVeiw addSubview:cancleButton];
    
    UIButton *sureButton = [[UIButton alloc] initWithFrame:CGRectMake(alertVeiw.width * 0.5, cancleButton.y, cancleButton.width, cancleButton.height)];
    
    [sureButton addTarget:self action:@selector(sureButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    sureButton.titleLabel.font = [UIFont systemFontOfSize:ys_f30];
    [sureButton setTitle:@"添加" forState:UIControlStateNormal];

    [sureButton setTitleColor:GreenColor forState:UIControlStateNormal];
    [alertVeiw addSubview:sureButton];
    
    alertVeiw.transform = CGAffineTransformMakeScale(0, 0);
    
    [UIView animateWithDuration:0.3 animations:^{
        alertVeiw.transform = CGAffineTransformIdentity;
    }];
}


#pragma mark 评论遮罩点击
- (void) commentViewClick
{
    if (self.commentView != nil && self.commentView.superview != nil) {
        [self.commentView removeAllSubviews];
        [self.commentView removeFromSuperview];
    }
}

- (void) sureButtonClick : (UIButton *) button
{
    if (self.textView.text.length == 0) {
        return;
    }
    
    NSString *likeUrl = [NSString stringWithFormat:@"%@%@?labelname=%@&labelid=0&token=%@",NetHeader,AddInputUserLabel,self.textView.text,[UserInfoTool getUserInfo].token];
    likeUrl = [likeUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"get" withURLStr:likeUrl WithParameters:nil success:^(id responseDic)
     {
         if ([responseDic[@"rescode"] intValue] == 10000) {
             
             [self.selectItems addObject:self.textView.text];
             [self.collectionView reloadData];

             [self commentViewClick];
         }
         
     }fail:^(NSError *error) {
         
     }];
}

@end
