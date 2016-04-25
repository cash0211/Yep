//
//  MultipleChoiceView.h
//  Yep
//
//  Created by cash on 16/4/18.
//  Copyright © 2016年 ___CASH___. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BlendedView;

@interface MultipleChoiceView : UIView

@property (nonatomic, weak) BlendedView   *blendedView;

+ (instancetype)sharedView;

@end
