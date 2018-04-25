//
//  MMLoadingHUD.h
//  111
//
//  Created by LX on 2018/4/13.
//  Copyright © 2018年 LX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMLoadingHUD : NSObject

+ (void)showLoadingWithView:(UIView *)view;

+ (void)showLoadingWithView:(UIView *)view title:(NSString *)title;

+ (void)showAlertWithView:(UIView *)view title:(NSString *)title;

+ (void)showAlertWithErrorView:(UIView *)view title:(NSString *)title;

+ (void)showAlertWithSuccessView:(UIView *)view title:(NSString *)title;

+ (void)hideLoadingWithView:(UIView *)view;

@end
