//
//  FullImageCell.h
//  Yep
//
//  Created by cash on 16/4/24.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FullImageCell : UITableViewCell

@property (nonatomic, strong) UIImageView *fullImageView;
@property (nonatomic, strong) UILabel     *descLabel;

+ (NSString *)cellId;

@end
