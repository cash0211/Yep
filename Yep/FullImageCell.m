//
//  FullImageCell.m
//  Yep
//
//  Created by cash on 16/4/24.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import "FullImageCell.h"
#import "YYKit.h"
#import "YepMacro.h"

#define kViewHeight          140
#define kImageViewWidth      kScreenWidth - kYPMargin * 2
#define kImageViewHeight     kViewHeight - kYPMargin * 2

@implementation FullImageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    self.backgroundColor = [UIColor whiteColor];
    self.size = CGSizeMake(kScreenWidth, kViewHeight);
    [self _initSubViews];
    
    return self;
}

- (void)_initSubViews {
    
    _fullImageView = [UIImageView new];
    _fullImageView.size = CGSizeMake(kImageViewWidth, kImageViewHeight);
    _fullImageView.left = kYPMargin;
    _fullImageView.top = _fullImageView.left;
    _fullImageView.backgroundColor = [UIColor purpleColor];
    
    _descLabel = [UILabel new];
    _descLabel.size = CGSizeMake(_fullImageView.width, 18);
    _descLabel.userInteractionEnabled = NO;
    _descLabel.font = [UIFont systemFontOfSize:18];
    _descLabel.textColor = [UIColor whiteColor];
    _descLabel.left = kYPMargin;
    _descLabel.bottom = _fullImageView.bottom - kYPMargin * 2;
    
    [self addSubview:_fullImageView];
    [_fullImageView addSubview:_descLabel];
}

+ (NSString *)cellId {
    return @"fullImageCell";
}

@end
