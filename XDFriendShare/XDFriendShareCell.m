//
//  XDFriendShareCell.m
//  XDFriendShare
//
//  Created by 郎学东 on 2017/12/1.
//  Copyright © 2017年 郎学东. All rights reserved.
//

#import "XDFriendShareCell.h"
#import "UIImage+Extension.h"
#import "NSString+Extension.h"
#import <XHImageViewer.h>
#import "GlobalUI.h"
#define imgHeight  (CGRectGetWidth([UIScreen mainScreen].bounds) - 80)/3

@interface XDFriendShareCell ()

@property (nonatomic,strong) UIImageView * avatorImg;
@property (nonatomic,strong) UILabel * nameLabel;
@property (nonatomic,strong) UIImageView * moreImg;
@property (nonatomic,strong) UILabel * flagLabel;
@property (nonatomic,strong) UILabel * titleLabel;
@property (nonatomic,strong) UILabel * contentLabel;
@property (nonatomic,strong) UIView  * bgImgsView; // 9张图片bgView
@property (nonatomic,strong) UIImageView * timeImg;
@property (nonatomic,strong) UILabel * timeLabel;
@property (nonatomic,strong) UIImageView * commentImg;
@property (nonatomic,strong) UILabel * commentLabel;
@property (nonatomic,strong) UIImageView * zanImg;
@property (nonatomic,strong) UILabel * zanLabel;

@property (nonatomic,strong) NSArray * imgArray;
@property (nonatomic,strong) NSMutableArray * groupImgArr;
@property (nonatomic,assign) BOOL isZan;
@end

@implementation XDFriendShareCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    _avatorImg = [GlobalUI createImageViewbgColor:[UIColor whiteColor]];
    _avatorImg.image = [[UIImage imageNamed:@"panghu.jpg"] clipImageWithRadius:15];
    _nameLabel = [GlobalUI createLabelFont:14 titleColor:[UIColor lightGrayColor] bgColor:[UIColor whiteColor]];
    _moreImg = [GlobalUI createImageViewbgColor:[UIColor whiteColor]];
    _moreImg.image = [UIImage imageNamed:@"more_icon"];
    
    _titleLabel = [GlobalUI createLabelFont:14 titleColor:[UIColor blackColor] bgColor:[UIColor whiteColor]];
    _contentLabel = [GlobalUI createLabelFont:14 titleColor:[UIColor blackColor] bgColor:[UIColor whiteColor]];
    _contentLabel.numberOfLines = 0;
    
    _timeImg = [GlobalUI createImageViewbgColor:[UIColor whiteColor]];
    _timeImg.image = [UIImage imageNamed:@"time_icon"];
    _timeLabel = [GlobalUI createLabelFont:14 titleColor:[UIColor blackColor] bgColor:[UIColor whiteColor]];
    _commentImg = [GlobalUI createImageViewbgColor:[UIColor whiteColor]];
    _commentImg.image = [UIImage imageNamed:@"review_icon"];
    _commentLabel = [GlobalUI createLabelFont:14 titleColor:[UIColor blackColor] bgColor:[UIColor whiteColor]];
    _zanImg = [GlobalUI createImageViewbgColor:[UIColor whiteColor]];
    _zanImg.image = [UIImage imageNamed:@"zan_icon"];
    _zanImg.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapZanBtn)];
    [_zanImg  addGestureRecognizer:tap];
    _zanLabel = [GlobalUI createLabelFont:14 titleColor:[UIColor blackColor] bgColor:[UIColor whiteColor]];
    //    [_zanLabel addGestureRecognizer:tap];
    _bgImgsView = [[UIView alloc]init];
    
    [self.contentView addSubview:_avatorImg];
    [self.contentView addSubview:_nameLabel];
    [self.contentView addSubview:_moreImg];
    [self.contentView addSubview:_titleLabel];
    [self.contentView addSubview:_contentLabel];
    [self.contentView addSubview:_timeImg];
    [self.contentView addSubview:_timeLabel];
    [self.contentView addSubview:_titleLabel];
    [self.contentView addSubview:_commentImg];
    [self.contentView addSubview:_commentLabel];
    [self.contentView addSubview:_zanImg];
    [self.contentView addSubview:_zanLabel];
    [self.contentView addSubview:_bgImgsView];
    _groupImgArr = [NSMutableArray array];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _avatorImg.frame = CGRectMake(10, 10, 40, 40);
    _nameLabel.frame = CGRectMake(CGRectGetMaxX(_avatorImg.frame) + 10, 10, 100, 30);
    _moreImg.frame = CGRectMake(CGRectGetWidth(self.contentView.bounds) - 35, 20, 20, 10);
    
    _titleLabel.frame = CGRectMake(20, 50, CGRectGetWidth(self.contentView.bounds) - 60, 20);
    
    CGFloat contentHeight = [_contentLabel.text heightWithWidth:CGRectGetWidth(self.contentView.bounds) - 40 font:14];
    _contentLabel.frame = CGRectMake(20, 80, CGRectGetWidth(self.contentView.bounds) - 40, contentHeight);
    NSInteger row = _imgArray.count / 3;// 多少行图片
    if (_imgArray.count %3 !=0) {
        ++row;
    }
    // 是否有图片，如果有图片  高度= 图片的总高度 + 中间的间距 ，如果没有 ，高度=0
    CGFloat bgH = _imgArray.count ? row * imgHeight + (row-1) * 10 :0;
    _bgImgsView.frame = CGRectMake(30, CGRectGetMaxY(_contentLabel.frame) + 10, CGRectGetWidth([UIScreen mainScreen].bounds) - 60, bgH);
    _timeImg.frame = CGRectMake(23, CGRectGetHeight(self.contentView.bounds) - 35, 25, 25);
    _timeLabel.frame = CGRectMake(CGRectGetMaxX(_timeImg.frame), CGRectGetMinY(_timeImg.frame), 100, 25);
    _commentImg.frame = CGRectMake(CGRectGetWidth(self.contentView.bounds) - 150, CGRectGetHeight(self.contentView.bounds) - 35, 25, 25);
    _commentLabel.frame = CGRectMake(CGRectGetMaxX(_commentImg.frame), CGRectGetHeight(self.contentView.bounds) - 35, 40, 30);
    _zanImg.frame = CGRectMake(CGRectGetMaxX(_commentLabel.frame) + 5, CGRectGetHeight(self.contentView.bounds) - 35, 25, 25);
    _zanLabel.frame = CGRectMake(CGRectGetMaxX(_zanImg.frame), CGRectGetHeight(self.contentView.bounds) - 35, 40, 30);
    
}

- (void)tapZanBtn{
    _isZan = !_isZan;
    UIImage * selZan = [[UIImage imageNamed:@"zan_icon"]createImageWithColor:[UIColor redColor]];
    if (_isZan) {
        _zanImg.image = selZan;
        NSInteger zanNum = [_zanLabel.text integerValue];
        ++zanNum;
        _zanLabel.text = [NSString stringWithFormat:@"%ld",zanNum];
    }else{
        _zanImg.image = [UIImage imageNamed:@"zan_icon"];
        NSInteger zanNum = [_zanLabel.text integerValue];
        --zanNum;
        _zanLabel.text = [NSString stringWithFormat:@"%ld",zanNum];
    }
}

- (void)setModel:(CellModel *)model{
    if (_groupImgArr.count) {
        [_groupImgArr enumerateObjectsUsingBlock:^(UIImageView * obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj removeFromSuperview];
        }];
        [_groupImgArr removeAllObjects];
    }
    _imgArray = [model.imgsss componentsSeparatedByString:@","];
    if (_imgArray.count) {
        [self setupImageGroupView];
    }
    _avatorImg.image = [UIImage imageNamed:model.avator] ;
    _nameLabel.text = model.name;
    _titleLabel.text = model.title;
    _contentLabel.text = model.content;
    _timeLabel.text = model.time;
    _commentLabel.text = model.comemtNum;
    _zanLabel.text = model.zanNum;
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setupImageGroupView{
    CGFloat w = imgHeight;
    CGFloat h = imgHeight;
    
    CGFloat edge = 10;
    for (int i = 0; i<_imgArray.count; i++) {
        
        int row = i / 3;
        int loc = i % 3;
        CGFloat x = (edge + w) * loc ;
        CGFloat y = (edge + h) * row;
        
        UIImageView * img =[[UIImageView alloc]init];
        img.image = [UIImage imageNamed:_imgArray[i]];
        img.backgroundColor = [UIColor greenColor];
        img.frame = CGRectMake(x, y, w, h);
        img.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(browerImage:)];
        [img addGestureRecognizer:tap];
        [_bgImgsView addSubview:img];
        [_groupImgArr addObject:img];
    }
    
}

#pragma mark - brower image
- (void)browerImage:(UITapGestureRecognizer *)gest{
    UIImageView * tapView = (UIImageView *)gest.view;
    XHImageViewer * brower  = [[XHImageViewer alloc]init];
    [brower showWithImageViews:_groupImgArr selectedView:tapView];
}

+ (CGFloat)cellHeightWithStr:(NSString *)str imgs:(NSArray *)imgs{
    CGFloat strH = [str heightWithWidth:CGRectGetWidth([UIScreen mainScreen].bounds) - 40 font:14];
    CGFloat cellH = strH + 160;
    NSInteger row = imgs.count / 3 ;
    if (imgs.count) {
        if ( imgs.count % 3 !=0) {
            row += 1;
        }
        cellH +=  row * imgHeight  + (row-1) * 10; // 图片高度 + 间隙
    }
    return  cellH;
}

+ (XDFriendShareCell *)dynamicCellWithTable:(UITableView *)table{
    XDFriendShareCell * cell = [table dequeueReusableCellWithIdentifier:NSStringFromClass(self)];
    if (!cell) {
        cell = [[XDFriendShareCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(self)];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}


@end
