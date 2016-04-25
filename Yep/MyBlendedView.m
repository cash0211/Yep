//
//  MyBlendedView.m
//  Yep
//
//  Created by cash on 16/4/22.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import "MyBlendedView.h"
#import "LoginEntryView.h"
#import "YYKit.h"
#import "YepMacro.h"

@interface MyBlendedView ()

@property (nonatomic, strong) LoginEntryView   *loginEntryView;
@property (nonatomic, assign) CGFloat           viewHeight;

@end

@implementation MyBlendedView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    self.backgroundColor = kYPBackgroundColor;
    [self _initSubViews];
    self.size = CGSizeMake(kScreenWidth, _viewHeight);
    
    return self;
}

- (void)_initSubViews {
    
    _loginEntryView = [LoginEntryView new];
    [self addSubview:_loginEntryView];
    
    _viewHeight = _loginEntryView.height;
}

@end
