//
//  ComprehensiveView.m
//  Yep
//
//  Created by cash on 16/4/21.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import "ComprehensiveView.h"
#import "CategoryView.h"
#import "NormalCategoryView.h"
#import "YYKit.h"
#import "YepMacro.h"
#import "YPHelper.h"

@interface ComprehensiveView ()

@property (nonatomic, strong) CategoryView       *categoryView;
@property (nonatomic, strong) NormalCategoryView *normalCategoryView;
@property (nonatomic, assign) CGFloat            viewHeight;

@end

@implementation ComprehensiveView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    self.backgroundColor = kYPBackgroundColor;
    [self _initSubViews];
    [self _initData];
    self.size = CGSizeMake(kScreenWidth, _viewHeight);
    return self;
}

- (void)_initData {
    NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"groupbuying-preload" ofType:@"plist"]];
    _categoryView.leftImageView.image = [YPHelper imageNamed:arr[0][0]];
    _categoryView.leftLabel.text = arr[0][1];
    _categoryView.middleImageView.image = [YPHelper imageNamed:arr[1][0]];
    _categoryView.middleLabel.text = arr[1][1];
    _categoryView.rightImageView.image = [YPHelper imageNamed:arr[2][0]];
    _categoryView.rightLabel.text = arr[2][1];
    _categoryView.leftImageView2.image = [YPHelper imageNamed:arr[3][0]];
    _categoryView.leftLabel2.text = arr[3][1];
    _categoryView.middleImageView2.image = [YPHelper imageNamed:arr[4][0]];
    _categoryView.middleLabel2.text = arr[4][1];
}

- (void)_initSubViews {
    
    _categoryView = [[CategoryView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    
    _normalCategoryView = [[NormalCategoryView alloc] initWithFrame:CGRectMake(0, _categoryView.bottom + kYPMargin, 0, 0)];
    _normalCategoryView.leftTitleLabel.text   = @"我们约会吧";
    _normalCategoryView.leftDescLabel.text    = @"情侣约会好去处";
    _normalCategoryView.middleTitleLabel.text = @"休闲娱乐";
    _normalCategoryView.middleDescLabel.text  = @"放肆释放激情";
    _normalCategoryView.rightTitleLabel.text  = @"精选美食";
    _normalCategoryView.rightDescLabel.text   = @"好吃又划算";
    
    [self addSubview:_categoryView];
    [self addSubview:_normalCategoryView];
    
    _viewHeight = _categoryView.height + _normalCategoryView.height + kYPMargin;
}


@end





