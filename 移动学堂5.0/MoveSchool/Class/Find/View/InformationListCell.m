//
//  InformationListCell.m
//  MoveSchool
//
//  Created by edz on 2017/8/21.
//
//

#import "InformationListCell.h"
#import "UIImageView+WebCache.h"
#import "InformationListModel.h"
#import "UILabel+Extension.h"

@interface InformationListCell()

@property (nonatomic, strong) UIImageView *imgView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *lookLabel;

@property (nonatomic, strong) UILabel *timeLabel;

@property (nonatomic, strong) UIView *boomView;

@end

@implementation InformationListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.imgView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.imgView];
        
        self.boomView = [[UIView alloc] init];
        [self.contentView addSubview:self.boomView];
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.numberOfLines = 2;
        self.titleLabel.font = [UIFont systemFontOfSize:ys_f30];
        self.titleLabel.textColor = MainTextColor;
        [self.contentView addSubview:self.titleLabel];
        
        self.lookLabel = [[UILabel alloc] init];
        self.lookLabel.font = [UIFont systemFontOfSize:ys_f24];
        self.lookLabel.textColor = AuxiliaryColor;
        [self.boomView addSubview:self.lookLabel];
        
        self.timeLabel = [[UILabel alloc] init];
        self.timeLabel.font = [UIFont systemFontOfSize:ys_f24];
        self.timeLabel.textColor = AuxiliaryColor;
        [self.boomView addSubview:self.timeLabel];
        
        self.sepaView = [[UIView alloc] init];
        self.sepaView.backgroundColor = SepaViewColor;
        [self.contentView addSubview:self.sepaView];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imgView.frame = CGRectMake(self.contentView.width - 114 - 15, 0, 114, 63);
    self.imgView.centerY = self.contentView.height * 0.5;
    
    self.titleLabel.frame = CGRectMake(15, 15, self.imgView.x - 10 - 15, self.contentView.height - 30 - 15);
    
    [UILabel changeLineSpaceForLabel:self.titleLabel WithSpace:2.5];
    self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    
    self.boomView.frame = CGRectMake(self.titleLabel.x, self.contentView.height - 35, self.imgView.x - 10 - 15, 30);
    
    self.lookLabel.frame = CGRectMake(0, 0, self.boomView.width * 0.5,self.boomView.height);
    
    self.timeLabel.frame = CGRectMake(self.boomView.width * 0.5, 0, self.boomView.width * 0.5,self.boomView.height);

    self.sepaView.frame = CGRectMake(15, self.contentView.height - 0.5, self.contentView.width, 0.5);
}

- (void)setModel:(InformationListModel *)model
{
    _model = model;
    
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:[UIImage imageNamed:@"zwt_zixun"]];
    
    self.titleLabel.text = model.title;
    self.lookLabel.text = [NSString stringWithFormat:@"浏览量：%@",model.readnum];
    self.timeLabel.text = model.publishdate;
}

@end
