//
//  GuessLikeCell.m
//  Yep
//
//  Created by cash on 16/4/20.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import "GuessLikeCell.h"
#import "YYKit.h"

#define kCellHeight             102
#define kSubViewsPadding        10
#define kImageViewSize          (kCellHeight - kSubViewsPadding * 2)
#define kLabelWidth             (kScreenWidth - kSubViewsPadding * 3 - kImageViewSize)
#define kLabelHeight            20
#define kLabelPadding           (kImageViewSize - kLabelHeight * 2 - 10) / 2

@implementation GuessLikeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    [self _initSubviews];
    
    return self;
}

- (void)_initSubviews {
    
    _cellImageView = [UIImageView new];
    _cellImageView.size = CGSizeMake(kImageViewSize + 28, kImageViewSize);
    _cellImageView.top = kSubViewsPadding;
    _cellImageView.left = kSubViewsPadding;
    _cellImageView.backgroundColor = [UIColor purpleColor];
    
    _descLabel = [UILabel new];
    _descLabel.size = CGSizeMake(kLabelWidth, kLabelHeight);
    _descLabel.userInteractionEnabled = NO;
    _descLabel.font = [UIFont systemFontOfSize:12];
    _descLabel.textColor = [UIColor darkGrayColor];
    _descLabel.numberOfLines = 0;
    _descLabel.preferredMaxLayoutWidth = kLabelWidth;
    _descLabel.left = _cellImageView.right + kSubViewsPadding;
    _descLabel.centerY = _cellImageView.centerY - 4;
    
    _titleLabel = [UILabel new];
    _titleLabel.size = CGSizeMake(kLabelWidth - kSubViewsPadding * 3, kLabelHeight);
    _titleLabel.userInteractionEnabled = NO;
    _titleLabel.font = [UIFont systemFontOfSize:16];
    _titleLabel.left = _descLabel.left;
    _titleLabel.bottom = _descLabel.top - 4;
    
    _distanceLabel = [UILabel new];
    _distanceLabel.size = CGSizeMake(kSubViewsPadding * 3, _titleLabel.height);
    _distanceLabel.userInteractionEnabled = NO;
    _distanceLabel.font = [UIFont systemFontOfSize:10];
    _distanceLabel.textColor = [UIColor grayColor];
    _distanceLabel.right = kScreenWidth - kSubViewsPadding;
    _distanceLabel.bottom = _titleLabel.bottom;
    
    _priceLabel = [UILabel new];
    _priceLabel.size = CGSizeMake(_titleLabel.width, kLabelHeight);
    _priceLabel.userInteractionEnabled = NO;
    _priceLabel.font = [UIFont systemFontOfSize:16];
    _priceLabel.textColor = [UIColor orangeColor];
    _priceLabel.top = _descLabel.bottom + 4;
    _priceLabel.left = _descLabel.left;
    
    _soldLabel = [UILabel new];
    _soldLabel.size = CGSizeMake(_distanceLabel.width * 2, _priceLabel.height);
    _soldLabel.userInteractionEnabled = NO;
    _soldLabel.font = [UIFont systemFontOfSize:10];
    _soldLabel.textColor = [UIColor grayColor];
    _soldLabel.right = _distanceLabel.right;
    _soldLabel.bottom = _priceLabel.bottom;
    
    [self.contentView addSubview:_cellImageView];
    [self.contentView addSubview:_descLabel];
    [self.contentView addSubview:_titleLabel];
    [self.contentView addSubview:_distanceLabel];
    [self.contentView addSubview:_priceLabel];
    [self.contentView addSubview:_soldLabel];
}

+ (NSString *)cellId {
    return @"cell";
}

@end








