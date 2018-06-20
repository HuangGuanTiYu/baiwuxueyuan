//
//  CutMusicController.m
//  MoveSchool
//
//  Created by edz on 2017/12/22.
//
//

#import "CutMusicController.h"
#import "NMRangeSlider.h"
#import "AERecorder.h"
#import "DWTools.h"
#import <AVFoundation/AVFoundation.h>

#define kFileManager [NSFileManager defaultManager]

@interface CutMusicController ()<NMRangeSliderDelete,UIAlertViewDelegate>

@property (strong, nonatomic) UISlider *recordDurationSlider;

@property (nonatomic, strong) NSTimer *playTimer;

@property (nonatomic, strong) AEAudioFilePlayer *recordVideoPlayer;

@property (nonatomic, strong) UILabel *startTime;

@property (nonatomic, strong) UILabel *startLabel;

@property (nonatomic, strong) UILabel *endLabel;

@property (nonatomic, strong) NSString *filePath;

@property (nonatomic, strong) NSString *firstOutPutFilePath;

@property (nonatomic, strong) NSString *lastOutPutFilePath;

//outPutFilePath
@property (nonatomic, strong) NSString *outPutFilePath;

@property (nonatomic, strong) UILabel *auditionTitle;

@end

@implementation CutMusicController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"裁剪";
    
    UIImageView *headerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 0)];
    headerView.image = [UIImage imageNamed:@"bg"];
    [self.view addSubview:headerView];
    
    UIImageView *timeView = [[UIImageView alloc] initWithFrame:CGRectMake(0, mainSpacing15, 165, 165)];
    timeView.centerX = self.view.width * 0.5;
    timeView.image = [UIImage imageNamed:@"t_bg"];
    [headerView addSubview:timeView];
    
    UILabel *startLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, timeView.width, 44)];
    startLabel.centerY = timeView.height / 5 * 2 - 2;
    self.startLabel = startLabel;
    startLabel.text = @"00:00:00";
    startLabel.textColor = [UIColor whiteColor];
    startLabel.textAlignment = NSTextAlignmentCenter;
    startLabel.font = [UIFont systemFontOfSize:22];
    [timeView addSubview:startLabel];
    
    UILabel *cneterLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, startLabel.width, mainSpacing)];
    cneterLabel.textAlignment = NSTextAlignmentCenter;
    cneterLabel.centerY = timeView.height * 0.5;
    cneterLabel.text = @"-";
    cneterLabel.textColor = [UIColor whiteColor];
    cneterLabel.font = [UIFont systemFontOfSize:22];
    [timeView addSubview:cneterLabel];

    UILabel *endLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, timeView.width, 44)];
    endLabel.centerY = timeView.height / 5 * 3 + 5;
    self.endLabel = endLabel;
    endLabel.text = self.videoLength;
    endLabel.textColor = [UIColor whiteColor];
    endLabel.textAlignment = NSTextAlignmentCenter;
    endLabel.font = [UIFont systemFontOfSize:22];
    [timeView addSubview:endLabel];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(timeView.frame), self.view.width, 44)];
    titleLabel.text = @"此时间段的内容将被剪掉";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:ys_f24];
    [self.view addSubview:titleLabel];
    
    headerView.height = CGRectGetMaxY(titleLabel.frame) + mainSpacing;
    
    UILabel *subTitle = [[UILabel alloc] initWithFrame:CGRectMake(mainSpacing15, CGRectGetMaxY(headerView.frame), self.view.width -  2 * mainSpacing15, 44)];
    subTitle.font = [UIFont systemFontOfSize:ys_f24];
    subTitle.textColor = AuxiliaryColor;
    NSString *allString = @"拖动裁剪  可自由拖动剪刀，选择需要被剪掉的时间段";
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:allString];
    [string addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:ys_28] range:[allString rangeOfString:@"拖动裁剪"]];
    [string addAttribute:NSForegroundColorAttributeName value:MainTextColor range:[allString rangeOfString:@"拖动裁剪"]];
    subTitle.attributedText = string;
    [self.view addSubview:subTitle];

    UIView *recordTime = [[UIView alloc] initWithFrame:CGRectMake(mainSpacing15, CGRectGetMaxY(subTitle.frame), self.view.width - 2 * mainSpacing15, 54)];
    recordTime.layer.cornerRadius = 2.5;
    recordTime.layer.masksToBounds = YES;
    recordTime.backgroundColor = SepaViewColor;
    [self.view addSubview:recordTime];
    
    //滑动条
    UISlider *durationSlider = [[UISlider alloc] initWithFrame:CGRectMake(mainSpacing15, 0, recordTime.width - 2 * mainSpacing15, 34)];
    self.recordDurationSlider = durationSlider;
    [durationSlider setThumbImage:[[UIImage alloc] init] forState:UIControlStateNormal];
    [durationSlider setThumbImage:[[UIImage alloc] init] forState:UIControlStateHighlighted];
    headerView.userInteractionEnabled = YES;
    [recordTime addSubview:durationSlider];
    [durationSlider setMinimumTrackTintColor:MainColor];
    [durationSlider setMaximumTrackTintColor:RGBCOLOR(237,238,240)];
    
    NMRangeSlider *rangeSlider = [[NMRangeSlider alloc] initWithFrame:CGRectMake(mainSpacing15, 0, recordTime.width - 2 * mainSpacing15, 34)];
    rangeSlider.nMRangeSliderDelete = self;
    int time = 0;

    if (self.videoLength.length > 0 && [self.videoLength containsString:@":"]) {
        NSArray *times = [self.videoLength componentsSeparatedByString:@":"];
        time = [times[2] intValue];
        time += [times[1] intValue] * 60;
        time += [times[0] intValue] * 60 * 60;
    }
    
    NSString *s = [NSString stringWithFormat:@"%ld",(long)time];
    rangeSlider.maximumValue = [s floatValue];
    
    rangeSlider.lowerValue = 0;
    rangeSlider.upperValue = [s floatValue];
    rangeSlider.lowerHandleImageNormal = [UIImage imageNamed:@"jiandao_left"];
    rangeSlider.lowerHandleImageHighlighted = [UIImage imageNamed:@"jiandao_left"];
    rangeSlider.upperHandleImageNormal = [UIImage imageNamed:@"jiandao_right"];
    rangeSlider.upperHandleImageHighlighted = [UIImage imageNamed:@"jiandao_right"];
    [recordTime addSubview:rangeSlider];
    
    UILabel *startTime = [[UILabel alloc] initWithFrame:CGRectMake(mainSpacing15, CGRectGetMaxY(rangeSlider.frame), recordTime.width * 0.5, 10)];
    startTime.text = @"00:00:00";
    startTime.textColor = MainTextColor;
    startTime.font = [UIFont systemFontOfSize:ys_f24];
    [recordTime addSubview:startTime];
    
    UILabel *endTime = [[UILabel alloc] initWithFrame:CGRectMake(recordTime.width * 0.5, startTime.y, recordTime.width * 0.5 - mainSpacing15, 10)];
    endTime.text = self.videoLength;
    self.startTime = startTime;
    endTime.textAlignment = NSTextAlignmentRight;
    endTime.font = [UIFont systemFontOfSize:ys_f24];
    endTime.textColor = MainTextColor;
    [recordTime addSubview:endTime];
    
    [self playRecordCH1];
    [self addTimer];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem setRightNavigationBarBackGroundImgName:@"\U0000e807" target:self selector:@selector(back) imageColor:[UIColor whiteColor] imageFont:18];
    
    //试听的时候底部菜单
    NSArray *auditionButtonTitles = @[@"取消",@"剪掉"];
    
    //底部菜单
    UIView *auditionFootView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.height - 44 - 64, self.view.width, 44)];
    UIView *auditionSepaView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, auditionFootView.width, 0.5)];
    auditionSepaView.backgroundColor = SepaViewColor;
    [auditionFootView addSubview:auditionSepaView];
    
    for (int i = 0 ; i < auditionButtonTitles.count; i ++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0.5, auditionFootView.width * 0.5, auditionFootView.height)];
        [button addTarget:self action:@selector(auditionFootViewButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i;
        [button setTitleColor:MainTextColor forState:UIControlStateNormal];
        button.x = button.width * i;
        [button setTitle:auditionButtonTitles[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:ys_28];
        [auditionFootView addSubview:button];
        
        if (i != 0) {
            UIView *sepaView = [[UIView alloc] initWithFrame:CGRectMake(i * button.width, 0, 0.5, auditionFootView.height - 2 * mainSpacing15)];
            sepaView.backgroundColor = SepaViewColor;
            sepaView.centerY = auditionFootView.height * 0.5;
            [auditionFootView addSubview:sepaView];
            
        }
    }
    [self.view addSubview:auditionFootView];
    
    //试听暂停 继续
    UIButton *auditionButton = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(recordTime.frame) + mainSpacing, 79, 79)];
    [auditionButton setImage:[UIImage imageNamed:@"shiting"] forState:UIControlStateNormal];
    auditionButton.centerY = (self.view.height - CGRectGetMaxY(headerView.frame)) * 0.5 + CGRectGetMaxY(headerView.frame) - 64;
    [auditionButton addTarget:self action:@selector(auditionButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    auditionButton.centerX = self.view.width * 0.5;
    [auditionButton setImage:[UIImage imageNamed:@"zanting"] forState:UIControlStateSelected];
    auditionButton.titleLabel.textColor = AuxiliaryColor;
    [self.view addSubview:auditionButton];
    
    UILabel *auditionTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(auditionButton.frame), self.view.width, 30)];
    self.auditionTitle = auditionTitle;
    auditionTitle.textAlignment = NSTextAlignmentCenter;
    auditionTitle.centerX = auditionButton.centerX;
    auditionTitle.text = @"正在试听中，点击可以暂停试听";
    auditionTitle.textColor = AuxiliaryColor;
    auditionTitle.font = [UIFont systemFontOfSize:ys_f24];
    [self.view addSubview:auditionTitle];
    
}

- (void) auditionButtonClick : (UIButton *) button
{

    button.selected = !button.selected;
    
    if (button.selected) {
        self.auditionTitle.text = @"已暂停试听，点击可继续试听";
        [self.playTimer setFireDate:[NSDate distantFuture]];
        _recordVideoPlayer.channelIsPlaying = NO;
    }else
    {
        self.auditionTitle.text = @"正在试听中，点击可暂停试听";
        [self.playTimer setFireDate:[NSDate date]];
        _recordVideoPlayer.channelIsPlaying = YES;
    }
}

- (void) back
{

    if (self.playTimer) {
        [self.playTimer invalidate];
        self.playTimer = nil;
    }
    
    [self stopCH1Playthrough];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark 停止
- (void)stopCH1Playthrough {
    if (_recordVideoPlayer) {
        [_audioController removeChannels:@[_recordVideoPlayer]];
        _recordVideoPlayer = nil;
    }
}

#pragma mark - 播放录音
- (void)playRecordCH1 {
    // 如果文件不存在,结束
    if ( ![[NSFileManager defaultManager] fileExistsAtPath:self.videoPath] ) {
        return;
    }
    
    NSError *error = nil;
    
    // 利用AEAudioFilePlayer对象进行播放
    _recordVideoPlayer = [[AEAudioFilePlayer alloc] initWithURL:[NSURL fileURLWithPath:self.videoPath] error:&error];
    if (!_recordVideoPlayer) {
        [[[UIAlertView alloc] initWithTitle:@"Error"
                                    message:[NSString stringWithFormat:@"Couldn't start playback: %@", [error localizedDescription]]
                                   delegate:nil
                          cancelButtonTitle:nil
                          otherButtonTitles:@"OK", nil] show];
        return;
    }
    
    // 进行播放
    [_audioController addChannels:@[_recordVideoPlayer]];
    
    __weak CutMusicController *weakSelf = self;
    
    _recordVideoPlayer.completionBlock = ^{
        [weakSelf.playTimer invalidate];
        weakSelf.playTimer = nil;
    };
    
    weakSelf.recordDurationSlider.maximumValue = (int)_recordVideoPlayer.duration;
    
}

- (void)addTimer
{
    self.playTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timerHandler) userInfo:nil repeats:YES];
}

- (void)timerHandler
{
    if ((int)_recordVideoPlayer.currentTime + 1 <= _recordVideoPlayer.duration) {
        self.recordDurationSlider.value = (int)_recordVideoPlayer.currentTime + 1;
        [self performSelectorOnMainThread:@selector(runItem1) withObject:nil waitUntilDone:YES];
    }
}

- (void) runItem1
{
    self.startTime.text = [DWTools formatSecondsToString:_recordVideoPlayer.currentTime + 1];
}

- (void)nMRangeSliderStartChange:(NSString *)title
{
    self.startLabel.text = title;
}

- (void)nMRangeSliderEndChange:(NSString *)title
{
    self.endLabel.text = title;
}

- (void)dealloc
{
    
}

- (void) auditionFootViewButtonClick : (UIButton *) button
{
 
    //取消
    if (button.tag == 0) {
        [self back];
    }
    //剪掉
    else if(button.tag == 1)
    {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"" message:@"剪掉整段内容，将无法找回。如果有需要，可重新录制，您确定要剪掉吗？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
    }
}

#pragma mark 根据时分秒 获取 秒数
- (int) getTime : (NSString *) timeSting
{
    int time = 0;
    
    if (timeSting.length > 0 && [timeSting containsString:@":"]) {
        NSArray *times = [timeSting componentsSeparatedByString:@":"];
        time = [times[2] intValue];
        time += [times[1] intValue] * 60;
        time += [times[0] intValue] * 60 * 60;
    }

    return time;
}

#pragma mark 裁剪
- (void)cutMusic : (int64_t) startTime endTime : (int64_t) endTime isFrist : (BOOL) isFrist
{
    AVURLAsset *videoAsset = [AVURLAsset assetWithURL:[NSURL fileURLWithPath:self.videoPath]];
    //音频输出会话
    //AVAssetExportPresetAppleM4A: This export option will produce an audio-only .m4a file with appropriate iTunes gapless playback data(输出音频,并且是.m4a格式)
    AVAssetExportSession *exportSession = [AVAssetExportSession exportSessionWithAsset:videoAsset presetName:AVAssetExportPresetAppleM4A];
    //设置输出路径 / 文件类型 / 截取时间段
    __weak CutMusicController *weakSelf = self;

    NSString *outPutFilePath = [self getPath : isFrist];
    
    exportSession.outputURL = [NSURL fileURLWithPath:outPutFilePath];
    exportSession.outputFileType = AVFileTypeAppleM4A;
    exportSession.timeRange = CMTimeRangeFromTimeToTime(CMTimeMake(startTime, 1), CMTimeMake(endTime, 1));
    [exportSession exportAsynchronouslyWithCompletionHandler:^{
        if (exportSession.status == AVAssetExportSessionStatusCompleted) {
            if (isFrist) {
                self.firstOutPutFilePath = outPutFilePath;
                [weakSelf performSelectorOnMainThread:@selector(firstSuccess) withObject:nil waitUntilDone:YES];
            }else
            {
                self.lastOutPutFilePath = outPutFilePath;
                [weakSelf performSelectorOnMainThread:@selector(lastSuccess) withObject:nil waitUntilDone:YES];
            }
        }else
        {
            [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].keyWindow];
            [weakSelf performSelectorOnMainThread:@selector(error) withObject:nil waitUntilDone:YES];
        }
    }];
}

- (void) error
{
    [MBProgressHUD showError:@"裁剪失败"];
}

- (void) lastSuccess
{
    //裁剪成功后 拼接 第一段+第二段
    if (self.firstOutPutFilePath.length > 0 && self.lastOutPutFilePath.length > 0) {
        AVURLAsset *audioAsset1 = [AVURLAsset assetWithURL:[NSURL fileURLWithPath:[self lastOutPutFilePath]]];
        AVURLAsset *audioAsset2 = [AVURLAsset assetWithURL:[NSURL fileURLWithPath:[self firstOutPutFilePath]]];
        
        AVMutableComposition *composition = [AVMutableComposition composition];
        
        // 音频通道
        AVMutableCompositionTrack *audioTrack1 = [composition addMutableTrackWithMediaType:AVMediaTypeAudio preferredTrackID:0];
        AVMutableCompositionTrack *audioTrack2 = [composition addMutableTrackWithMediaType:AVMediaTypeAudio preferredTrackID:0];
        
        // 音频采集通道
        AVAssetTrack *audioAssetTrack1 = [[audioAsset1 tracksWithMediaType:AVMediaTypeAudio] firstObject];
        AVAssetTrack *audioAssetTrack2 = [[audioAsset2 tracksWithMediaType:AVMediaTypeAudio] firstObject];
        
        
        // 音频合并 - 插入音轨文件
        [audioTrack1 insertTimeRange:CMTimeRangeMake(kCMTimeZero, audioAsset1.duration) ofTrack:audioAssetTrack1 atTime:kCMTimeZero error:nil];
        // `startTime`参数要设置为第一段音频的时长，即`audioAsset1.duration`, 表示将第二段音频插入到第一段音频的尾部。
        [audioTrack2 insertTimeRange:CMTimeRangeMake(kCMTimeZero, audioAsset2.duration) ofTrack:audioAssetTrack2 atTime:audioAsset1.duration error:nil];
        
        // 合并后的文件导出 - `presetName`要和之后的`session.outputFileType`相对应。
        AVAssetExportSession *session = [[AVAssetExportSession alloc] initWithAsset:composition presetName:AVAssetExportPresetAppleM4A];
        NSString *outPutFilePath = [self getPath:YES];
        if ([[NSFileManager defaultManager] fileExistsAtPath:outPutFilePath]) {
            [[NSFileManager defaultManager] removeItemAtPath:outPutFilePath error:nil];
        }
        self.outPutFilePath = outPutFilePath;
        // 查看当前session支持的fileType类型
        session.outputURL = [NSURL fileURLWithPath:outPutFilePath];
        session.outputFileType = AVFileTypeAppleM4A; //与上述的`present`相对应
        session.shouldOptimizeForNetworkUse = YES;   //优化网络
        
        __weak CutMusicController *weakSelf = self;

        [session exportAsynchronouslyWithCompletionHandler:^{
            if (session.status == AVAssetExportSessionStatusCompleted) {
                [weakSelf performSelectorOnMainThread:@selector(invoke) withObject:nil waitUntilDone:YES];

            } else {
                // 其他情况, 具体请看这里`AVAssetExportSessionStatus`.
                
                [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].keyWindow];

            }
            
        }];
    }
}

- (void) invoke
{
    
    if (self.firstOutPutFilePath.length > 0 && ![self.firstOutPutFilePath isEqualToString:self.outPutFilePath]) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:self.firstOutPutFilePath]) {
            [[NSFileManager defaultManager] removeItemAtPath:self.firstOutPutFilePath error:nil];
            self.firstOutPutFilePath = nil;
        }
    }
    
    if (self.lastOutPutFilePath.length > 0 && ![self.firstOutPutFilePath isEqualToString:self.outPutFilePath]) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:self.lastOutPutFilePath]) {
            [[NSFileManager defaultManager] removeItemAtPath:self.lastOutPutFilePath error:nil];
            self.lastOutPutFilePath = nil;
        }
    }
    
    if (self.videoPath.length > 0 && ![self.firstOutPutFilePath isEqualToString:self.outPutFilePath]) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:self.videoPath]) {
            [[NSFileManager defaultManager] removeItemAtPath:self.videoPath error:nil];
            self.videoPath = nil;
        }
    }
    
    __weak CutMusicController *weakSelf = self;

    int startTime = [self getTime:self.startLabel.text];
    int endTime = [self getTime:self.endLabel.text];
    int allTime = [self getTime:self.videoLength];
    int currentTime = startTime + (allTime - endTime);
    
    [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].keyWindow];

    [MBProgressHUD showSuccess:@"裁剪成功"];
    if ([weakSelf.cutMusicControllerDelete respondsToSelector:@selector(cutMusicSuccess:currentTime:)]) {
        [weakSelf.cutMusicControllerDelete cutMusicSuccess:self.outPutFilePath currentTime:currentTime];
    }
    
    [weakSelf back];
}

- (void) firstSuccess
{
    //裁剪第一段
    [self cutMusic:0 endTime:[self getTime:self.startLabel.text] isFrist:NO];

}


//录制音频沙盒路径
- (NSString *)getPath : (BOOL) isFrist
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYYMMddhhmmss"];
    NSString *recordName = [NSString stringWithFormat:@"%@%@.wav", [formatter stringFromDate:[NSDate date]] , isFrist ? @"0" : @"1"];
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:recordName];
    
    return path;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        [self stopCH1Playthrough];
        [MBProgressHUD showMessage:@"正在裁剪，可能会耽误您几分钟" toView:[UIApplication sharedApplication].keyWindow];
        
        //尾部剪刀没动
        if ([self.endLabel.text isEqualToString:self.videoLength]) {
            AVURLAsset *videoAsset = [AVURLAsset assetWithURL:[NSURL fileURLWithPath:self.videoPath]];
            //音频输出会话
            //AVAssetExportPresetAppleM4A: This export option will produce an audio-only .m4a file with appropriate iTunes gapless playback data(输出音频,并且是.m4a格式)
            AVAssetExportSession *exportSession = [AVAssetExportSession exportSessionWithAsset:videoAsset presetName:AVAssetExportPresetAppleM4A];
            //设置输出路径 / 文件类型 / 截取时间段
            __weak CutMusicController *weakSelf = self;
            
            NSString *outPutFilePath = [self getPath : NO];
            self.outPutFilePath = outPutFilePath;
            
            exportSession.outputURL = [NSURL fileURLWithPath:outPutFilePath];
            exportSession.outputFileType = AVFileTypeAppleM4A;
            exportSession.timeRange = CMTimeRangeFromTimeToTime(CMTimeMake(0, 1), CMTimeMake([self getTime:self.startLabel.text], 1));
            [exportSession exportAsynchronouslyWithCompletionHandler:^{
                if (exportSession.status == AVAssetExportSessionStatusCompleted) {
                    
                    [weakSelf performSelectorOnMainThread:@selector(invoke) withObject:nil waitUntilDone:YES];
                    
                }else
                {
                    [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].keyWindow];
                    [weakSelf performSelectorOnMainThread:@selector(error) withObject:nil waitUntilDone:YES];
                }
            }];
            //头部剪刀没动
        }else if([self.startLabel.text isEqualToString:@"00:00:00"])
        {
            AVURLAsset *videoAsset = [AVURLAsset assetWithURL:[NSURL fileURLWithPath:self.videoPath]];
            //音频输出会话
            //AVAssetExportPresetAppleM4A: This export option will produce an audio-only .m4a file with appropriate iTunes gapless playback data(输出音频,并且是.m4a格式)
            AVAssetExportSession *exportSession = [AVAssetExportSession exportSessionWithAsset:videoAsset presetName:AVAssetExportPresetAppleM4A];
            //设置输出路径 / 文件类型 / 截取时间段
            __weak CutMusicController *weakSelf = self;
            
            NSString *outPutFilePath = [self getPath : YES];
            self.outPutFilePath = outPutFilePath;
            
            exportSession.outputURL = [NSURL fileURLWithPath:outPutFilePath];
            exportSession.outputFileType = AVFileTypeAppleM4A;
            exportSession.timeRange = CMTimeRangeFromTimeToTime(CMTimeMake([self getTime:self.endLabel.text], 1), CMTimeMake([self getTime:self.videoLength], 1));
            [exportSession exportAsynchronouslyWithCompletionHandler:^{
                if (exportSession.status == AVAssetExportSessionStatusCompleted) {
                    
                    [weakSelf performSelectorOnMainThread:@selector(invoke) withObject:nil waitUntilDone:YES];
                    
                }else
                {
                    [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].keyWindow];
                    [weakSelf performSelectorOnMainThread:@selector(error) withObject:nil waitUntilDone:YES];
                }
            }];
            
        }
        else
        {
            [self cutMusic:[self getTime:self.endLabel.text] endTime:[self getTime:self.videoLength] isFrist:YES];
        }
    }
}


@end
