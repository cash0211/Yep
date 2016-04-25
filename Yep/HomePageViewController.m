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
#import "FetchMoreCell.h"
#import "MultipleItemCell.h"
#import "PromotionView.h"
#import "GridView.h"
#import "FlowView.h"
#import "YYKit.h"
#import "MJRefresh.h"
#import "MJChiBaoZiHeader.h"
#import "YepMacro.h"
#import "YPHelper.h"

@interface HomePageViewController () <UITableViewDataSource, UITableViewDelegate, YPBlendedViewDelegate>

@property (nonatomic, strong) UITableView        *tableView;
@property (nonatomic, strong) BlendedView        *blendedView;
@property (nonatomic, strong) FetchMoreCell      *moreCell;
@property (nonatomic, strong) NSArray            *guessLikeItems;

@end

@implementation HomePageViewController


#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kYPBackgroundColor;

    [self _initData];
    [self _initNavBar];
    [self _initTableView];
    
    MJChiBaoZiHeader *header = [MJChiBaoZiHeader headerWithRefreshingTarget:self refreshingAction:@selector(_loadNewData)];
    header.automaticallyChangeAlpha = YES;
    header.lastUpdatedTimeLabel.hidden = YES;
    header.stateLabel.hidden = YES;
    _tableView.mj_header = header;
    [_tableView.mj_header beginRefreshing];
    
    [_tableView registerClass:[GuessLikeNormalCell class] forCellReuseIdentifier:[GuessLikeNormalCell cellId]];
    [_tableView registerClass:[GuessLikeCell class] forCellReuseIdentifier:[GuessLikeCell cellId]];
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

- (void)_fetchMore {
    
    _moreCell.status = FetchMoreCellStatusLoading;

    NSMutableArray *mutable = _guessLikeItems.mutableCopy;
    [mutable addObjectsFromArray:mutable];
    _guessLikeItems = mutable;
    [_tableView reloadData];
}

#pragma mark - YPBlendedViewDelegate

- (void)multipleChoiceViewCellDidClick:(MultipleItemCell *)cell {
    NSLog(@"%s, %@", __PRETTY_FUNCTION__, cell.descLabel.text);
}

- (void)promotionViewDidClick:(PromotionView *)promotionView {
    NSLog(@"%s, %@", __PRETTY_FUNCTION__, promotionView.titleLabel.text);
}

- (void)gridViewTopLeftBtnDidClick:(GridView *)gridView {
    NSLog(@"%s, %@", __PRETTY_FUNCTION__, gridView.topLeftTitleLabel.text);
}

- (void)gridViewTopRightBtnDidClick:(GridView *)gridView {
    NSLog(@"%s, %@", __PRETTY_FUNCTION__, gridView.topRightTitleLabel.text);
}

- (void)gridViewBottomLeftBtnDidClick:(GridView *)gridView {
    NSLog(@"%s, %@", __PRETTY_FUNCTION__, gridView.bottomLeftTitleLabel.text);
}

- (void)gridViewBottomRightBtnDidClick:(GridView *)gridView {
    NSLog(@"%s, %@", __PRETTY_FUNCTION__, gridView.bottomRightTitleLabel.text);
}

- (void)flowViewLeftBtnDidClick:(FlowView *)flowView {
    NSLog(@"%s, %@", __PRETTY_FUNCTION__, flowView.leftTitleLabel.text);
}

- (void)flowViewMiddleBtnDidClick:(FlowView *)flowView {
    NSLog(@"%s, %@", __PRETTY_FUNCTION__, flowView.middleTitleLabel.text);
}

- (void)flowViewTopRightBtnDidClick:(FlowView *)flowView {
    NSLog(@"%s, %@", __PRETTY_FUNCTION__, flowView.topRightTitleLabel.text);
}

- (void)flowViewBottomRightBtnDidClick:(FlowView *)flowView {
    NSLog(@"%s, %@", __PRETTY_FUNCTION__, flowView.bottomRightTitleLabel.text);
}


#pragma mark - Private methods

- (void)_initData {
    NSMutableArray *mutableArr = [[NSMutableArray alloc] initWithObjects:@"", @"", @"", @"", @"", nil];
    _guessLikeItems = [mutableArr copy];
}

- (void)_initNavBar {
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"南京" style:UIBarButtonItemStylePlain target:self action:@selector(_chooseCity)];
    UIButton *downArrow = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 15, 30)];
    [downArrow addTarget:self action:@selector(_chooseCity) forControlEvents:UIControlEventTouchUpInside];
    [downArrow setImage:[YPHelper imageNamed:@"navibar_icon_arrow_down"] forState:UIControlStateNormal];
    UIBarButtonItem *downItem = [[UIBarButtonItem alloc] initWithCustomView:downArrow];
    self.navigationItem.leftBarButtonItems = @[leftItem ,downItem];
    
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
    _moreCell = [FetchMoreCell new];
    [_moreCell addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_fetchMore)]];
    _moreCell.status = FetchMoreCellStatusMore;
    _tableView.tableFooterView = _moreCell;
    [self.view addSubview:_tableView];
    
    _blendedView = [BlendedView new];
    _blendedView.delegate = self;
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

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (20 == _guessLikeItems.count) {
        _moreCell.status = FetchMoreCellStatusFinished;
        return;
    }
    if (scrollView.contentOffset.y > (scrollView.contentSize.height - scrollView.frame.size.height - 50)){
        [self _fetchMore];
    }
}



@end



