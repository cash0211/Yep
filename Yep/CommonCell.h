//
//  CommonCell.h
//  Yep
//
//  Created by cash on 16/4/22.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonCell : UITableViewCell

@property (nonatomic, strong) UIImageView *commonImageView;
@property (nonatomic, strong) UIImageView *arrowImageView;
@property (nonatomic, strong) UIImageView *moreItemImageView;
@property (nonatomic, strong) UILabel     *descLabel;
@property (nonatomic, strong) UILabel     *tipLabel;

+ (NSString *)cellId;

@end
