//
//  UserCenterModel.m
//  Yep
//
//  Created by cash on 16/4/23.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import "UserCenterModel.h"

@implementation UserCenterModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"tagId"     : @"TagId",
             @"group"     : @"Group",
             @"needLogin" : @"NeedLogin",
             @"subTitle"  : @"SubTitle",
             @"order"     : @"Order",
             @"url"       : @"Url",
             @"iconUrl"   : @"IconUrl",
             @"iconString": @"IconString",
             @"title"     : @"Title",
             @"elementId" : @"ElementId"
            };
}

@end
