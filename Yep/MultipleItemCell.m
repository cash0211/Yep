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
    _descImageView.size = CGSizeMake(50, 50);
    _descImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    _descLabel = [UILabel new];
    _descLabel.font = [UIFont systemFontOfSize:11];
    _descLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.contentView addSubview:_descImageView];
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
    _descLabel.top = _descImageView.bottom + 3;
    _descLabel.left = _descImageView.left;
    _descLabel.size = CGSizeMake(_descImageView.width, 20);
}

@end






