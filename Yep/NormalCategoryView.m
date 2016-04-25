//
//  NormalCategoryView.m
//  Yep
//
//  Created by cash on 16/4/21.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import "NormalCategoryView.h"
#import "YYKit.h"
#import "YepMacro.h"

#define kViewHeight                   105
#define kCategoryItemWidth            CGFloatPixelFloor(kScreenWidth / 3)
#define kLineMargin                   20

#define kBtnLabelWidth                (kCategoryItemWidth - kYPMargin * 2)
#define kBtnLabelHeight               16
#define kBtnImgWidth                  (kCategoryItemWidth / 2 + 10)
#define kBtnImgHeight                 (kViewHeight / 2 - 2)

#define kBtnDescLabelTextColor         UIColorHex(b4b4b4)

@interface NormalCategoryView ()

@property (nonatomic, strong) CALayer *topLine;
@property (nonatomic, strong) CALayer *bottomLine;
@property (nonatomic, strong) CALayer *verticalLine1;
@property (nonatomic, strong) CALayer *verticalLine2;

@end

@implementation NormalCategoryView

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
    
    _bottomLine = [CALayer layer];
    _bottomLine.size = CGSizeMake(kScreenWidth, CGFloatFromPixel(1));
    _bottomLine.bottom = self.height;
    _bottomLine.backgroundColor = kYPLineColor;
    
    _verticalLine1 = [CALayer layer];
    _verticalLine1.size = CGSizeMake(CGFloatFromPixel(1), kViewHeight - kLineMargin * 2);
    _verticalLine1.left = kCategoryItemWidth;
    _verticalLine1.top = kLineMargin;
    _verticalLine1.backgroundColor = kYPLineColor;
    
    _verticalLine2 = [CALayer layer];
    _verticalLine2.size = CGSizeMake(CGFloatFromPixel(1), kViewHeight - kLineMargin * 2);
    _verticalLine2.left = kCategoryItemWidth * 2;
    _verticalLine2.top = kLineMargin;
    _verticalLine2.backgroundColor = kYPLineColor;
    
    [self.layer addSublayer:_topLine];
    [self.layer addSublayer:_bottomLine];
    [self.layer addSublayer:_verticalLine1];
    [self.layer addSublayer:_verticalLine2];
    
    _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _leftBtn.exclusiveTouch = YES;
    _leftBtn.size = CGSizeMake(kCategoryItemWidth, kViewHeight - 1);
    _leftBtn.top = 0.5;
    [_leftBtn setBackgroundImage:[UIImage imageWithColor:kYPBtnHighlightColor] forState:UIControlStateHighlighted];
    
    _middleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _middleBtn.exclusiveTouch = YES;
    _middleBtn.size = CGSizeMake(kCategoryItemWidth - 0.5, kViewHeight - 1);
    _middleBtn.top = _leftBtn.top;
    _middleBtn.left = _leftBtn.right + 0.5;
    [_middleBtn setBackgroundImage:[UIImage imageWithColor:kYPBtnHighlightColor] forState:UIControlStateHighlighted];
    
    _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightBtn.exclusiveTouch = YES;
    _rightBtn.size = CGSizeMake(kCategoryItemWidth, kViewHeight - 1);
    _rightBtn.top = _middleBtn.top;
    _rightBtn.left = _middleBtn.right + 0.5;
    [_rightBtn setBackgroundImage:[UIImage imageWithColor:kYPBtnHighlightColor] forState:UIControlStateHighlighted];

    [self addSubview:_leftBtn];
    [self addSubview:_middleBtn];
    [self addSubview:_rightBtn];

    CGPoint imageViewCenter = [self convertPoint:_leftBtn.center toView:_leftBtn];
    _leftImageView = [UIImageView new];
    _leftImageView.size = CGSizeMake(kBtnImgWidth, kBtnImgHeight);
    _leftImageView.centerX = imageViewCenter.x;
    _leftImageView.bottom = kViewHeight - 5;
    _leftImageView.backgroundColor = [UIColor purpleColor];

    _middleImageView = [UIImageView new];
    _middleImageView.size = CGSizeMake(_leftImageView.width, _leftImageView.height);
    _middleImageView.centerX = _leftImageView.centerX;
    _middleImageView.bottom = _leftImageView.bottom;
    _middleImageView.backgroundColor = [UIColor purpleColor];
    
    _rightImageView = [UIImageView new];
    _rightImageView.size = CGSizeMake(_leftImageView.width,  _leftImageView.height);
    _rightImageView.centerX = _leftImageView.centerX;
    _rightImageView.bottom = _leftImageView.bottom;
    _rightImageView.backgroundColor = [UIColor purpleColor];
    
    [_leftBtn addSubview:_leftImageView];
    [_middleBtn addSubview:_middleImageView];
    [_rightBtn addSubview:_rightImageView];
    
    _leftTitleLabel = [UILabel new];
    _leftTitleLabel.size = CGSizeMake(kBtnLabelWidth, kBtnLabelHeight);
    _leftTitleLabel.userInteractionEnabled = NO;
    _leftTitleLabel.font = [UIFont systemFontOfSize:16];
    _leftTitleLabel.textColor = [UIColor orangeColor];
    _leftTitleLabel.top  = kYPMargin + 5;
    _leftTitleLabel.left = kYPMargin + 5;

    _middleTitleLabel = [UILabel new];
    _middleTitleLabel.size = CGSizeMake(_leftTitleLabel.width, _leftTitleLabel.height);
    _middleTitleLabel.userInteractionEnabled = NO;
    _middleTitleLabel.font = [UIFont systemFontOfSize:16];
    _middleTitleLabel.textColor = [UIColor greenColor];
    _middleTitleLabel.top = _leftTitleLabel.top;
    _middleTitleLabel.left = _leftTitleLabel.left;
    
    _rightTitleLabel = [UILabel new];
    _rightTitleLabel.size = CGSizeMake(_leftTitleLabel.width, _leftTitleLabel.height);
    _rightTitleLabel.userInteractionEnabled = NO;
    _rightTitleLabel.font = [UIFont systemFontOfSize:16];
    _rightTitleLabel.textColor = [UIColor blueColor];
    _rightTitleLabel.top = _leftTitleLabel.top;
    _rightTitleLabel.left = _leftTitleLabel.left;
    
    [_leftBtn addSubview:_leftTitleLabel];
    [_middleBtn addSubview:_middleTitleLabel];
    [_rightBtn addSubview:_rightTitleLabel];
    
    _leftDescLabel = [UILabel new];
    _leftDescLabel.size = CGSizeMake(_leftTitleLabel.width, 11);
    _leftDescLabel.userInteractionEnabled = NO;
    _leftDescLabel.textColor = kBtnDescLabelTextColor;
    _leftDescLabel.font = [UIFont systemFontOfSize:12];
    _leftDescLabel.top = _leftTitleLabel.bottom + 2;
    _leftDescLabel.left = _leftTitleLabel.left;

    _middleDescLabel = [UILabel new];
    _middleDescLabel.size = CGSizeMake(_leftDescLabel.width, _leftDescLabel.height);
    _middleDescLabel.userInteractionEnabled = NO;
    _middleDescLabel.textColor = kBtnDescLabelTextColor;
    _middleDescLabel.font = [UIFont systemFontOfSize:12];
    _middleDescLabel.top = _leftDescLabel.top;
    _middleDescLabel.left = _leftDescLabel.left;
    
    _rightDescLabel = [UILabel new];
    _rightDescLabel.size = CGSizeMake(_leftDescLabel.width, _leftDescLabel.height);
    _rightDescLabel.userInteractionEnabled = NO;
    _rightDescLabel.textColor = kBtnDescLabelTextColor;
    _rightDescLabel.font = [UIFont systemFontOfSize:12];
    _rightDescLabel.top = _leftDescLabel.top;
    _rightDescLabel.left = _leftDescLabel.left;
    
    [_leftBtn addSubview:_leftDescLabel];
    [_middleBtn addSubview:_middleDescLabel];
    [_rightBtn addSubview:_rightDescLabel];

    [_leftBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        NSLog(@"_leftBtn");
    }];
    
    [_middleBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        NSLog(@"_middleBtn");
    }];
    
    [_rightBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        NSLog(@"_rightBtn");
    }];
    
}

@end
