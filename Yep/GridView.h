//
//  GridView.h
//  Yep
//
//  Created by cash on 16/4/19.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GridView : UIView

@property (nonatomic, strong) CALayer *topLine;
@property (nonatomic, strong) CALayer *horizontalLine;
@property (nonatomic, strong) CALayer *verticalLine;
@property (nonatomic, strong) CALayer *bottomLine;

@property (nonatomic, strong) UIButton  *topLeftBtn;
@property (nonatomic, strong) UIButton  *topRightBtn;
@property (nonatomic, strong) UIButton  *bottomLeftBtn;
@property (nonatomic, strong) UIButton  *bottomRightBtn;

@property (nonatomic, strong) UIImageView *topLeftImageView;
@property (nonatomic, strong) UIImageView *topRightImageView;
@property (nonatomic, strong) UIImageView *bottomLeftImageView;
@property (nonatomic, strong) UIImageView *bottomRightImageView;

@property (nonatomic, strong) UILabel *topLeftTitleLabel;
@property (nonatomic, strong) UILabel *topRightTitleLabel;
@property (nonatomic, strong) UILabel *bottomLeftTitleLabel;
@property (nonatomic, strong) UILabel *bottomRightTitleLabel;

@property (nonatomic, strong) UILabel *topLeftDescLabel;
@property (nonatomic, strong) UILabel *topRightDescLabel;
@property (nonatomic, strong) UILabel *bottomLeftDescLabel;
@property (nonatomic, strong) UILabel *bottomRightDescLabel;

@end
