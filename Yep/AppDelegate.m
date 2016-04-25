//
//  AppDelegate.m
//  Yep
//
//  Created by cash on 16/4/18.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import "AppDelegate.h"
#import "YPTabBarController.h"
#import "YYKit.h"
#import "YepMacro.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    YPTabBarController *ypTabBarC = [YPTabBarController new];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = ypTabBarC;
    [self.window makeKeyAndVisible];
    
    [self _customizeAppearance];
    
    return YES;
}

- (void)_customizeAppearance {
    
    [[UITabBar appearance] setTintColor:[UIColor orangeColor]];
    [[UITabBar appearance] setBarTintColor:kYPBackgroundColor];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateSelected];
    
    [UISearchBar appearance].tintColor =  UIColorHex(0x15A230);
}

@end



