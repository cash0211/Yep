//
//  CommonCell.m
//  Yep
//
//  Created by cash on 16/4/22.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import "CommonCell.h"
#import "YYKit.h"
#import "YepMacro.h"
#import "YPHelper.h"

#define kImageViewSize     20

@interface CommonCell ()

@end

@implementation CommonCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    [self _initSubviews];
    return self;
}

- (void)_initSubviews {
    
    _commonImageView = [UIImageView new];
    _commonImageView.size = CGSizeMake(kImageViewSize, kImageViewSize);
    _commonImageView.left = kYPMargin + 5;
    _commonImageView.centerY = self.centerY;
    
    _descLabel = [UILabel new];
    _descLabel.size = CGSizeMake(kYPMargin * 6, 14);
    _descLabel.userInteractionEnabled = NO;
    _descLabel.font = [UIFont systemFontOfSize:15];
    _descLabel.left = _commonImageView.right + 10;
    _descLabel.centerY = _commonImageView.centerY;
    
    _arrowImageView = [UIImageView new];
    _arrowImageView.size = CGSizeMake(12, 12);
    _arrowImageView.right = kScreenWidth - 15;
    _arrowImageView.centerY = _commonImageView.centerY;
    _arrowImageView.image = [YPHelper imageNamed:@"Arrow_Left"];
    
    _tipLabel = [UILabel new];
    _tipLabel.size = CGSizeMake(kScreenWidth / 2 - 20, 10);
    _tipLabel.userInteractionEnabled = NO;
    _tipLabel.font = [UIFont systemFontOfSize:12];
    _tipLabel.textAlignment = NSTextAlignmentRight;
    _tipLabel.textColor = [UIColor grayColor];
    _tipLabel.centerY = _commonImageView.centerY;
    _tipLabel.right = _arrowImageView.left - 10;
    _tipLabel.hidden = YES;

    _moreItemImageView = [UIImageView new];
    _moreItemImageView.size = CGSizeMake(32, 18);
    _moreItemImageView.right = _arrowImageView.left - 10;
    _moreItemImageView.centerY = _commonImageView.centerY;
    _moreItemImageView.hidden = YES;
    
    [self addSubview:_commonImageView];
    [self addSubview:_descLabel];
    [self addSubview:_arrowImageView];
    [self addSubview:_tipLabel];
    [self addSubview:_moreItemImageView];
}

+ (NSString *)cellId {
    return @"commonCell";
}


@end
