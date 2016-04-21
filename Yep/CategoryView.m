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
    
    _yummyFoodBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _yummyFoodBtn.exclusiveTouch = YES;
    _yummyFoodBtn.size = CGSizeMake(kCategoryItemWidth, kCategoryItemHeight);
    [_yummyFoodBtn setBackgroundImage:[UIImage imageWithColor:kYPBtnHighlightColor] forState:UIControlStateHighlighted];
    
    _footMaSaJiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _footMaSaJiBtn.exclusiveTouch = YES;
    _footMaSaJiBtn.size = CGSizeMake(kCategoryItemWidth - 0.5, kCategoryItemHeight);
    _footMaSaJiBtn.left = _yummyFoodBtn.right + 0.5;
    [_footMaSaJiBtn setBackgroundImage:[UIImage imageWithColor:kYPBtnHighlightColor] forState:UIControlStateHighlighted];
    
    _hotelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _hotelBtn.exclusiveTouch = YES;
    _hotelBtn.size = CGSizeMake(kCategoryItemWidth, kCategoryItemHeight);
    _hotelBtn.left = _footMaSaJiBtn.right + 0.5;
    [_hotelBtn setBackgroundImage:[UIImage imageWithColor:kYPBtnHighlightColor] forState:UIControlStateHighlighted];
    
    _hotGirlBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _hotGirlBtn.exclusiveTouch = YES;
    _hotGirlBtn.size = CGSizeMake(kCategoryItemWidth, kCategoryItemHeight);
    _hotGirlBtn.top = _yummyFoodBtn.bottom + 0.5;
    [_hotGirlBtn setBackgroundImage:[UIImage imageWithColor:kYPBtnHighlightColor] forState:UIControlStateHighlighted];
    
    _allCategoryBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _allCategoryBtn.exclusiveTouch = YES;
    _allCategoryBtn.size = CGSizeMake(_footMaSaJiBtn.width, kCategoryItemHeight);
    _allCategoryBtn.top = _hotGirlBtn.top;
    _allCategoryBtn.left = _footMaSaJiBtn.left;
    [_allCategoryBtn setBackgroundImage:[UIImage imageWithColor:kYPBtnHighlightColor] forState:UIControlStateHighlighted];
    
    _placeHolderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _placeHolderBtn.exclusiveTouch = YES;
    _placeHolderBtn.size = CGSizeMake(kCategoryItemWidth, kCategoryItemHeight);
    _placeHolderBtn.top = _hotGirlBtn.top;
    _placeHolderBtn.left = _hotelBtn.left;
    [_placeHolderBtn setBackgroundImage:[UIImage imageWithColor:kYPBtnHighlightColor] forState:UIControlStateHighlighted];
    
    CGPoint imageViewCenter = [self convertPoint:_yummyFoodBtn.center toView:_yummyFoodBtn];
    imageViewCenter.x -= 18;
    _yummyFoodImageView = [UIImageView new];
    _yummyFoodImageView.size = CGSizeMake(kCategoryItemSubViewsSize, kCategoryItemSubViewsSize);
    _yummyFoodImageView.center = imageViewCenter;
    _yummyFoodImageView.backgroundColor = [UIColor purpleColor];
    
    _footMaSaJiImageView = [UIImageView new];
    _footMaSaJiImageView.size = CGSizeMake(kCategoryItemSubViewsSize, kCategoryItemSubViewsSize);
    _footMaSaJiImageView.center = imageViewCenter;
    _footMaSaJiImageView.backgroundColor = [UIColor purpleColor];
    
    _hotelImageView = [UIImageView new];
    _hotelImageView.size = CGSizeMake(kCategoryItemSubViewsSize, kCategoryItemSubViewsSize);
    _hotelImageView.center = imageViewCenter;
    _hotelImageView.backgroundColor = [UIColor purpleColor];
    
    _hotGirlImageView = [UIImageView new];
    _hotGirlImageView.size = CGSizeMake(kCategoryItemSubViewsSize, kCategoryItemSubViewsSize);
    _hotGirlImageView.center = imageViewCenter;
    _hotGirlImageView.backgroundColor = [UIColor purpleColor];

    _allCategoryImageView = [UIImageView new];
    _allCategoryImageView.size = CGSizeMake(kCategoryItemSubViewsSize, kCategoryItemSubViewsSize);
    _allCategoryImageView.center = imageViewCenter;
    _allCategoryImageView.backgroundColor = [UIColor purpleColor];
    
    [_yummyFoodBtn addSubview:_yummyFoodImageView];
    [_footMaSaJiBtn addSubview:_footMaSaJiImageView];
    [_hotelBtn addSubview:_hotelImageView];
    [_hotGirlBtn addSubview:_hotGirlImageView];
    [_allCategoryBtn addSubview:_allCategoryImageView];
    
    _yummyFoodLabel = [UILabel new];
    _yummyFoodLabel.size = CGSizeMake(kBtnLabelWidth, kBtnLabelHeight);
    _yummyFoodLabel.userInteractionEnabled = NO;
    _yummyFoodLabel.font = [UIFont systemFontOfSize:16];
    _yummyFoodLabel.left = _yummyFoodImageView.right + 6;
    _yummyFoodLabel.bottom = _yummyFoodImageView.bottom;
    
    _footMaSaJiLabel = [UILabel new];
    _footMaSaJiLabel.size = CGSizeMake(kBtnLabelWidth, kBtnLabelHeight);
    _footMaSaJiLabel.userInteractionEnabled = NO;
    _footMaSaJiLabel.left = _footMaSaJiImageView.right + 6;
    _footMaSaJiLabel.bottom = _footMaSaJiImageView.bottom;

    _hotelLabel = [UILabel new];
    _hotelLabel.size = CGSizeMake(kBtnLabelWidth, kBtnLabelHeight);
    _hotelLabel.userInteractionEnabled = NO;
    _hotelLabel.font = [UIFont systemFontOfSize:16];
    _hotelLabel.left = _hotelImageView.right + 6;
    _hotelLabel.bottom = _hotelImageView.bottom;

    _hotGirlLabel = [UILabel new];
    _hotGirlLabel.size = CGSizeMake(kBtnLabelWidth, kBtnLabelHeight);
    _hotGirlLabel.userInteractionEnabled = NO;
    _hotGirlLabel.font = [UIFont systemFontOfSize:16];
    _hotGirlLabel.left = _hotGirlImageView.right + 6;
    _hotGirlLabel.bottom = _hotGirlImageView.bottom;
    
    _allCategoryLabel = [UILabel new];
    _allCategoryLabel.size = CGSizeMake(kBtnLabelWidth, kBtnLabelHeight);
    _allCategoryLabel.userInteractionEnabled = NO;
    _allCategoryLabel.font = [UIFont systemFontOfSize:16];
    _allCategoryLabel.left = _allCategoryImageView.right + 6;
    _allCategoryLabel.bottom = _allCategoryImageView.bottom;

    [_yummyFoodBtn addSubview:_yummyFoodLabel];
    [_footMaSaJiBtn addSubview:_footMaSaJiLabel];
    [_hotelBtn addSubview:_hotelLabel];
    [_hotGirlBtn addSubview:_hotGirlLabel];
    [_allCategoryBtn addSubview:_allCategoryLabel];
    
    [self.layer addSublayer:_topLine];
    [self.layer addSublayer:_bottomLine];
    [self.layer addSublayer:_verticalLine1];
    [self.layer addSublayer:_verticalLine2];
    [self.layer addSublayer:_horizontalLine];
    [self addSubview:_yummyFoodBtn];
    [self addSubview:_footMaSaJiBtn];
    [self addSubview:_hotelBtn];
    [self addSubview:_hotGirlBtn];
    [self addSubview:_allCategoryBtn];
    [self addSubview:_placeHolderBtn];
    
    [_yummyFoodBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        NSLog(@"_yummyFoodBtn");
    }];
    
    [_footMaSaJiBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        NSLog(@"_footMaSaJiBtn");
    }];
    
    [_hotelBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        NSLog(@"_hotelBtn");
    }];
    
    [_hotGirlBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        NSLog(@"_hotGirlBtn");
    }];
    
    [_allCategoryBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        NSLog(@"_allCategoryBtn");
    }];
}

@end






