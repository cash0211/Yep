//
//  FlowView.m
//  Yep
//
//  Created by cash on 16/4/19.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import "FlowView.h"
#import "BlendedView.h"
#import "YYKit.h"
#import "YepMacro.h"

#define kViewHeight          282

#define kseparatorLineWH     2
#define kInnerViewWidth      (self.width - kYPMargin * 2)
#define kInnerViewHeight     (kViewHeight - kYPMargin * 2)
#define kFlowItemWidth       CGFloatPixelRound((kInnerViewWidth - kseparatorLineWH * 2) / 3)
#define kFlowItemHeight      ((kInnerViewHeight - kseparatorLineWH) / 2)

#define kBtnImgViewSize      ((kFlowItemWidth) - kYPMargin * 4)
#define kBtnImgViewSize2     ((kFlowItemWidth) - kYPMargin * 6)
#define kBtnLabelHeight      20

#define kBtnNormalColor           UIColorHex(f7f7f7)
#define kBtnDescLabelTextColor    [UIColor darkGrayColor]

@interface FlowView ()

@property (nonatomic, strong) UIView      *innerView;
@property (nonatomic, strong) CALayer     *topLine;
@property (nonatomic, strong) CALayer     *bottomLine;

@end

@implementation FlowView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    self.size = CGSizeMake(kScreenWidth, kViewHeight);
    self.backgroundColor = [UIColor whiteColor];
    [self _initSubViews];
    return self;
}

- (void)_initSubViews {
    
    _topLine = [CALayer layer];
    _topLine.size = CGSizeMake(kScreenWidth, CGFloatFromPixel(1));
    _topLine.backgroundColor = kYPLineColor;
    
    _bottomLine = [CALayer layer];
    _bottomLine.size = _topLine.size;
    _bottomLine.bottom = self.height;
    _bottomLine.backgroundColor = kYPLineColor;
    
    _innerView = [UIView new];
    _innerView.size = CGSizeMake(kInnerViewWidth, kInnerViewHeight);
    _innerView.left = kYPMargin;
    _innerView.top = kYPMargin;
    _innerView.backgroundColor = [UIColor clearColor];
    
    [self.layer addSublayer:_topLine];
    [self.layer addSublayer:_bottomLine];
    [self addSubview:_innerView];
    
    _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _leftBtn.exclusiveTouch = YES;
    _leftBtn.size = CGSizeMake(kFlowItemWidth, kInnerViewHeight);
    [_leftBtn setBackgroundImage:[UIImage imageWithColor:kBtnNormalColor] forState:UIControlStateNormal];
    [_leftBtn setBackgroundImage:[UIImage imageWithColor:kYPBtnHighlightColor] forState:UIControlStateHighlighted];
    
    _middleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _middleBtn.exclusiveTouch = YES;
    _middleBtn.size = CGSizeMake(kFlowItemWidth, kInnerViewHeight);
    _middleBtn.left = _leftBtn.right + kseparatorLineWH;
    [_middleBtn setBackgroundImage:[UIImage imageWithColor:kBtnNormalColor] forState:UIControlStateNormal];
    [_middleBtn setBackgroundImage:[UIImage imageWithColor:kYPBtnHighlightColor] forState:UIControlStateHighlighted];
    
    _topRightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _topRightBtn.exclusiveTouch = YES;
    _topRightBtn.size = CGSizeMake(kFlowItemWidth, kFlowItemHeight);
    _topRightBtn.left = _middleBtn.right + kseparatorLineWH;
    [_topRightBtn setBackgroundImage:[UIImage imageWithColor:kBtnNormalColor] forState:UIControlStateNormal];
    [_topRightBtn setBackgroundImage:[UIImage imageWithColor:kYPBtnHighlightColor] forState:UIControlStateHighlighted];
    
    _bottomRightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _bottomRightBtn.exclusiveTouch = YES;
    _bottomRightBtn.size = CGSizeMake(kFlowItemWidth, kFlowItemHeight);
    _bottomRightBtn.top = _topRightBtn.bottom + kseparatorLineWH;
    _bottomRightBtn.left = _topRightBtn.left;
    [_bottomRightBtn setBackgroundImage:[UIImage imageWithColor:kBtnNormalColor] forState:UIControlStateNormal];
    [_bottomRightBtn setBackgroundImage:[UIImage imageWithColor:kYPBtnHighlightColor] forState:UIControlStateHighlighted];
    
    [_innerView addSubview:_leftBtn];
    [_innerView addSubview:_middleBtn];
    [_innerView addSubview:_topRightBtn];
    [_innerView addSubview:_bottomRightBtn];
    
    _leftImageView = [UIImageView new];
    _leftImageView.size = CGSizeMake(kBtnImgViewSize, kBtnImgViewSize * 2 - 12);
    _leftImageView.left = kYPMargin * 2;
    _leftImageView.bottom = _leftBtn.height - 42;
    _leftImageView.backgroundColor = [UIColor purpleColor];
    
    _middleImageView = [UIImageView new];
    _middleImageView.size = CGSizeMake(_leftImageView.width, _leftImageView.height);
    _middleImageView.left = _leftImageView.left;
    _middleImageView.bottom = _leftImageView.bottom;
    _middleImageView.backgroundColor = [UIColor purpleColor];
    
    _topRightImageView = [UIImageView new];
    _topRightImageView.size = CGSizeMake(kBtnImgViewSize2, kBtnImgViewSize2);
    _topRightImageView.left = kYPMargin * 3;
    _topRightImageView.bottom = kFlowItemHeight - kYPMargin;
    _topRightImageView.backgroundColor = [UIColor purpleColor];

    _bottomRightImageView = [UIImageView new];
    _bottomRightImageView.size = CGSizeMake(_topRightImageView.width, _topRightImageView.height);
    _bottomRightImageView.left = _topRightImageView.left;
    _bottomRightImageView.bottom = _topRightImageView.bottom;
    _bottomRightImageView.backgroundColor = [UIColor purpleColor];
    
    [_leftBtn addSubview:_leftImageView];
    [_middleBtn addSubview:_middleImageView];
    [_topRightBtn addSubview:_topRightImageView];
    [_bottomRightBtn addSubview:_bottomRightImageView];
    
    _leftTitleLabel = [UILabel new];
    _leftTitleLabel.size = CGSizeMake(kFlowItemWidth, kBtnLabelHeight);
    _leftTitleLabel.userInteractionEnabled = NO;
    _leftTitleLabel.font = [UIFont systemFontOfSize:14];
    _leftTitleLabel.textAlignment = NSTextAlignmentCenter;
    _leftTitleLabel.top = kYPMargin + 2;

    _middleTitleLabel = [UILabel new];
    _middleTitleLabel.size = CGSizeMake(_leftTitleLabel.width, _leftTitleLabel.height);
    _middleTitleLabel.userInteractionEnabled = NO;
    _middleTitleLabel.font = [UIFont systemFontOfSize:14];
    _middleTitleLabel.textAlignment = NSTextAlignmentCenter;
    _middleTitleLabel.top = _leftTitleLabel.top;

    _topRightTitleLabel = [UILabel new];
    _topRightTitleLabel.size = CGSizeMake(_leftTitleLabel.width, _leftTitleLabel.height);
    _topRightTitleLabel.userInteractionEnabled = NO;
    _topRightTitleLabel.font = [UIFont systemFontOfSize:14];
    _topRightTitleLabel.textAlignment = NSTextAlignmentCenter;
    _topRightTitleLabel.top = _leftTitleLabel.top;
    
    _bottomRightTitleLabel = [UILabel new];
    _bottomRightTitleLabel.size = CGSizeMake(_leftTitleLabel.width, _leftTitleLabel.height);
    _bottomRightTitleLabel.userInteractionEnabled = NO;
    _bottomRightTitleLabel.font = [UIFont systemFontOfSize:14];
    _bottomRightTitleLabel.textAlignment = NSTextAlignmentCenter;
    _bottomRightTitleLabel.top = _leftTitleLabel.top;

    [_leftBtn addSubview:_leftTitleLabel];
    [_middleBtn addSubview:_middleTitleLabel];
    [_topRightBtn addSubview:_topRightTitleLabel];
    [_bottomRightBtn addSubview:_bottomRightTitleLabel];
    
    _leftDescLabel = [UILabel new];
    _leftDescLabel.size = CGSizeMake(_leftTitleLabel.width, _leftTitleLabel.height);
    _leftDescLabel.userInteractionEnabled = NO;
    _leftDescLabel.textColor = kBtnDescLabelTextColor;
    _leftDescLabel.font = [UIFont systemFontOfSize:12];
    _leftDescLabel.textAlignment = NSTextAlignmentCenter;
    _leftDescLabel.top = _leftTitleLabel.bottom;

    _middleDescLabel = [UILabel new];
    _middleDescLabel.size = CGSizeMake(_middleTitleLabel.width, _middleTitleLabel.height);
    _middleDescLabel.userInteractionEnabled = NO;
    _middleDescLabel.textColor = kBtnDescLabelTextColor;
    _middleDescLabel.font = [UIFont systemFontOfSize:12];
    _middleDescLabel.textAlignment = NSTextAlignmentCenter;
    _middleDescLabel.top = _middleTitleLabel.bottom;

    _topRightDescLabel = [UILabel new];
    _topRightDescLabel.size = CGSizeMake(_topRightTitleLabel.width, _topRightTitleLabel.height);
    _topRightDescLabel.userInteractionEnabled = NO;
    _topRightDescLabel.textColor = kBtnDescLabelTextColor;
    _topRightDescLabel.font = [UIFont systemFontOfSize:12];
    _topRightDescLabel.textAlignment = NSTextAlignmentCenter;
    _topRightDescLabel.top = _topRightTitleLabel.bottom;

    _bottomRightDescLabel = [UILabel new];
    _bottomRightDescLabel.size = CGSizeMake(_bottomRightTitleLabel.width, _bottomRightTitleLabel.height);
    _bottomRightDescLabel.userInteractionEnabled = NO;
    _bottomRightDescLabel.textColor = kBtnDescLabelTextColor;
    _bottomRightDescLabel.font = [UIFont systemFontOfSize:12];
    _bottomRightDescLabel.textAlignment = NSTextAlignmentCenter;
    _bottomRightDescLabel.top = _bottomRightTitleLabel.bottom;
    
    [_leftBtn addSubview:_leftDescLabel];
    [_middleBtn addSubview:_middleDescLabel];
    [_topRightBtn addSubview:_topRightDescLabel];
    [_bottomRightBtn addSubview:_bottomRightDescLabel];
    
    @weakify(self)
    [_leftBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        BlendedView *blendedView = weak_self.blendedView;
        @strongify(self)
        if ([blendedView.delegate respondsToSelector:@selector(flowViewLeftBtnDidClick:)]) {
            [blendedView.delegate flowViewLeftBtnDidClick:self];
        }
    }];
    
    [_middleBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        BlendedView *blendedView = weak_self.blendedView;
        @strongify(self)
        if ([blendedView.delegate respondsToSelector:@selector(flowViewMiddleBtnDidClick:)]) {
            [blendedView.delegate flowViewMiddleBtnDidClick:self];
        }
    }];
    
    [_topRightBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        BlendedView *blendedView = weak_self.blendedView;
        @strongify(self)
        if ([blendedView.delegate respondsToSelector:@selector(flowViewTopRightBtnDidClick:)]) {
            [blendedView.delegate flowViewTopRightBtnDidClick:self];
        }
    }];
    
    [_bottomRightBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        BlendedView *blendedView = weak_self.blendedView;
        @strongify(self)
        if ([blendedView.delegate respondsToSelector:@selector(flowViewBottomRightBtnDidClick:)]) {
            [blendedView.delegate flowViewBottomRightBtnDidClick:self];
        }
    }];
}

@end

