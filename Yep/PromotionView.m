//
//  PromotionView.m
//  Yep
//
//  Created by cash on 16/4/19.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import "PromotionView.h"
#import "YYKit.h"
#import "YepMacro.h"

#define kYPTopMargin     15
#define kViewHeight      68
#define kYPCellPadding   15
#define kImageViewSize   kViewHeight - kYPTopMargin * 2

#define kPriceLabelTintColor       UIColorHex(fd8224)
#define kCountDownLabelTextColor   UIColorHex(b4b4b4)

@interface PromotionView ()

@property (nonatomic, strong) CALayer *topLine;
@property (nonatomic, strong) CALayer *bottomLine;

@end

@implementation PromotionView

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
    
    _promotionImageView = [UIImageView new];
    _promotionImageView.size = CGSizeMake(kImageViewSize, kImageViewSize);
    _promotionImageView.backgroundColor = [UIColor purpleColor];
    _promotionImageView.top = kYPTopMargin;
    _promotionImageView.left = kYPCellPadding;
    
    _titleLabel = [UILabel new];
    _titleLabel.size = CGSizeMake(100, 20);
    _titleLabel.font = [UIFont systemFontOfSize:15];
    _titleLabel.top = _promotionImageView.top;
    _titleLabel.left = _promotionImageView.right + kYPCellPadding;
    
    _priceLabel = [UILabel new];
    _priceLabel.size = CGSizeMake(100, 20);
    _priceLabel.font = [UIFont systemFontOfSize:14];
    _priceLabel.textColor = [UIColor orangeColor];
    _priceLabel.left = _titleLabel.right;
    _priceLabel.bottom = _titleLabel.bottom;
    
    _countDownLabel = [UILabel new];
    _countDownLabel.size = CGSizeMake(200, 20);
    _countDownLabel.font = [UIFont systemFontOfSize:12];
    _countDownLabel.textColor = kCountDownLabelTextColor;
    _countDownLabel.left = _titleLabel.left;
    _countDownLabel.bottom = self.height - 10;
    
    _bottomLine = [CALayer layer];
    _bottomLine.size = CGSizeMake(kScreenWidth, CGFloatFromPixel(1));
    _bottomLine.bottom = self.height;
    _bottomLine.backgroundColor = kYPLineColor;
    
    [self addSubview:_promotionImageView];
    [self addSubview:_titleLabel];
    [self addSubview:_priceLabel];
    [self addSubview:_countDownLabel];
    [self.layer addSublayer:_topLine];
    [self.layer addSublayer:_bottomLine];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.backgroundColor = kYPBtnHighlightColor;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.backgroundColor = [UIColor whiteColor];
    // 向上传递
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.backgroundColor = [UIColor whiteColor];
}

@end






