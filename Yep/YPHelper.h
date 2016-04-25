//
//  YPHelper.h
//  Yep
//
//  Created by cash on 16/4/22.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YYMemoryCache, YYWebImageManager;

@interface YPHelper : NSObject

+ (NSBundle *)bundle;

+ (YYMemoryCache *)imageCache;

+ (UIImage *)imageNamed:(NSString *)name;

+ (UIImage *)imageWithPath:(NSString *)path;

+ (YYWebImageManager *)avatarImageManager;

+ (NSAttributedString *)attachmentWithImage:(UIImage *)image string:(NSString *)string;

@end
