//
//  PromotionView.m
//  Yep
//
//  Created by cash on 16/4/19.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import "PromotionView.h"
#import "YYKit.h"

#define kYPTopMargin     8
#define kViewHeight      80

@implementation PromotionView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    
    self.backgroundColor = [UIColor orangeColor];
    return self;
}

@end
