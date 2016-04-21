//
//  NormalCategoryView.h
//  Yep
//
//  Created by cash on 16/4/21.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NormalCategoryView : UIView

@property (nonatomic, strong) UIButton    *leftBtn;
@property (nonatomic, strong) UIButton    *middleBtn;
@property (nonatomic, strong) UIButton    *rightBtn;

@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UIImageView *middleImageView;
@property (nonatomic, strong) UIImageView *rightImageView;

@property (nonatomic, strong) UILabel     *leftTitleLabel;
@property (nonatomic, strong) UILabel     *middleTitleLabel;
@property (nonatomic, strong) UILabel     *rightTitleLabel;

@property (nonatomic, strong) UILabel     *leftDescLabel;
@property (nonatomic, strong) UILabel     *middleDescLabel;
@property (nonatomic, strong) UILabel     *rightDescLabel;

@end
