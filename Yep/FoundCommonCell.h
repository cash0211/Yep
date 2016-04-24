//
//  FoundCommonCell.h
//  Yep
//
//  Created by cash on 16/4/24.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoundCommonCell : UITableViewCell

@property (nonatomic, strong) UIImageView *commonImageView;
@property (nonatomic, strong) UIImageView *arrowImageView;
@property (nonatomic, strong) UILabel     *titleLabel;
@property (nonatomic, strong) UILabel     *tipLabel;

+ (NSString *)cellId;

@end
