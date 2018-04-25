//
//  MMLoadingView.h
//  111
//
//  Created by LX on 2018/4/13.
//  Copyright © 2018年 LX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMLoadingView : UIView

+ (void)showLoadingView:(UIView *)bgView;
+ (void)showLaodingView:(UIView *)bgView title:(NSString *)title;
+ (void)hideLoadingView;

@end
