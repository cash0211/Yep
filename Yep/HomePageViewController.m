//
//  HomePageViewController.m
//  Yep
//
//  Created by cash on 16/4/18.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import "HomePageViewController.h"
#import "BlendedView.h"
#import "GuessLikeNormalCell.h"
#import "GuessLikeCell.h"
#import "YYKit.h"
#import "MJRefresh.h"
#import "MJChiBaoZiHeader.h"

#define kYPBackgroundColor              UIColorHex(f2f2f2)

@interface HomePageViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView        *tableView;
@property (nonatomic, strong) BlendedView        *blendedView;
@property (nonatomic, strong) NSMutableArray     *guessLikeItems;

@end

@implementation HomePageViewController


#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
//    if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
//        self.automaticallyAdjustsScrollViewInsets = NO;
//    }
    self.view.backgroundColor = kYPBackgroundColor;

    [self _initNavBar];
    [self _initTableView];
       
    _guessLikeItems = [NSMutableArray arrayWithCapacity:3];
    [_guessLikeItems addObject:@"dsds"];
    [_guessLikeItems addObject:@"dsds"];
    [_guessLikeItems addObject:@"dsds"];
    
    MJChiBaoZiHeader *header = [MJChiBaoZiHeader headerWithRefreshingTarget:self refreshingAction:@selector(_loadNewData)];
    header.automaticallyChangeAlpha = YES;
    header.lastUpdatedTimeLabel.hidden = YES;
    header.stateLabel.hidden = YES;
    _tableView.mj_header = header;
    [_tableView.mj_header beginRefreshing];
    
    [_tableView registerClass:[GuessLikeNormalCell class] forCellReuseIdentifier:[GuessLikeNormalCell cellId]];
    [_tableView registerClass:[GuessLikeCell class] forCellReuseIdentifier:[GuessLikeCell cellId]];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Event response

- (void)_chooseCity {
    
}

- (void)_next {
    
}

- (void)_loadNewData {
    
    sleep(1.5);
    [_tableView.mj_header endRefreshing];
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

- (void)_initTableView {
    _tableView = [UITableView new];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    _tableView.frame = self.view.bounds;
    _tableView.scrollIndicatorInsets = _tableView.contentInset;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.backgroundView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
    
    _blendedView = [[BlendedView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [_tableView addSubview:_blendedView];
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (0 == section) {
        return 1;
    }
    return _guessLikeItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (0 != indexPath.section) {
//        GuessLikeNormalCell *nomalCell = [_tableView dequeueReusableCellWithIdentifier:[GuessLikeNormalCell cellId]];
//        nomalCell.titleLabel.text = @"最高领200元！快戳";
//        nomalCell.descLabel.text = @"洗剪吹、烫染、美甲、美容省省省";
//        return nomalCell;
        GuessLikeCell *cell = [_tableView dequeueReusableCellWithIdentifier:[GuessLikeCell cellId]];
        cell.titleLabel.text = @"藤之屋文化料理";
        cell.distanceLabel.text = @"1.0km";
        cell.descLabel.text = @"[胜太路] 低至4.3折 2-4人餐 提供免费WiFi";
        cell.priceLabel.text = @"$198.0";
        cell.soldLabel.text = @"已售10932";
        return cell;
    }
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"nothing"];
    cell.contentView.backgroundColor = kYPBackgroundColor;
    return cell;
}

#pragma mark - UITableViewDataDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        return _blendedView.height;
    }
    return 102;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (1 == section) {
        return [NSString stringWithFormat:@"猜你喜欢"];
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (1 == section) {
        return 28;
    }
    return 0;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}


#pragma mark - CustomDelegate



#pragma mark - Getters & Setters




@end





