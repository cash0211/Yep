//
//  FriendCircleCell.h
//  Yep
//
//  Created by cash on 16/4/24.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendCircleCell : UITableViewCell

@property (nonatomic, strong) UIImageView *friendImageView;
@property (nonatomic, strong) UIImageView *arrowImageView;
@property (nonatomic, strong) UILabel     *titleLabel;
@property (nonatomic, strong) UILabel     *descLabel;

+ (NSString *)cellId;

@end