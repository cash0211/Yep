//
//  GuessLikeCell.h
//  Yep
//
//  Created by cash on 16/4/20.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuessLikeCell : UITableViewCell

@property (nonatomic, strong) UIImageView *cellImageView;
@property (nonatomic, strong) UIView      *badge;
@property (nonatomic, strong) UILabel     *titleLabel;
@property (nonatomic, strong) UILabel     *distanceLabel;
@property (nonatomic, strong) UILabel     *descLabel;
@property (nonatomic, strong) UILabel     *priceLabel;
@property (nonatomic, strong) UILabel     *soldLabel;

+ (NSString *)cellId;

@end
