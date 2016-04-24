//
//  DiscoverViewController.m
//  Yep
//
//  Created by cash on 16/4/22.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import "DiscoverViewController.h"
#import "FriendCircleCell.h"
#import "FoundCommonCell.h"
#import "FullImageCell.h"
#import "FunnyLifeCell.h"
#import "YepMacro.h"
#import "YYKit.h"
#import "YPHelper.h"

@interface DiscoverViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *solidDataArr;
@property (nonatomic, strong) NSArray *dataArr;

@end

@implementation DiscoverViewController


#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = kYPBackgroundColor;
    _dataArr = [NSArray arrayWithObjects:@"", @"", @"", @"", @"", nil];
    
    [self _initData];
    [self _initNavBar];
    [self _initTableView];
    
    [_tableView registerClass:[FoundCommonCell class] forCellReuseIdentifier:[FoundCommonCell cellId]];
    [_tableView registerClass:[FunnyLifeCell class] forCellReuseIdentifier:[FunnyLifeCell cellId]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    
}


#pragma mark - Event response

- (void)_chooseCity {
    
}


#pragma mark - Public methods



#pragma mark - Private methods

- (void)_initData {
    _solidDataArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"found-preload" ofType:@"plist"]];
}

- (void)_initNavBar {
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"南京" style:UIBarButtonItemStylePlain target:self action:@selector(_chooseCity)];
    UIButton *downArrow = [UIButton new];
    [downArrow setImage:[UIImage imageNamed:@"downArrow"] forState:UIControlStateNormal];
    UIBarButtonItem *downItem = [[UIBarButtonItem alloc] initWithCustomView:downArrow];
    self.navigationItem.leftBarButtonItems = @[leftItem, downItem];
    
    // searchBar
}

- (void)_initTableView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    _tableView.frame = self.view.bounds;
    _tableView.scrollIndicatorInsets = _tableView.contentInset;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.backgroundView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
        case 2:
            return 2;
        case 3:
            return _dataArr.count;;
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    if (0 == section) {
        FriendCircleCell *cell = [[FriendCircleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[FriendCircleCell cellId]];
        cell.titleLabel.text = @"好友去哪";
        cell.descLabel.text = @"看土豪朋友去哪得瑟!";
        return cell;
    } else if (1 == section || 2 == section) {
        FoundCommonCell *foundCommonCell = [_tableView dequeueReusableCellWithIdentifier:[FoundCommonCell cellId] forIndexPath:indexPath];
        NSArray *tmp =  _solidDataArr[section][row];
        foundCommonCell.commonImageView.image = [YPHelper imageNamed:tmp[0]];
        foundCommonCell.titleLabel.text = tmp[1];
        foundCommonCell.tipLabel.text = tmp[2];
        return foundCommonCell;
    }
    if (0 == row) {
        FullImageCell *fullCell = [[FullImageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[FullImageCell cellId]];
        fullCell.descLabel.text = @"让你欲罢不能又绕梁三日的味道!";
        return fullCell;
    }
    FunnyLifeCell *funnyLifeCell = [_tableView dequeueReusableCellWithIdentifier:[FunnyLifeCell cellId] forIndexPath:indexPath];
    funnyLifeCell.titleLabel.text = @"兰芝又送小样了，快去跟乔妹用同款吧！";
    funnyLifeCell.descLabel.text = @"南京免费赠品";
    funnyLifeCell.funfireLabel.attributedText = [YPHelper attachmentWithImage:[YPHelper imageNamed:@"found_icon_funfire"] string:@" 32343"];
    [funnyLifeCell.funfireLabel sizeToFit];
    funnyLifeCell.commentLabel.attributedText = [YPHelper attachmentWithImage:[YPHelper imageNamed:@"found_icon_comment"] string:@" 12435"];
    [funnyLifeCell.commentLabel sizeToFit];
    
    return funnyLifeCell;
}

#pragma mark - UITableViewDataDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    if (0 == section) {
        return 70;
    } else if (1 == section || 2 == section) {
        return 48;
    }
    if (0 == row) {
        return 140;
    }
    return 86;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (3 == section) {
        return @"趣味生活";
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (0 == section) {
        return 10;
    } else if (3 == section) {
        return 25;
    }
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 5;
}

@end






