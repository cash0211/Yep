//
//  MultipleChoiceView.m
//  Yep
//
//  Created by cash on 16/4/18.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import "MultipleChoiceView.h"
#import "YYCGUtilities.h"
#import "MultipleChoiceScrollView.h"
#import "MultipleItemCell.h"
#import "UIView+YYAdd.h"
#import "CALayer+YYAdd.h"
#import "UIColor+YYAdd.h"
#import "YPHelper.h"
#import "YepMacro.h"

#define kOnePageCount          8
#define kItemHeight            50
#define kViewHeight            kItemHeight * 3 + 42
#define kCollectionViewHeight  kItemHeight * 3 + 14
#define kLayoutItemSize        (kCollectionViewHeight) / 2

#define kPageControlIndicatorTintColor  UIColorHex(f2f2f2)

@interface MultipleChoiceView () <UICollectionViewDelegate, UICollectionViewDataSource, MultipleChoiceScrollViewDelegate>

@property (nonatomic, strong) MultipleChoiceScrollView *collectionView;
@property (nonatomic, strong) UIPageControl            *pageControl;
@property (nonatomic, assign) NSInteger                itemTotalPageCount;
@property (nonatomic, assign) NSInteger                currentPageIndex;
@property (nonatomic, strong) NSArray                  *multipleItems;

@end

@implementation MultipleChoiceView {
    BOOL _dragLeft;
}

+ (instancetype)sharedView {
    static MultipleChoiceView *multiple;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        multiple = [self new];
    });
    return multiple;
}

- (instancetype)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.backgroundColor = [UIColor whiteColor];
    self.size = CGSizeMake(kScreenWidth, kViewHeight);
    [self _initItems];
    [self _initCollectionView];
    [self _initPageControl];

    return self;
}

- (void)_initItems {
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"multipleChoice" ofType:@"plist"]];
    _multipleItems = array;
    _itemTotalPageCount += @(array.count).integerValue;
}

- (void)_initCollectionView {
    
    CGFloat itemWidth = kScreenWidth / 4.0;
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = CGSizeMake(itemWidth, kLayoutItemSize);
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    
    _collectionView = [[MultipleChoiceScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCollectionViewHeight) collectionViewLayout:layout];
    [_collectionView registerClass:[MultipleItemCell class] forCellWithReuseIdentifier:[MultipleItemCell cellId]];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self addSubview:_collectionView];
}

- (void)_initPageControl {
    
    _pageControl = [UIPageControl new];
    _pageControl.size = CGSizeMake(kScreenWidth, 20);
    _pageControl.bottom = self.height - 2;
    _pageControl.numberOfPages = _multipleItems.count;
    _pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    _pageControl.pageIndicatorTintColor = kPageControlIndicatorTintColor;
    _pageControl.userInteractionEnabled = NO;
    
    CALayer *_bottomLine = [CALayer layer];
    _bottomLine.size = CGSizeMake(kScreenWidth, CGFloatFromPixel(1));
    _bottomLine.bottom = self.height;
    _bottomLine.backgroundColor = kYPLineColor;
    
    [self addSubview:_pageControl];
    [self.layer addSublayer:_bottomLine];
}

- (void)_configureCell:(MultipleItemCell *)cell
    forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    NSArray *array = _multipleItems[section][row];
    cell.descImageView.image = [YPHelper imageNamed:array[1]];
    cell.descLabel.text = array[0];
}

- (NSInteger)_calculateCurrentPageIndex:(UIScrollView *)scrollView  {
    
    CGFloat contentOffsetX = scrollView.contentOffset.x;
    NSInteger currentPageIndex =_currentPageIndex;
    if (contentOffsetX < kScreenWidth) {
        _dragLeft = NO;
        currentPageIndex = (_currentPageIndex - 1 + _itemTotalPageCount) % _itemTotalPageCount;
    } else if (contentOffsetX > kScreenWidth) {
        _dragLeft = YES;
        currentPageIndex = (_currentPageIndex + 1) % _itemTotalPageCount;
    }
    
    return currentPageIndex;
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return _itemTotalPageCount;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return kOnePageCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MultipleItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[MultipleItemCell cellId] forIndexPath:indexPath];
    [self _configureCell:cell forRowAtIndexPath:indexPath];
    
    return cell;
}


#pragma mark - MultipleChoiceScrollViewDelegate

- (void)multipleChoiceScrollViewDidTapCell:(MultipleItemCell *)cell {
    
    // 向上传递
    NSLog(@"%@, %@", cell.descImageView, cell.descLabel.text);
}


#pragma mark - scrollViewDidScrollDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    NSInteger currentPageIndex = [self _calculateCurrentPageIndex:scrollView];
    
    if (currentPageIndex != _currentPageIndex) {
        _currentPageIndex = currentPageIndex;
        _pageControl.currentPage = currentPageIndex;
        NSMutableArray *mutable = _multipleItems.mutableCopy;
        if (_dragLeft) {
            NSArray *first = [mutable firstObject];
            [mutable removeObject:first];
            [mutable addObject:first];
        } else {
            NSArray *last = [mutable lastObject];
            [mutable removeObject:last];
            [mutable insertObject:last atIndex:0];
        }
        _multipleItems = mutable.copy;
        
        [self.collectionView reloadData];
    }
    
    scrollView.contentOffset = CGPointMake(kScreenWidth, 0.0);
}

@end


