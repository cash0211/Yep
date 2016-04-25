//
//  GridView.m
//  Yep
//
//  Created by cash on 16/4/19.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import "GridView.h"
#import "YYKit.h"
#import "YepMacro.h"

#define kViewHeight      142
#define kGridWidth       kScreenWidth / 2
#define kGridHeight      kViewHeight / 2

#define kBtnSubViewsPadding       10
#define kBtnImgViewSize           kGridHeight - kBtnSubViewsPadding * 2
#define kBtnLabelWidth            (kGridWidth) - (kBtnSubViewsPadding * 3) - (kBtnImgViewSize)
#define kBtnLabelHeight           20
#define kBtnTitleLabelFontSize    14
#define kBtnDescLabelFontSize     12

#define kBtnDescLabelTextColor    UIColorHex(b4b4b4)

@interface GridView ()

@property (nonatomic, strong) CALayer *topLine;
@property (nonatomic, strong) CALayer *horizontalLine;
@property (nonatomic, strong) CALayer *verticalLine;
@property (nonatomic, strong) CALayer *bottomLine;

@end

@implementation GridView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    self.backgroundColor = [UIColor whiteColor];
    self.size = CGSizeMake(kScreenWidth, kViewHeight);
    [self _initSubViews];
    return self;
}

- (void)_initSubViews {
    _topLine = [CALayer layer];
    _topLine.size = CGSizeMake(kScreenWidth, CGFloatFromPixel(1));
    _topLine.backgroundColor = kYPLineColor;
    
    _horizontalLine = [CALayer layer];
    _horizontalLine.size = CGSizeMake(kScreenWidth - 16, CGFloatFromPixel(1));
    _horizontalLine.top = kViewHeight / 2;
    _horizontalLine.left = 8;
    _horizontalLine.backgroundColor = kYPLineColor;
    
    _verticalLine = [CALayer layer];
    _verticalLine.size = CGSizeMake(CGFloatFromPixel(1), kViewHeight - 16);
    _verticalLine.top = 8;
    _verticalLine.left = kScreenWidth / 2;
    _verticalLine.backgroundColor = kYPLineColor;
    
    _bottomLine = [CALayer layer];
    _bottomLine.size = CGSizeMake(kScreenWidth, CGFloatFromPixel(1));
    _bottomLine.bottom = self.height;
    _bottomLine.backgroundColor = kYPLineColor;
    
    _topLeftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _topLeftBtn.exclusiveTouch = YES;
    _topLeftBtn.size = CGSizeMake(kGridWidth, kGridHeight);
    [_topLeftBtn setBackgroundImage:[UIImage imageWithColor:kYPBtnHighlightColor] forState:UIControlStateHighlighted];
    
    _topRightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _topRightBtn.exclusiveTouch = YES;
    _topRightBtn.size = CGSizeMake(kGridWidth, kGridHeight);
    _topRightBtn.left = _topLeftBtn.right;
    [_topRightBtn setBackgroundImage:[UIImage imageWithColor:kYPBtnHighlightColor] forState:UIControlStateHighlighted];
    
    _bottomLeftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _bottomLeftBtn.exclusiveTouch = YES;
    _bottomLeftBtn.size = CGSizeMake(kGridWidth, kGridHeight);
    _bottomLeftBtn.top = _topLeftBtn.bottom;
    [_bottomLeftBtn setBackgroundImage:[UIImage imageWithColor:kYPBtnHighlightColor] forState:UIControlStateHighlighted];
    
    _bottomRightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _bottomRightBtn.exclusiveTouch = YES;
    _bottomRightBtn.size = CGSizeMake(kGridWidth, kGridHeight);
    _bottomRightBtn.top = _topRightBtn.bottom;
    _bottomRightBtn.left = _bottomLeftBtn.right;
    [_bottomRightBtn setBackgroundImage:[UIImage imageWithColor:kYPBtnHighlightColor] forState:UIControlStateHighlighted];
    
    _topLeftImageView = [UIImageView new];
    _topLeftImageView.size = CGSizeMake(kBtnImgViewSize, kBtnImgViewSize);
    _topLeftImageView.top = kBtnSubViewsPadding;
    _topLeftImageView.right = kGridWidth - kBtnSubViewsPadding;
    
    _topRightImageView = [UIImageView new];
    _topRightImageView.size = CGSizeMake(kBtnImgViewSize, kBtnImgViewSize);
    _topRightImageView.top = kBtnSubViewsPadding;
    _topRightImageView.right = kGridWidth - kBtnSubViewsPadding;
    
    _bottomLeftImageView = [UIImageView new];
    _bottomLeftImageView.size = CGSizeMake(kBtnImgViewSize, kBtnImgViewSize);
    _bottomLeftImageView.top = kBtnSubViewsPadding;
    _bottomLeftImageView.right = kGridWidth - kBtnSubViewsPadding;
    
    _bottomRightImageView = [UIImageView new];
    _bottomRightImageView.size = CGSizeMake(kBtnImgViewSize, kBtnImgViewSize);
    _bottomRightImageView.top = kBtnSubViewsPadding;
    _bottomRightImageView.right = kGridWidth - kBtnSubViewsPadding;
    
    [_topLeftBtn addSubview:_topLeftImageView];
    [_topRightBtn addSubview:_topRightImageView];
    [_bottomLeftBtn addSubview:_bottomLeftImageView];
    [_bottomRightBtn addSubview:_bottomRightImageView];
    
    _topLeftTitleLabel = [UILabel new];
    _topLeftTitleLabel.size = CGSizeMake(kBtnLabelWidth, kBtnLabelHeight);
    _topLeftTitleLabel.userInteractionEnabled = NO;
    _topLeftTitleLabel.textColor = [UIColor orangeColor];
    _topLeftTitleLabel.font = [UIFont systemFontOfSize:kBtnTitleLabelFontSize];
    _topLeftTitleLabel.top = kBtnSubViewsPadding + 5;
    _topLeftTitleLabel.left = kBtnSubViewsPadding;
    
    _topRightTitleLabel = [UILabel new];
    _topRightTitleLabel.size = CGSizeMake(kBtnLabelWidth, kBtnLabelHeight);
    _topRightTitleLabel.userInteractionEnabled = NO;
    _topRightTitleLabel.textColor = [UIColor blueColor];
    _topRightTitleLabel.font = [UIFont systemFontOfSize:kBtnTitleLabelFontSize];
    _topRightTitleLabel.top = kBtnSubViewsPadding + 5;
    _topRightTitleLabel.left = kBtnSubViewsPadding;
    
    _bottomLeftTitleLabel = [UILabel new];
    _bottomLeftTitleLabel.size = CGSizeMake(kBtnLabelWidth, kBtnLabelHeight);
    _bottomLeftTitleLabel.userInteractionEnabled = NO;
    _bottomLeftTitleLabel.textColor = UIColorHex(ffcocb);
    _bottomLeftTitleLabel.font = [UIFont systemFontOfSize:kBtnTitleLabelFontSize];
    _bottomLeftTitleLabel.top = kBtnSubViewsPadding + 5;
    _bottomLeftTitleLabel.left = kBtnSubViewsPadding;
    
    _bottomRightTitleLabel = [UILabel new];
    _bottomRightTitleLabel.size = CGSizeMake(kBtnLabelWidth, kBtnLabelHeight);
    _bottomRightTitleLabel.userInteractionEnabled = NO;
    _bottomRightTitleLabel.textColor = UIColorHex(66f9cf);
    _bottomRightTitleLabel.font = [UIFont systemFontOfSize:kBtnTitleLabelFontSize];
    _bottomRightTitleLabel.top = kBtnSubViewsPadding + 5;
    _bottomRightTitleLabel.left = kBtnSubViewsPadding;
    
    [_topLeftBtn addSubview:_topLeftTitleLabel];
    [_topRightBtn addSubview:_topRightTitleLabel];
    [_bottomLeftBtn addSubview:_bottomLeftTitleLabel];
    [_bottomRightBtn addSubview:_bottomRightTitleLabel];
    
    _topLeftDescLabel = [UILabel new];
    _topLeftDescLabel.size = CGSizeMake(kBtnLabelWidth, kBtnLabelHeight - 5);
    _topLeftDescLabel.userInteractionEnabled = NO;
    _topLeftDescLabel.textColor = kBtnDescLabelTextColor;
    _topLeftDescLabel.font = [UIFont systemFontOfSize:kBtnDescLabelFontSize];
    _topLeftDescLabel.top = _topLeftTitleLabel.bottom + 5;
    _topLeftDescLabel.left = _topLeftTitleLabel.left;
    
    _topRightDescLabel = [UILabel new];
    _topRightDescLabel.size = CGSizeMake(kBtnLabelWidth, kBtnLabelHeight - 5);
    _topRightDescLabel.userInteractionEnabled = NO;
    _topRightDescLabel.textColor = kBtnDescLabelTextColor;
    _topRightDescLabel.font = [UIFont systemFontOfSize:kBtnDescLabelFontSize];
    _topRightDescLabel.top = _topRightTitleLabel.bottom + 5;
    _topRightDescLabel.left = _topRightTitleLabel.left;
    
    _bottomLeftDescLabel = [UILabel new];
    _bottomLeftDescLabel.size = CGSizeMake(kBtnLabelWidth, kBtnLabelHeight - 5);
    _bottomLeftDescLabel.userInteractionEnabled = NO;
    _bottomLeftDescLabel.textColor = kBtnDescLabelTextColor;
    _bottomLeftDescLabel.font = [UIFont systemFontOfSize:kBtnDescLabelFontSize];
    _bottomLeftDescLabel.top = _bottomLeftTitleLabel.bottom + 5;
    _bottomLeftDescLabel.left = _bottomLeftTitleLabel.left;
    
    _bottomRightDescLabel = [UILabel new];
    _bottomRightDescLabel.size = CGSizeMake(kBtnLabelWidth, kBtnLabelHeight - 5);
    _bottomRightDescLabel.userInteractionEnabled = NO;
    _bottomRightDescLabel.textColor = kBtnDescLabelTextColor;
    _bottomRightDescLabel.font = [UIFont systemFontOfSize:kBtnDescLabelFontSize];
    _bottomRightDescLabel.top = _bottomRightTitleLabel.bottom + 5;
    _bottomRightDescLabel.left = _bottomRightTitleLabel.left;
    
    [_topLeftBtn addSubview:_topLeftDescLabel];
    [_topRightBtn addSubview:_topRightDescLabel];
    [_bottomLeftBtn addSubview:_bottomLeftDescLabel];
    [_bottomRightBtn addSubview:_bottomRightDescLabel];
    
    [self addSubview:_topLeftBtn];
    [self addSubview:_topRightBtn];
    [self addSubview:_bottomLeftBtn];
    [self addSubview:_bottomRightBtn];
    [self.layer addSublayer:_topLine];
    [self.layer addSublayer:_horizontalLine];
    [self.layer addSublayer:_verticalLine];
    [self.layer addSublayer:_bottomLine];
    
    [_topLeftBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        // 向上传递
        NSLog(@"_topLeftBtn");
    }];
    
    [_topRightBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        NSLog(@"_topRightBtn");
    }];
    
    [_bottomLeftBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        NSLog(@"_bottomLeftBtn");
    }];
    
    [_bottomRightBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        NSLog(@"_bottomRightBtn");
    }];
}

@end

