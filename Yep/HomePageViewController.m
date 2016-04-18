//
//  HomePageViewController.m
//  Yep
//
//  Created by cash on 16/4/18.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import "HomePageViewController.h"
#import "MultipleChoiceView.h"
#import "PromotionView.h"

#import "YYKit.h"

@interface HomePageViewController ()

@property (nonatomic, strong) MultipleChoiceView *multipleView;

@end

@implementation HomePageViewController


#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    [self _initNavBar];
    [self _initMultipleChoiceView];
    [self _initPromotionView];
    [self _initGridView];
    [self _initFlowView];
    [self _initTableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    // layout
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    // Notification
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Event response

- (void)_chooseCity {
    
}

- (void)_next {
    
}


#pragma mark - Public methods



#pragma mark - Private methods

- (void)_initNavBar {
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"南京" style:UIBarButtonItemStylePlain target:self action:@selector(_chooseCity)];
    UIButton *downArrow = [UIButton new];
    [downArrow setImage:[UIImage imageNamed:@"downArrow"] forState:UIControlStateNormal];
    UIBarButtonItem *downItem = [[UIBarButtonItem alloc] initWithCustomView:downArrow];
    self.navigationItem.leftBarButtonItems = @[leftItem, downItem];
    
    UIButton *envelopBtn = [UIButton new];
    [envelopBtn addTarget:self action:@selector(_next) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:envelopBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    // searchBar
    
}

- (void)_initMultipleChoiceView {
    _multipleView = [MultipleChoiceView sharedView];
    [self.view addSubview:_multipleView];
}

- (void)_initPromotionView {
    PromotionView *promotionView = [[PromotionView alloc] initWithFrame:CGRectMake(0, _multipleView.bottom, kScreenWidth, 60)];
    [self.view addSubview:promotionView];
}

- (void)_initGridView {
    
}

- (void)_initFlowView {
    
}

- (void)_initTableView {
    
    
}

#pragma mark - UITableViewDataSource



#pragma mark - UITableViewDataDelegate



#pragma mark - CustomDelegate



#pragma mark - Getters & Setters




@end





