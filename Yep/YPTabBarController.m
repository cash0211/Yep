//
//  YPTabBarController.m
//  Yep
//
//  Created by cash on 16/4/18.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import "YPTabBarController.h"
#import "HomePageViewController.h"

@interface YPTabBarController ()

@end

@implementation YPTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HomePageViewController *homePageVC = [HomePageViewController new];
    
    self.viewControllers = @[
                             [[UINavigationController alloc] initWithRootViewController:homePageVC]
                             ];
    
    NSArray *titles = @[@"首页", @"团购", @"发现", @"我的"];
    NSArray *images = @[@"home_page", @"group_buying", @"discover", @"my"];
    [self.tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem *item, NSUInteger idx, BOOL *stop) {
        [item setTitle:titles[idx]];
        [item setImage:[UIImage imageNamed:images[idx]]];
        [item setSelectedImage:[UIImage imageNamed:[images[idx] stringByAppendingString:@"_selected"]]];
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private methods



#pragma mark - UITabBarDelegate



@end
