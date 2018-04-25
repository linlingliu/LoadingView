//
//  MMLoadingView.m
//  111
//
//  Created by LX on 2018/4/13.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "MMLoadingView.h"

@interface MMLoadingView ()
{
    UIVisualEffectView        *_contentView;
    NSTimer                   *_timer;
    UIImageView               *_imageView;
    CALayer                   *_maskLayer;
}

@end


@implementation MMLoadingView

#pragma mark -- init

+ (instancetype)sharedInstance
{
    static MMLoadingView *_loadView;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _loadView=[[MMLoadingView alloc]init];
    });
    return _loadView;
}

- (instancetype)init
{
    if (self=[super init]) {
        self.frame=[UIScreen mainScreen].bounds;
        _contentView=[[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
        _contentView.frame=self.bounds;
        [self addSubview:_contentView];
        
        _imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 120, 120)];
        _imageView.center=_contentView.center;
       NSMutableArray * images = [NSMutableArray array];
        for (int i = 1;  i < 16; i ++) {
            [images addObject:[UIImage imageNamed:[NSString stringWithFormat:@"loading_%d",i]]];
        }
        _imageView.animationImages=images;
        _imageView.image=[UIImage imageNamed:@"loading_15"];
        [_contentView.contentView addSubview:_imageView];
    }
    return self;
}

#pragma mark -- Publish Method

+ (void)showLoadingView:(UIView *)bgView
{
    MMLoadingView *_loadView=[MMLoadingView sharedInstance];
    if (bgView) {
        _loadView.alpha=0.0f;
        [bgView addSubview:_loadView];
        [UIView animateWithDuration:0.3 animations:^{
            _loadView.alpha=0.9f;
        } completion:^(BOOL finished) {
            _loadView.alpha=0.9f;
            [_loadView startAnimation];
        }];
    }else{
        UIWindow *window = UIApplication.sharedApplication.keyWindow;
        if (window != nil) {
            _loadView.alpha=0.0f;
            [window addSubview:_loadView];
            [UIView animateWithDuration:0.3 animations:^{
                _loadView.alpha=0.9f;
            } completion:^(BOOL finished) {
                _loadView.alpha=0.9f;
                // amimation
                [_loadView startAnimation];
            }];
        }
    }
}

+ (void)dismissView
{
    MMLoadingView *_loadView=[MMLoadingView sharedInstance];
    [_loadView stopAnimation];
    [UIView animateWithDuration:0.3 animations:^{
        _loadView.alpha=0.0f;
    } completion:^(BOOL finished) {
        [_loadView removeFromSuperview];
    }];
}

#pragma mark -- Private Method

- (void)startAnimation
{
    _imageView.animationDuration=0.9;
    _imageView.animationRepeatCount=0;
    [_imageView startAnimating];
}

- (void)stopAnimation
{
   [_imageView stopAnimating];
}
@end
