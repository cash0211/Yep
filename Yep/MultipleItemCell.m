//
//  MultipleItemCell.m
//  Yep
//
//  Created by cash on 16/4/18.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import "MultipleItemCell.h"
#import "YYKit.h"

@implementation MultipleItemCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    _descImageView = [UIImageView new];
    _descImageView.size = CGSizeMake(40, 40);
    _descImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:_descImageView];
    
    _descLabel = [UILabel new];
    _descLabel.font = [UIFont systemFontOfSize:15];
    _descLabel.text = @"test";
    [self.contentView addSubview:_descLabel];
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self updateLayout];
}

- (void)updateLayout {
    _descImageView.center = CGPointMake(self.width / 2, self.height / 2);
    _descImageView.backgroundColor = [UIColor purpleColor];
//    _descLabel.center = CGPointMake(_descImageView.bottom + 5, _descImageView.center.y);
    _descLabel.center = CGPointMake(self.width / 2, self.height / 2);
}

@end






