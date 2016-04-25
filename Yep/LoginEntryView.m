//
//  LoginEntryView.m
//  Yep
//
//  Created by cash on 16/4/22.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import "LoginEntryView.h"
#import "YYKit.h"
#import "YepMacro.h"
#import "YPHelper.h"

#define kViewHeight             140
#define kLoginBtnHeight         (kViewHeight / 2)

#define kImageViewSize          52
#define kLabelHeight            20
#define kBtnLabelHeight         11
#define kBtnLabelWidth          60
#define kViewItemWidth          CGFloatPixelRound(kScreenWidth / 3)
#define kViewItemHeight         ((kViewHeight) / 2)

#define kBtnDescLabelTextColor  UIColorHex(b4b4b4)

@interface LoginEntryView ()

@property (nonatomic, strong) CALayer *topLine;
@property (nonatomic, strong) CALayer *bottomLine;
@property (nonatomic, strong) CALayer *verticalLine1;
@property (nonatomic, strong) CALayer *verticalLine2;
@property (nonatomic, strong) CALayer *horizontalLine;

@property (nonatomic, strong) UIButton    *loginBtn;
@property (nonatomic, strong) UIButton    *avatarBtn;
@property (nonatomic, strong) UIButton    *dianPinBtn;
@property (nonatomic, strong) UIButton    *collectionBtn;
@property (nonatomic, strong) UIButton    *couponBtn;

@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel     *loginLabel;
@property (nonatomic, strong) UILabel     *loginDescLabel;
@property (nonatomic, strong) UIImageView *arrowImageView;

@property (nonatomic, strong) UIImageView *dianPinImageView;
@property (nonatomic, strong) UIImageView *collectionImageView;
@property (nonatomic, strong) UIImageView *couponImageView;
@property (nonatomic, strong) UILabel     *dianPinLabel;
@property (nonatomic, strong) UILabel     *collectionLabel;
@property (nonatomic, strong) UILabel     *couponLabel;

@end

@implementation LoginEntryView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    self.backgroundColor = [UIColor whiteColor];
    self.size = CGSizeMake(kScreenWidth, kViewHeight);
    [self _initSubViews];
    [self _solidData];
    return self;
}

- (void)_solidData {
    _avatarImageView.image = [YPHelper imageNamed:@"personal_defaulthead"];
    _arrowImageView.image = [YPHelper imageNamed:@"Arrow_Left"];
    
    _dianPinImageView.image = [YPHelper imageNamed:@"personal_icon_dianping"];
    _collectionImageView.image = [YPHelper imageNamed:@"personal_icon_like"];
    _couponImageView.image = [YPHelper imageNamed:@"personal_icon_tuangou"];;
    
    _loginLabel.text = @"点击登录";
    _loginDescLabel.text = @"登录享优惠";
    _dianPinLabel.text = @"我的点评";
    _collectionLabel.text = @"我的关注";
    _couponLabel.text = @"我的团购劵";
}

- (void)_initSubViews {
    
    _topLine = [CALayer layer];
    _topLine.size = CGSizeMake(kScreenWidth, CGFloatFromPixel(1));
    _topLine.backgroundColor = kYPLineColor;
    
    _bottomLine = [CALayer layer];
    _bottomLine.size = CGSizeMake(kScreenWidth, CGFloatFromPixel(1));
    _bottomLine.bottom = self.height;
    _bottomLine.backgroundColor = kYPLineColor;
    
    _horizontalLine = [CALayer layer];
    _horizontalLine.size = CGSizeMake(kScreenWidth, CGFloatFromPixel(1));
    _horizontalLine.top = kLoginBtnHeight;
    _horizontalLine.backgroundColor = kYPLineColor;
    
    _verticalLine1 = [CALayer layer];
    _verticalLine1.size = CGSizeMake(CGFloatFromPixel(1), kLoginBtnHeight - 20);
    _verticalLine1.left = kViewItemWidth;
    _verticalLine1.top =  kLoginBtnHeight + 10;
    _verticalLine1.backgroundColor = kYPLineColor;
    
    _verticalLine2 = [CALayer layer];
    _verticalLine2.size = CGSizeMake(CGFloatFromPixel(1), kLoginBtnHeight - 20);
    _verticalLine2.left = kViewItemWidth * 2;
    _verticalLine2.top = kLoginBtnHeight + 10;
    _verticalLine2.backgroundColor = kYPLineColor;
    
    [self.layer addSublayer:_topLine];
    [self.layer addSublayer:_bottomLine];
    [self.layer addSublayer:_horizontalLine];
    [self.layer addSublayer:_verticalLine1];
    [self.layer addSublayer:_verticalLine2];
    
    _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _loginBtn.exclusiveTouch = YES;
    _loginBtn.size = CGSizeMake(kScreenWidth, kLoginBtnHeight);
    [_loginBtn setBackgroundImage:[UIImage imageWithColor:kYPBtnHighlightColor] forState:UIControlStateHighlighted];
    
    _avatarImageView = [UIImageView new];
    _avatarImageView.size = CGSizeMake(kImageViewSize, kImageViewSize);
    _avatarImageView.left = kYPMargin + 5;
    _avatarImageView.centerY = kLoginBtnHeight / 2;
    
    _loginLabel = [UILabel new];
    _loginLabel.size = CGSizeMake(kLabelHeight * 5, kLabelHeight);
    _loginLabel.userInteractionEnabled = YES;
    _loginLabel.font = [UIFont systemFontOfSize:16];
    _loginLabel.left = _avatarImageView.right + kYPMargin;
    _loginLabel.centerY = _avatarImageView.centerY;
    
    _arrowImageView = [UIImageView new];
    _arrowImageView.size = CGSizeMake(12, 12);
    _arrowImageView.right = kScreenWidth - 15;
    _arrowImageView.centerY = _avatarImageView.centerY;
    
    _loginDescLabel = [UILabel new];
    _loginDescLabel.size = CGSizeMake(kLabelHeight * 3, kLabelHeight);
    _loginDescLabel.userInteractionEnabled = NO;
    _loginDescLabel.textColor = kBtnDescLabelTextColor;
    _loginDescLabel.font = [UIFont systemFontOfSize:12];
    _loginDescLabel.right = _arrowImageView.left - kYPMargin;
    _loginDescLabel.centerY = _avatarImageView.centerY;
    
    [self addSubview:_loginBtn];
    [_loginBtn addSubview:_avatarImageView];
    [_loginBtn addSubview:_loginLabel];
    [_loginBtn addSubview:_loginDescLabel];
    [_loginBtn addSubview:_arrowImageView];

    _dianPinBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _dianPinBtn.exclusiveTouch = YES;
    _dianPinBtn.size = CGSizeMake(kViewItemWidth, kLoginBtnHeight - 1);
    _dianPinBtn.top = kLoginBtnHeight + 0.5;
    [_dianPinBtn setBackgroundImage:[UIImage imageWithColor:kYPBtnHighlightColor] forState:UIControlStateHighlighted];

    _collectionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _collectionBtn.exclusiveTouch = YES;
    _collectionBtn.size = CGSizeMake(kViewItemWidth - 0.5, _dianPinBtn.height);
    _collectionBtn.left = _dianPinBtn.right + 0.5;
    _collectionBtn.top = _dianPinBtn.top;
    [_collectionBtn setBackgroundImage:[UIImage imageWithColor:kYPBtnHighlightColor] forState:UIControlStateHighlighted];

    _couponBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _couponBtn.exclusiveTouch = YES;
    _couponBtn.size = CGSizeMake(_collectionBtn.width, _collectionBtn.height);
    _couponBtn.left = _collectionBtn.right + 0.5;
    _couponBtn.top = _dianPinBtn.top;
    [_couponBtn setBackgroundImage:[UIImage imageWithColor:kYPBtnHighlightColor] forState:UIControlStateHighlighted];

    [self addSubview:_dianPinBtn];
    [self addSubview:_collectionBtn];
    [self addSubview:_couponBtn];

    CGPoint btnCenter = [self convertPoint:_dianPinBtn.center toView:_dianPinBtn];
    btnCenter.y -= 10;
    _dianPinImageView = [UIImageView new];
    _dianPinImageView.size = CGSizeMake(30, 30);
    _dianPinImageView.center = btnCenter;
    
    _collectionImageView = [UIImageView new];
    _collectionImageView.size = _dianPinImageView.size;
    _collectionImageView.center = btnCenter;
    
    _couponImageView = [UIImageView new];
    _couponImageView.size = _dianPinImageView.size;
    _couponImageView.center = btnCenter;
    
    [_dianPinBtn addSubview:_dianPinImageView];
    [_collectionBtn addSubview:_collectionImageView];
    [_couponBtn addSubview:_couponImageView];

    _dianPinLabel = [UILabel new];
    _dianPinLabel.size = CGSizeMake(kBtnLabelWidth, kBtnLabelHeight);
    _dianPinLabel.userInteractionEnabled = NO;
    _dianPinLabel.font = [UIFont systemFontOfSize:12];
    _dianPinLabel.textAlignment = NSTextAlignmentCenter;
    _dianPinLabel.top = _dianPinImageView.bottom + 8;
    _dianPinLabel.centerX = _dianPinImageView.centerX;
    
    _collectionLabel = [UILabel new];
    _collectionLabel.size = _dianPinLabel.size;
    _collectionLabel.userInteractionEnabled = NO;
    _collectionLabel.font = [UIFont systemFontOfSize:12];
    _collectionLabel.textAlignment = NSTextAlignmentCenter;
    _collectionLabel.top = _dianPinLabel.top;
    _collectionLabel.centerX = _collectionImageView.centerX;
    
    _couponLabel = [UILabel new];
    _couponLabel.size = _dianPinLabel.size;
    _couponLabel.userInteractionEnabled = NO;
    _couponLabel.font = [UIFont systemFontOfSize:12];
    _couponLabel.textAlignment = NSTextAlignmentCenter;
    _couponLabel.top = _dianPinLabel.top;
    _couponLabel.centerX = _couponImageView.centerX;
    
    [_dianPinBtn addSubview:_dianPinLabel];
    [_collectionBtn addSubview:_collectionLabel];
    [_couponBtn addSubview:_couponLabel];
    
    [_loginBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        NSLog(@"_loginBtn");
    }];
    
    [_dianPinBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        NSLog(@"_dianPinBtn");
    }];
    
    [_collectionBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        NSLog(@"_collectionBtn");
    }];
    
    [_couponBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        NSLog(@"_couponBtn");
    }];
}

@end





