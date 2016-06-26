//
//  MyViewController.m
//  Yep
//
//  Created by cash on 16/4/22.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import "MyViewController.h"
#import "MJChiBaoZiHeader.h"
#import "MyBlendedView.h"
#import "UserCenterModel.h"
#import "CommonCell.h"
#import "YYKit.h"
#import "YepMacro.h"
#import "YPHelper.h"

@interface MyViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) MyBlendedView *myBlendedView;
@property (nonatomic, copy)   NSArray *userCenterIndex;

@end

@implementation MyViewController


#pragma mark - Lifecycle

- (instancetype)init {
    self = [super init];
    _userCenterIndex = [NSMutableArray new];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = kYPBackgroundColor;
    self.navigationItem.title = @"我的";
    
    [self _initData];
    [self _initNavBar];
    [self _initTableView];
    
    MJChiBaoZiHeader *header = [MJChiBaoZiHeader headerWithRefreshingTarget:self refreshingAction:@selector(_loadNewData)];
    header.automaticallyChangeAlpha = YES;
    header.lastUpdatedTimeLabel.hidden = YES;
    header.stateLabel.hidden = YES;
    _tableView.mj_header = header;
    [_tableView.mj_header beginRefreshing];
    
}

#pragma mark - Event response

- (void)_loadNewData {
    sleep(1.5);
    [_tableView.mj_header endRefreshing];
}

- (void)_help {
    
}


#pragma mark - Private methods

- (void)_initData {
    
    NSArray *preload = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"usercenter-preload" ofType:@"plist"]];
    NSArray *userCenterData = [NSArray modelArrayWithClass:[UserCenterModel class] json:preload];
    
    NSMutableArray *userCenterIndex = [NSMutableArray array];
    NSMutableArray *innerArray;
    UserCenterModel *modelKeep = [UserCenterModel new];
    [userCenterIndex addObject:[NSArray arrayWithObjects:@"yepHolder", nil]];
    for (UserCenterModel *model in userCenterData) {
        if (model.group == modelKeep.group) {
            [innerArray addObject:model];
        } else {
            innerArray = [NSMutableArray array];
            [innerArray addObject:model];
        }
        if (![userCenterIndex containsObject:innerArray]) {
            [userCenterIndex addObject:innerArray];
        }
        modelKeep = model;
    }
    _userCenterIndex = userCenterIndex.copy;
}

- (void)_initNavBar {

    UIBarButtonItem *helpItem = [[UIBarButtonItem alloc] initWithTitle:@"客服中心" style:UIBarButtonItemStylePlain target:self action:@selector(_help)];
    helpItem.tintColor = [UIColor orangeColor];
    self.navigationItem.rightBarButtonItem = helpItem;
    
    // searchBar
}

- (void)_initTableView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.scrollIndicatorInsets = _tableView.contentInset;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.backgroundView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
    
    _myBlendedView = [MyBlendedView new];
    [_tableView addSubview:_myBlendedView];
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _userCenterIndex.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   return [_userCenterIndex[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (0 != indexPath.section) {
        CommonCell *commonCell = [[CommonCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[CommonCell cellId]];
        [self configureCell:commonCell forRowAtIndexPath:indexPath];
        return commonCell;
    }
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"nothing"];
    cell.contentView.backgroundColor = kYPBackgroundColor;
    return cell;
}

- (void)configureCell:(CommonCell *)cell
    forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UserCenterModel *model = _userCenterIndex[indexPath.section][indexPath.row];
    cell.commonImageView.image = [YPHelper imageNamed:model.iconString];
    cell.descLabel.text = model.title;
    if ([model.title isEqualToString:@"我的钱包"]) {
        cell.tipLabel.text = @"积分/抵用劵/现金劵";
        cell.tipLabel.hidden = NO;
    }
    if ([model.title isEqualToString:@"我的订单"]) {
        cell.moreItemImageView.image = [YPHelper imageNamed:@"personal_icon_new"];
        cell.moreItemImageView.hidden = NO;
    }
}


#pragma mark - UITableViewDataDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"%@", indexPath);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        return _myBlendedView.height - 35;
    }
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (0 == section) {
        return 0;
    }
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 5;
}

@end

