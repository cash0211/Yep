//
//  GuessLikeNormalCell.h
//  Yep
//
//  Created by cash on 16/4/20.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuessLikeNormalCell : UITableViewCell

@property (nonatomic, strong) UIImageView *normalImageView;
@property (nonatomic, strong) UILabel     *titleLabel;
@property (nonatomic, strong) UILabel     *descLabel;

+ (NSString *)cellId;

@end
