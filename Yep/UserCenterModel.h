//
//  UserCenterModel.h
//  Yep
//
//  Created by cash on 16/4/23.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserCenterModel : NSObject

@property (nonatomic, copy)   NSString *tagId;
@property (nonatomic, assign) NSNumber *group;
@property (nonatomic, assign) Boolean  needLogin;
@property (nonatomic, copy)   NSString *subTitle;
@property (nonatomic, assign) NSNumber *order;
@property (nonatomic, copy)   NSString *url;
@property (nonatomic, copy)   NSString *iconUrl;
@property (nonatomic, copy)   NSString *iconString;
@property (nonatomic, copy)   NSString *title;
@property (nonatomic, copy)   NSString *elementId;

@end
