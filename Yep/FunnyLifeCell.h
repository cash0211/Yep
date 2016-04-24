//
//  FunnyLifeCell.h
//  Yep
//
//  Created by cash on 16/4/24.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FunnyLifeCell : UITableViewCell

@property (nonatomic, strong) UIImageView *funLifeImageView;
@property (nonatomic, strong) UILabel     *titleLabel;
@property (nonatomic, strong) UILabel     *descLabel;
@property (nonatomic, strong) UILabel     *funfireLabel;
@property (nonatomic, strong) UILabel     *commentLabel;

+ (NSString *)cellId;

@end
