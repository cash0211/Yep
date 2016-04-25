//
//  BlendedView.h
//  Yep
//
//  Created by cash on 16/4/20.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MultipleItemCell, PromotionView, GridView, FlowView;

@protocol YPBlendedViewDelegate <NSObject>
@optional
- (void)multipleChoiceViewCellDidClick:(MultipleItemCell *)cell;
- (void)promotionViewDidClick:(PromotionView *)promotionView;
- (void)gridViewTopLeftBtnDidClick:(GridView *)gridView;
- (void)gridViewTopRightBtnDidClick:(GridView *)gridView;
- (void)gridViewBottomLeftBtnDidClick:(GridView *)gridView;
- (void)gridViewBottomRightBtnDidClick:(GridView *)gridView;
- (void)flowViewLeftBtnDidClick:(FlowView *)flowView;
- (void)flowViewMiddleBtnDidClick:(FlowView *)flowView;
- (void)flowViewTopRightBtnDidClick:(FlowView *)flowView;
- (void)flowViewBottomRightBtnDidClick:(FlowView *)flowView;
@end

@interface BlendedView : UIView

@property (nonatomic, weak) id<YPBlendedViewDelegate> delegate;

@end



