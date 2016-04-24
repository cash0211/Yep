//
//  CategoryView.m
//  Yep
//
//  Created by cash on 16/4/21.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import "CategoryView.h"
#import "YYKit.h"
#import "YepMacro.h"
#import "YPHelper.h"

#define kViewHeight                   105
#define kCategoryItemWidth            CGFloatPixelRound(kScreenWidth / 3)
#define kCategoryItemHeight           ((kViewHeight) / 2)

#define kCategoryItemSubViewsSize     16
#define kBtnLabelWidth                40
#define kBtnLabelHeight               16

@interface CategoryView ()

@property (nonatomic, strong) CALayer *topLine;
@property (nonatomic, strong) CALayer *bottomLine;
@property (nonatomic, strong) CALayer *verticalLine1;
@property (nonatomic, strong) CALayer *verticalLine2;
@property (nonatomic, strong) CALayer *horizontalLine;

@end

@implementation CategoryView

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
    _verticalLine1.size = CGSizeMake(CGFloatFromPixel(1), kViewHeight);
    _verticalLine1.left = kCategoryItemWidth;
    _verticalLine1.backgroundColor = kYPLineColor;
    
    _verticalLine2 = [CALayer layer];
    _verticalLine2.size = CGSizeMake(CGFloatFromPixel(1), kViewHeight);
    _verticalLine2.left = kCategoryItemWidth * 2;
    _verticalLine2.backgroundColor = kYPLineColor;
    
    _horizontalLine = [CALayer layer];
    _horizontalLine.size = CGSizeMake(kScreenWidth, CGFloatFromPixel(1));
    _horizontalLine.top = kCategoryItemHeight;
    _horizontalLine.backgroundColor = kYPLineColor;
    
    _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _leftBtn.exclusiveTouch = YES;
    _leftBtn.size = CGSizeMake(kCategoryItemWidth, kCategoryItemHeight);
    [_leftBtn setBackgroundImage:[UIImage imageWithColor:kYPBtnHighlightColor] forState:UIControlStateHighlighted];
    
    _middleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _middleBtn.exclusiveTouch = YES;
    _middleBtn.size = CGSizeMake(kCategoryItemWidth - 0.5, kCategoryItemHeight);
    _middleBtn.left = _leftBtn.right + 0.5;
    [_middleBtn setBackgroundImage:[UIImage imageWithColor:kYPBtnHighlightColor] forState:UIControlStateHighlighted];
    
    _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightBtn.exclusiveTouch = YES;
    _rightBtn.size = CGSizeMake(kCategoryItemWidth, kCategoryItemHeight);
    _rightBtn.left = _middleBtn.right + 0.5;
    [_rightBtn setBackgroundImage:[UIImage imageWithColor:kYPBtnHighlightColor] forState:UIControlStateHighlighted];
    
    _leftBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    _leftBtn2.exclusiveTouch = YES;
    _leftBtn2.size = CGSizeMake(kCategoryItemWidth, kCategoryItemHeight);
    _leftBtn2.top = _leftBtn.bottom + 0.5;
    [_leftBtn2 setBackgroundImage:[UIImage imageWithColor:kYPBtnHighlightColor] forState:UIControlStateHighlighted];
    
    _middleBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    _middleBtn2.exclusiveTouch = YES;
    _middleBtn2.size = CGSizeMake(_middleBtn.width, kCategoryItemHeight);
    _middleBtn2.top = _leftBtn2.top;
    _middleBtn2.left = _middleBtn.left;
    [_middleBtn2 setBackgroundImage:[UIImage imageWithColor:kYPBtnHighlightColor] forState:UIControlStateHighlighted];
    
    _rightBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightBtn2.exclusiveTouch = YES;
    _rightBtn2.size = CGSizeMake(kCategoryItemWidth, kCategoryItemHeight);
    _rightBtn2.top = _leftBtn2.top;
    _rightBtn2.left = _rightBtn.left;
    [_rightBtn2 setBackgroundImage:[UIImage imageWithColor:kYPBtnHighlightColor] forState:UIControlStateHighlighted];
    
    CGPoint imageViewCenter = [self convertPoint:_leftBtn.center toView:_leftBtn];
    imageViewCenter.x -= 18;
    _leftImageView = [UIImageView new];
    _leftImageView.size = CGSizeMake(kCategoryItemSubViewsSize, kCategoryItemSubViewsSize);
    _leftImageView.center = imageViewCenter;
    
    _middleImageView = [UIImageView new];
    _middleImageView.size = CGSizeMake(kCategoryItemSubViewsSize, kCategoryItemSubViewsSize);
    _middleImageView.center = imageViewCenter;
    
    _rightImageView = [UIImageView new];
    _rightImageView.size = CGSizeMake(kCategoryItemSubViewsSize, kCategoryItemSubViewsSize);
    _rightImageView.center = imageViewCenter;
    
    _leftImageView2 = [UIImageView new];
    _leftImageView2.size = CGSizeMake(kCategoryItemSubViewsSize, kCategoryItemSubViewsSize);
    _leftImageView2.center = imageViewCenter;
    
    _middleImageView2 = [UIImageView new];
    _middleImageView2.size = CGSizeMake(kCategoryItemSubViewsSize, kCategoryItemSubViewsSize);
    _middleImageView2.center = imageViewCenter;
    
    [_leftBtn addSubview:_leftImageView];
    [_middleBtn addSubview:_middleImageView];
    [_rightBtn addSubview:_rightImageView];
    [_leftBtn2 addSubview:_leftImageView2];
    [_middleBtn2 addSubview:_middleImageView2];
    
    _leftLabel = [UILabel new];
    _leftLabel.size = CGSizeMake(kBtnLabelWidth, kBtnLabelHeight);
    _leftLabel.userInteractionEnabled = NO;
    _leftLabel.font = [UIFont systemFontOfSize:16];
    _leftLabel.left = _leftImageView.right + 6;
    _leftLabel.bottom = _leftImageView.bottom;
    
    _middleLabel = [UILabel new];
    _middleLabel.size = CGSizeMake(kBtnLabelWidth, kBtnLabelHeight);
    _middleLabel.userInteractionEnabled = NO;
    _middleLabel.left = _middleImageView.right + 6;
    _middleLabel.bottom = _middleImageView.bottom;

    _rightLabel = [UILabel new];
    _rightLabel.size = CGSizeMake(kBtnLabelWidth, kBtnLabelHeight);
    _rightLabel.userInteractionEnabled = NO;
    _rightLabel.font = [UIFont systemFontOfSize:16];
    _rightLabel.left = _middleImageView.right + 6;
    _rightLabel.bottom = _middleImageView.bottom;

    _leftLabel2 = [UILabel new];
    _leftLabel2.size = CGSizeMake(kBtnLabelWidth, kBtnLabelHeight);
    _leftLabel2.userInteractionEnabled = NO;
    _leftLabel2.font = [UIFont systemFontOfSize:16];
    _leftLabel2.left = _leftImageView2.right + 6;
    _leftLabel2.bottom = _leftImageView2.bottom;
    
    _middleLabel2 = [UILabel new];
    _middleLabel2.size = CGSizeMake(kBtnLabelWidth, kBtnLabelHeight);
    _middleLabel2.userInteractionEnabled = NO;
    _middleLabel2.font = [UIFont systemFontOfSize:16];
    _middleLabel2.left = _middleImageView2.right + 6;
    _middleLabel2.bottom = _middleImageView2.bottom;

    [_leftBtn addSubview:_leftLabel];
    [_middleBtn addSubview:_middleLabel];
    [_rightBtn addSubview:_rightLabel];
    [_leftBtn2 addSubview:_leftLabel2];
    [_middleBtn2 addSubview:_middleLabel2];
    
    [self.layer addSublayer:_topLine];
    [self.layer addSublayer:_bottomLine];
    [self.layer addSublayer:_verticalLine1];
    [self.layer addSublayer:_verticalLine2];
    [self.layer addSublayer:_horizontalLine];
    [self addSubview:_leftBtn];
    [self addSubview:_middleBtn];
    [self addSubview:_rightBtn];
    [self addSubview:_leftBtn2];
    [self addSubview:_middleBtn2];
    [self addSubview:_rightBtn2];
    
    [_leftBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        NSLog(@"_yummyFoodBtn");
    }];
    
    [_middleBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        NSLog(@"_footMaSaJiBtn");
    }];
    
    [_rightBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        NSLog(@"_hotelBtn");
    }];
    
    [_leftBtn2 addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        NSLog(@"_hotGirlBtn");
    }];
    
    [_middleBtn2 addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        NSLog(@"_allCategoryBtn");
    }];
}

@end






