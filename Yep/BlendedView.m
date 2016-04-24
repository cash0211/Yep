//
//  BlendedView.m
//  Yep
//
//  Created by cash on 16/4/20.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import "BlendedView.h"
#import "HomePageViewController.h"
#import "MultipleChoiceView.h"
#import "PromotionView.h"
#import "GridView.h"
#import "FlowView.h"
#import "YYKit.h"
#import "YepMacro.h"
#import "YPHelper.h"

@interface BlendedView ()

@property (nonatomic, strong) MultipleChoiceView *multipleView;
@property (nonatomic, strong) PromotionView      *promotionView;
@property (nonatomic, strong) GridView           *gridView;
@property (nonatomic, strong) FlowView           *flowView;
@property (nonatomic, assign) CGFloat             viewHeight;

@end

@implementation BlendedView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    self.backgroundColor = [UIColor clearColor];
    [self _initMultipleChoiceView];
    [self _initPromotionView];
    [self _initGridView];
    [self _initFlowView];
    self.size = CGSizeMake(kScreenWidth, _viewHeight);
    return self;
}

- (void)_initMultipleChoiceView {
    _multipleView = [MultipleChoiceView sharedView];
    [self addSubview:_multipleView];
}

- (void)_initPromotionView {
    _promotionView = [[PromotionView alloc] initWithFrame:CGRectMake(0, _multipleView.bottom + kYPMargin, 0, 0)];
    _promotionView.titleLabel.text = @"煲宫锅物料理";
    _promotionView.priceLabel.text = @"￥ 65";
    _promotionView.countDownLabel.text = @"距离结束 ";
    [self addSubview:_promotionView];
}

- (void)_initGridView {
    _gridView = [[GridView alloc] initWithFrame:CGRectMake(0, _promotionView.bottom + kYPMargin, 0, 0)];
    _gridView.topLeftImageView.image = [YPHelper imageNamed:@"findhome_haixian"];
    _gridView.topLeftTitleLabel.text = @"8折吃海鲜";
    _gridView.topLeftDescLabel.text = @"领千万红包";
    _gridView.topRightImageView.image = [YPHelper imageNamed:@"findhome_hongbao"];
    _gridView.topRightTitleLabel.text = @"抢1000万";
    _gridView.topRightDescLabel.text = @"红包大放送";
    _gridView.bottomLeftImageView.image = [YPHelper imageNamed:@"findhome_dapian"];
    _gridView.bottomLeftTitleLabel.text = @"特价看大片";
    _gridView.bottomLeftDescLabel.text = @"4月超口碑";
    _gridView.bottomRightImageView.image = [YPHelper imageNamed:@"findhome_guanzi"];
    _gridView.bottomRightTitleLabel.text = @"老字号馆子";
    _gridView.bottomRightDescLabel.text = @"地道够美味";
    
    [self addSubview:_gridView];
}

- (void)_initFlowView {
    _flowView = [[FlowView alloc] initWithFrame:CGRectMake(0, _gridView.bottom + kYPMargin, 0, 0)];
    _flowView.leftTitleLabel.text = @"爱车";
    _flowView.leftDescLabel.text = @"9.9元洗车";
    _flowView.middleTitleLabel.text = @"家装";
    _flowView.middleDescLabel.text = @"9元送家电";
    _flowView.topRightTitleLabel.text = @"美发";
    _flowView.topRightDescLabel.text = @"9元做造型";
    _flowView.bottomRightTitleLabel.text = @"结婚";
    _flowView.bottomRightDescLabel.text = @"天天秒杀爆款";
    [self addSubview:_flowView];
    
    _viewHeight += _multipleView.height + _promotionView.height + _gridView.height + _flowView.height + kYPMargin * 3;
}


@end






