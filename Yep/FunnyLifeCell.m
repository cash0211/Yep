//
//  FunnyLifeCell.m
//  Yep
//
//  Created by cash on 16/4/24.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import "FunnyLifeCell.h"
#import "YYKit.h"
#import "YepMacro.h"
#import "YPHelper.h"

#define kCellHeight        86

#define kImageViewWidth    90
#define kImageViewHeight   kCellHeight - kYPMargin * 2

#define kLabelWidth        kScreenWidth - kImageViewWidth - kYPMargin * 4

@implementation FunnyLifeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    self.size = CGSizeMake(kScreenWidth, kCellHeight);
    [self _initSubviews];
    return self;
}

- (void)_initSubviews {
    
    _funLifeImageView = [UIImageView new];
    _funLifeImageView.size = CGSizeMake(kImageViewWidth, kImageViewHeight);
    _funLifeImageView.top = kYPMargin;
    _funLifeImageView.left = kYPMargin;
    _funLifeImageView.backgroundColor = [UIColor purpleColor];
    
    _titleLabel = [UILabel new];
    _titleLabel.size = CGSizeMake(kLabelWidth, 38);
    _titleLabel.userInteractionEnabled = NO;
    _titleLabel.font = [UIFont systemFontOfSize:15];
    _titleLabel.numberOfLines = 2;
    _titleLabel.left = _funLifeImageView.right + kYPMargin;
    _titleLabel.bottom = self.centerY + 5;
    
    _descLabel = [UILabel new];
    _descLabel.size = CGSizeMake(kLabelWidth - 30, 18);
    _descLabel.userInteractionEnabled = NO;
    _descLabel.font = [UIFont systemFontOfSize:12];
    _descLabel.textColor = [UIColor grayColor];
    _descLabel.left = _titleLabel.left;
    _descLabel.top = _titleLabel.bottom + kYPMargin;
    
    _commentLabel = [UILabel new];
    _commentLabel.size = CGSizeMake(50, 14);
    _commentLabel.userInteractionEnabled = NO;
    _commentLabel.font = _descLabel.font;
    _commentLabel.textColor = [UIColor grayColor];
    _commentLabel.textAlignment = NSTextAlignmentRight;
    _commentLabel.right = kScreenWidth - 15;
    _commentLabel.centerY = _descLabel.centerY;
    
    _funfireLabel = [UILabel new];
    _funfireLabel.size = _commentLabel.size;
    _funfireLabel.userInteractionEnabled = NO;
    _funfireLabel.font = _descLabel.font;
    _funfireLabel.textColor = [UIColor grayColor];
    _funfireLabel.textAlignment = NSTextAlignmentRight;
    _funfireLabel.right = _commentLabel.left - kYPMargin;
    _funfireLabel.centerY = _commentLabel.centerY;
    
    [self addSubview:_funLifeImageView];
    [self addSubview:_titleLabel];
    [self addSubview:_descLabel];
    [self addSubview:_commentLabel];
    [self addSubview:_funfireLabel];
}

+ (NSString *)cellId {
    return @"funnyLifeCell";
}

@end







