//
//  MultipleChoiceScrollView.h
//  Yep
//
//  Created by cash on 16/4/18.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MultipleItemCell;

@protocol MultipleChoiceScrollViewDelegate <UICollectionViewDelegate>
- (void)multipleChoiceScrollViewDidTapCell:(MultipleItemCell *)cell;
@end

@interface MultipleChoiceScrollView : UICollectionView

@end
