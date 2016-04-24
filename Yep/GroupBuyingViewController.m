//
//  GroupBuyingViewController.m
//  Yep
//
//  Created by cash on 16/4/21.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import "GroupBuyingViewController.h"
#import "GuessLikeCell.h"
#import "ComprehensiveView.h"
#import "YYKit.h"
#import "MJRefresh.h"
#import "MJChiBaoZiHeader.h"
#import "YepMacro.h"

@interface GroupBuyingViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView        *tableView;
@property (nonatomic, strong) ComprehensiveView  *comprehensiveView;

@end

@implementation GroupBuyingViewController


#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = kYPBackgroundColor;

    [self _initNavBar];
    [self _initTableView];
    [self _initComprehensiveView];

    MJChiBaoZiHeader *header = [MJChiBaoZiHeader headerWithRefreshingTarget:self refreshingAction:@selector(_loadNewData)];
    header.automaticallyChangeAlpha = YES;
    header.lastUpdatedTimeLabel.hidden = YES;
    header.stateLabel.hidden = YES;
    _tableView.mj_header = header;
    [_tableView.mj_header beginRefreshing];

    [_tableView registerClass:[GuessLikeCell class] forCellReuseIdentifier:[GuessLikeCell cellId]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    // Notification
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    
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


#pragma mark - Private methods

- (void)_initNavBar {
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"南京" style:UIBarButtonItemStylePlain target:self action:@selector(_chooseCity)];
    UIButton *downArrow = [UIButton new];
    [downArrow setImage:[UIImage imageNamed:@"downArrow"] forState:UIControlStateNormal];
    UIBarButtonItem *downItem = [[UIBarButtonItem alloc] initWithCustomView:downArrow];
    self.navigationItem.leftBarButtonItems = @[leftItem, downItem];
    
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
}

- (void)_initComprehensiveView {
    
    _comprehensiveView = [[ComprehensiveView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [_tableView addSubview:_comprehensiveView];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (0 == section) {
        return 1;
    }
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (0 != indexPath.section) {
        GuessLikeCell *cell = [_tableView dequeueReusableCellWithIdentifier:[GuessLikeCell cellId] forIndexPath:indexPath];
        cell.titleLabel.text = @"团子大家族";
        cell.distanceLabel.text = @"1.0km";
        cell.descLabel.text = @"[开发区 托乐嘉花园] 低至6.6折 甜甜圈套餐一份 建议1-2人使用，提供免费WiFi balabala";
        cell.priceLabel.text = @"￥198.0";
        cell.soldLabel.text = @"已售10932";
        return cell;
    }
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"nothing"];
    cell.contentView.backgroundColor = kYPBackgroundColor;
    return cell;
}

#pragma mark - UITableViewDataDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        return _comprehensiveView.height + kYPMargin;
    }
    return 102;
}

@end






