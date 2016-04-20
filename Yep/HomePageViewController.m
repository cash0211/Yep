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
#import "GridView.h"
#import "FlowView.h"
#import "YYKit.h"
#import "MJRefresh.h"
#import "MJChiBaoZiHeader.h"

#define kYPTopMargin     10

#define kYPBackgroundColor              UIColorHex(f2f2f2)

@interface HomePageViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView        *tableView;
@property (nonatomic, strong) MultipleChoiceView *multipleView;
@property (nonatomic, strong) PromotionView      *promotionView;
@property (nonatomic, strong) GridView           *gridView;
@property (nonatomic, strong) FlowView           *flowView;

@property (nonatomic, strong) NSMutableArray     *guessLikeItems;

@end

@implementation HomePageViewController


#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.view.backgroundColor = kYPBackgroundColor;

    [self _initNavBar];
    [self _initTableView];
    [self _initMultipleChoiceView];
    [self _initPromotionView];
    [self _initGridView];
    [self _initFlowView];
   
    _guessLikeItems = [NSMutableArray arrayWithCapacity:3];
    
    MJChiBaoZiHeader *header = [MJChiBaoZiHeader headerWithRefreshingTarget:self refreshingAction:@selector(_loadNewData)];
    header.automaticallyChangeAlpha = YES;
    header.lastUpdatedTimeLabel.hidden = YES;
    header.stateLabel.hidden = YES;
    _tableView.mj_header = header;
    [_tableView.mj_header beginRefreshing];
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
    _tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    _tableView.scrollIndicatorInsets = _tableView.contentInset;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.backgroundView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
    
    if (kSystemVersion < 7) {
        _tableView.top -= 64;
        _tableView.height += 20;
    }
}

- (void)_initMultipleChoiceView {
    _multipleView = [MultipleChoiceView sharedView];
    [_tableView addSubview:_multipleView];
}

- (void)_initPromotionView {
    _promotionView = [[PromotionView alloc] initWithFrame:CGRectMake(0, _multipleView.bottom + kYPTopMargin, 0, 0)];
    _promotionView.titleLabel.text = @"煲宫锅物料理";
    _promotionView.priceLabel.text = @"$ 65";
    _promotionView.countDownLabel.text = @"距离结束 ";
    [_tableView addSubview:_promotionView];
}

- (void)_initGridView {
    _gridView = [[GridView alloc] initWithFrame:CGRectMake(0, _promotionView.bottom + kYPTopMargin, 0, 0)];
    _gridView.topLeftTitleLabel.text = @"8折吃海鲜";
    _gridView.topLeftDescLabel.text = @"领千万红包";
    _gridView.topRightTitleLabel.text = @"抢1000万";
    _gridView.topRightDescLabel.text = @"红包大放送";
    _gridView.bottomLeftTitleLabel.text = @"特价看大片";
    _gridView.bottomLeftDescLabel.text = @"4月超口碑";
    _gridView.bottomRightTitleLabel.text = @"老字号馆子";
    _gridView.bottomRightDescLabel.text = @"地道够美味";
    
    [_tableView addSubview:_gridView];
}

- (void)_initFlowView {
    _flowView = [[FlowView alloc] initWithFrame:CGRectMake(0, _gridView.bottom + kYPTopMargin, 0, 0)];
    _flowView.leftTitleLabel.text = @"爱车";
    _flowView.leftDescLabel.text = @"9.9元洗车";
    _flowView.middleTitleLabel.text = @"家装";
    _flowView.middleDescLabel.text = @"9元送家电";
    _flowView.topRightTitleLabel.text = @"美发";
    _flowView.topRightDescLabel.text = @"9元做造型";
    _flowView.bottomRightTitleLabel.text = @"结婚";
    _flowView.bottomRightDescLabel.text = @"天天秒杀爆款";
    [_tableView addSubview:_flowView];
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
        NSString *cellID = @"cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        cell.textLabel.text = @"dd";
        return cell;
    }
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"nothing"];
    cell.contentView.backgroundColor = kYPBackgroundColor;
    return cell;
}


#pragma mark - UITableViewDataDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        return 800;
    }
    return 80;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}


#pragma mark - CustomDelegate



#pragma mark - Getters & Setters




@end





