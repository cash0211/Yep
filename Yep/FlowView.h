//
//  FlowView.h
//  Yep
//
//  Created by cash on 16/4/19.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BlendedView;

@interface FlowView : UIView

@property (nonatomic, strong) UIButton    *leftBtn;
@property (nonatomic, strong) UIButton    *middleBtn;
@property (nonatomic, strong) UIButton    *topRightBtn;
@property (nonatomic, strong) UIButton    *bottomRightBtn;

@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UIImageView *middleImageView;
@property (nonatomic, strong) UIImageView *topRightImageView;
@property (nonatomic, strong) UIImageView *bottomRightImageView;

@property (nonatomic, strong) UILabel     *leftTitleLabel;
@property (nonatomic, strong) UILabel     *middleTitleLabel;
@property (nonatomic, strong) UILabel     *topRightTitleLabel;
@property (nonatomic, strong) UILabel     *bottomRightTitleLabel;

@property (nonatomic, strong) UILabel     *leftDescLabel;
@property (nonatomic, strong) UILabel     *middleDescLabel;
@property (nonatomic, strong) UILabel     *topRightDescLabel;
@property (nonatomic, strong) UILabel     *bottomRightDescLabel;

@property (nonatomic, weak) BlendedView   *blendedView;

@end
