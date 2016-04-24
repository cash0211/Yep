//
//  PromotionView.h
//  Yep
//
//  Created by cash on 16/4/19.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BlendedView;

@interface PromotionView : UIView

@property (nonatomic, strong) UIImageView *promotionImageView;
@property (nonatomic, strong) UILabel     *titleLabel;
@property (nonatomic, strong) UILabel     *priceLabel;
@property (nonatomic, strong) UILabel     *countDownLabel;
@property (nonatomic, strong) CALayer     *indicatorArrow;
@property (nonatomic, weak)   BlendedView *blendedView;

@end
