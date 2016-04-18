//
//  MultipleChoiceScrollView.m
//  Yep
//
//  Created by cash on 16/4/18.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import "MultipleChoiceScrollView.h"
#import "MultipleItemCell.h"
#import "YYKit.h"

@implementation MultipleChoiceScrollView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (!self) {
        return nil;
    }
    self.backgroundColor = [UIColor clearColor];
    self.backgroundView = [UIView new];
    self.pagingEnabled = YES;
    self.showsHorizontalScrollIndicator = NO;
    self.contentOffset = CGPointMake(kScreenWidth, 0.0);
    self.clipsToBounds = NO;
    self.canCancelContentTouches = NO;
    self.multipleTouchEnabled = NO;
    self.backgroundColor = [UIColor grayColor];
    return self;
}

- (MultipleItemCell *)cellForTouches:(NSSet<UITouch *> *)touches {
    UITouch *touch = touches.anyObject;
    CGPoint point = [touch locationInView:self];
    NSIndexPath *indexPath = [self indexPathForItemAtPoint:point];
    if (indexPath) {
        MultipleItemCell *cell = (id)[self cellForItemAtIndexPath:indexPath];
        return cell;
    }
    return nil;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    MultipleItemCell *cell = [self cellForTouches:touches];
    if (cell) {
        if ([self.delegate respondsToSelector:@selector(multipleChoiceScrollViewDidTapCell:)]) {
            [((id<MultipleChoiceScrollViewDelegate>) self.delegate) multipleChoiceScrollViewDidTapCell:cell];
        }
    }
}

@end





