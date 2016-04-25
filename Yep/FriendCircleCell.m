//
//  FriendCircleCell.m
//  Yep
//
//  Created by cash on 16/4/24.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import "FriendCircleCell.h"
#import "YYKit.h"
#import "YepMacro.h"
#import "YPHelper.h"

#define kViewHeight              70
#define kImageViewSize           35

@implementation FriendCircleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    self.backgroundColor = [UIColor whiteColor];
    self.size = CGSizeMake(kScreenWidth, kViewHeight);
    [self _initSubViews];
    [self _initData];
    
    return self;
}

- (void)_initData {
    _friendImageView.image = [YPHelper imageNamed:@"found_icon_friend"];
    _arrowImageView.image = [YPHelper imageNamed:@"found_friend_arrow_right"];
}

- (void)_initSubViews {
    
    _friendImageView = [UIImageView new];
    _friendImageView.size = CGSizeMake(kImageViewSize, kImageViewSize);
    _friendImageView.left = kYPMargin;
    _friendImageView.centerY = self.centerY;
    
    _titleLabel = [UILabel new];
    _titleLabel.size = CGSizeMake(kScreenWidth / 2 - 20, 15);
    _titleLabel.userInteractionEnabled = NO;
    _titleLabel.font = [UIFont systemFontOfSize:15];
    _titleLabel.left = _friendImageView.right + 8;
    _titleLabel.centerY = _friendImageView.centerY - kYPMargin;
    
    _descLabel = [UILabel new];
    _descLabel.size = CGSizeMake(_titleLabel.width, 13);
    _descLabel.userInteractionEnabled = NO;
    _descLabel.font = [UIFont systemFontOfSize:13];
    _descLabel.textColor = [UIColor grayColor];
    _descLabel.left = _titleLabel.left;
    _descLabel.top = _titleLabel.bottom + 8;
    
    _arrowImageView = [UIImageView new];
    _arrowImageView.size = CGSizeMake(12, 12);
    _arrowImageView.right = kScreenWidth - 15;
    _arrowImageView.centerY = _friendImageView.centerY;
    
    [self addSubview:_friendImageView];
    [self addSubview:_titleLabel];
    [self addSubview:_descLabel];
    [self addSubview:_arrowImageView];
}

+ (NSString *)cellId {
    return @"friendCircleCell";
}

@end
