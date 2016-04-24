//
//  FoundCommonCell.m
//  Yep
//
//  Created by cash on 16/4/24.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import "FoundCommonCell.h"
#import "YYKit.h"
#import "YepMacro.h"
#import "YPHelper.h"

#define kImageViewSize     26

@implementation FoundCommonCell

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
    _commonImageView.centerY = self.centerY + 2;
    
    _titleLabel = [UILabel new];
    _titleLabel.size = CGSizeMake(kScreenWidth / 2 - 20, 16);
    _titleLabel.userInteractionEnabled = NO;
    _titleLabel.font = [UIFont systemFontOfSize:15];
    _titleLabel.left = _commonImageView.right + kYPMargin;
    _titleLabel.centerY = _commonImageView.centerY;
    
    _arrowImageView = [UIImageView new];
    _arrowImageView.size = CGSizeMake(12, 12);
    _arrowImageView.right = kScreenWidth - 15;
    _arrowImageView.centerY = _commonImageView.centerY;
    _arrowImageView.image = [YPHelper imageNamed:@"Arrow_Left"];
    
    _tipLabel = [UILabel new];
    _tipLabel.size = CGSizeMake(kScreenWidth / 2 - 20, 12);
    _tipLabel.userInteractionEnabled = NO;
    _tipLabel.font = [UIFont systemFontOfSize:12];
    _tipLabel.textColor = [UIColor grayColor];
    _tipLabel.textAlignment = NSTextAlignmentRight;
    _tipLabel.centerY = _commonImageView.centerY;
    _tipLabel.right = _arrowImageView.left - 5;
    
    [self addSubview:_commonImageView];
    [self addSubview:_titleLabel];
    [self addSubview:_arrowImageView];
    [self addSubview:_tipLabel];
}

+ (NSString *)cellId {
    return @"foundCommonCell";
}


@end
