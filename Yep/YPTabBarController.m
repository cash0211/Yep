//
//  YPTabBarController.m
//  Yep
//
//  Created by cash on 16/4/18.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import "YPTabBarController.h"
#import "HomePageViewController.h"
#import "GroupBuyingViewController.h"
#import "DiscoverViewController.h"
#import "MyViewController.h"
#import "YPHelper.h"

@interface YPTabBarController ()

@end

@implementation YPTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HomePageViewController *homePageVC = [HomePageViewController new];
    GroupBuyingViewController *groupbuyingVC = [GroupBuyingViewController new];
    DiscoverViewController *discoverVC = [DiscoverViewController new];
    MyViewController *myVC = [MyViewController new];
    
    self.viewControllers = @[
                             [[UINavigationController alloc] initWithRootViewController:homePageVC],
                             [[UINavigationController alloc] initWithRootViewController:groupbuyingVC],
                             [[UINavigationController alloc] initWithRootViewController:discoverVC],
                             [[UINavigationController alloc] initWithRootViewController:myVC]
                             ];
    
    NSArray *titles = @[@"首页", @"团购", @"发现", @"我的"];
    NSArray *images = @[@"home_footbar_icon_dianping",
                        @"home_footbar_icon_group",
                        @"home_footbar_icon_found",
                        @"home_footbar_icon_my"
                        ];
    [self.tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem *item, NSUInteger idx, BOOL *stop) {
        [item setTitle:titles[idx]];
        [item setImage:[YPHelper imageNamed:images[idx]]];
        [item setSelectedImage:[YPHelper imageNamed:[images[idx] stringByAppendingString:@"_pressed"]]];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
