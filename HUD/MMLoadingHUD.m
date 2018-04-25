//
//  MMLoadingHUD.m
//  111
//
//  Created by LX on 2018/4/13.
//  Copyright © 2018年 LX. All rights reserved.
//

#define kWIDTH [[UIScreen mainScreen] bounds].size.width
#define kHeight [[UIScreen mainScreen] bounds].size.height
#define kDefaultView [[UIApplication sharedApplication] keyWindow]

#import "MMLoadingHUD.h"
#import "MBProgressHUD.h"


static NSString *kLoadingMessage = @"加载中";
static NSInteger kDefaultShowTime = 5;

@interface MMLoadingHUD ()

@end

@implementation MMLoadingHUD

#pragma mark -- Public Method

+ (void)showLoadingWithView:(UIView *)view
{
    MBProgressHUD *_hud=[[MBProgressHUD alloc]initWithView:view];
    _hud.removeFromSuperViewOnHide=YES;
    _hud.userInteractionEnabled=YES;
    _hud.label.text=NSLocalizedString(kLoadingMessage,nil);
    _hud.contentColor = [UIColor whiteColor];
    _hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    _hud.bezelView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    _hud.backgroundView.color = [UIColor colorWithWhite:0 alpha:0.5];
    [view addSubview:_hud];
    [_hud showAnimated:YES];
}

+ (void)showLoadingWithView:(UIView *)view title:(NSString *)title
{
    if (!view) {
        view=kDefaultView;
    }
    if (title.length==0) {
        title=kLoadingMessage;
    }
    MBProgressHUD *_hud=[[MBProgressHUD alloc]initWithView:view];
    _hud.removeFromSuperViewOnHide=YES;
    _hud.label.text=NSLocalizedString(title,nil);
    _hud.contentColor = [UIColor whiteColor];
    _hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    _hud.bezelView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    _hud.backgroundView.color = [UIColor colorWithWhite:0 alpha:0.5];
    [view addSubview:_hud];
    [_hud showAnimated:YES];
}

+ (void)showAlertWithView:(UIView *)view title:(NSString *)title
{
    if (!view) {
        view=kDefaultView;
    }
     MBProgressHUD *_hud=[[MBProgressHUD alloc]initWithView:view];
    _hud.animationType = MBProgressHUDAnimationZoom;
    _hud.margin = 10.f;
    _hud.mode = MBProgressHUDModeText;
    //HUD.yOffset = 200;
    _hud.removeFromSuperViewOnHide = YES;
    _hud.userInteractionEnabled=NO;
    _hud.offset = CGPointMake(0, 200);
    _hud.contentColor = [UIColor whiteColor] ;
    _hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    _hud.bezelView.backgroundColor = [UIColor blackColor];
    _hud.backgroundView.color = [UIColor clearColor];
    [view addSubview:_hud];
    _hud.label.text=NSLocalizedString(title,nil);
    [_hud showAnimated:YES];
    [_hud hideAnimated:YES afterDelay:kDefaultShowTime];
}

+ (void)showAlertWithErrorView:(UIView *)view title:(NSString *)title
{
    if (!view) {
        view=kDefaultView;
    }
    MBProgressHUD *_hud=[[MBProgressHUD alloc]initWithView:view];
    _hud.contentColor = [UIColor whiteColor];
    _hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    _hud.bezelView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    _hud.backgroundView.color = [UIColor colorWithWhite:0 alpha:0.5];
    _hud.removeFromSuperViewOnHide = YES;
    _hud.animationType = MBProgressHUDAnimationZoom;
    _hud.mode = MBProgressHUDModeCustomView;
    [view addSubview:_hud];
    UIImageView *littleView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    littleView.image = [UIImage imageNamed:@"error.png"];
    _hud.customView = littleView;
    _hud.label.text = title;
    [_hud showAnimated:YES];
    [_hud hideAnimated:YES afterDelay:kDefaultShowTime];
}

+ (void)showAlertWithSuccessView:(UIView *)view title:(NSString *)title
{
    if (!view) {
        view=kDefaultView;
    }
    MBProgressHUD *_hud=[[MBProgressHUD alloc]initWithView:view];
    _hud.contentColor = [UIColor whiteColor];
    _hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    _hud.bezelView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    _hud.backgroundView.color = [UIColor colorWithWhite:0 alpha:0.5];
    _hud.removeFromSuperViewOnHide = YES;
    _hud.animationType = MBProgressHUDAnimationZoom;
    _hud.mode = MBProgressHUDModeCustomView;
    [view addSubview:_hud];
    UIImageView *littleView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    littleView.image = [UIImage imageNamed:@"success.png"];
    _hud.customView = littleView;
    _hud.label.text = title;
    [_hud showAnimated:YES];
    [_hud hideAnimated:YES afterDelay:kDefaultShowTime];
}

+ (void)hideLoadingWithView:(UIView *)view;
{
    [MBProgressHUD hideHUDForView:view animated:YES];
}

@end
