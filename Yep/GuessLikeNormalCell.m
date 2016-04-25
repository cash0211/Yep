//
//  GuessLikeNormalCell.m
//  Yep
//
//  Created by cash on 16/4/20.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import "GuessLikeNormalCell.h"
#import "YYKit.h"
#import "YepMacro.h"

#define kCellHeight             102
#define kImageViewSize          (kCellHeight - kYPMargin * 2)
#define kLabelWidth             (kScreenWidth - kYPMargin * 3 - kImageViewSize)
#define kLabelHeight            20
#define kLabelPadding           (kImageViewSize - kLabelHeight * 2 - 10) / 2

@implementation GuessLikeNormalCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    [self _initSubviews];
    
    return self;
}

- (void)_initSubviews {
    
    _normalImageView = [UIImageView new];
    _normalImageView.size = CGSizeMake(kImageViewSize + 28, kImageViewSize);
    _normalImageView.top = kYPMargin;
    _normalImageView.left = kYPMargin;
    _normalImageView.backgroundColor = [UIColor purpleColor];
    
    _titleLabel = [UILabel new];
    _titleLabel.size = CGSizeMake(kLabelWidth, kLabelHeight);
    _titleLabel.userInteractionEnabled = NO;
    _titleLabel.font = [UIFont systemFontOfSize:16];
    _titleLabel.top = kYPMargin + kLabelPadding;
    _titleLabel.left = _normalImageView.right + kYPMargin;
    
    _descLabel = [UILabel new];
    _descLabel.size = CGSizeMake(kLabelWidth, kLabelHeight + 10);
    _descLabel.userInteractionEnabled = NO;
    _descLabel.font = [UIFont systemFontOfSize:14];
    _descLabel.numberOfLines = 2;
    _descLabel.top = _titleLabel.bottom + 6;
    _descLabel.left = _titleLabel.left;
    
    [self.contentView addSubview:_normalImageView];
    [self.contentView addSubview:_titleLabel];
    [self.contentView addSubview:_descLabel];
}

+ (NSString *)cellId {
    return @"normalCell";
}

@end

