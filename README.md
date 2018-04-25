# LoadingView
自定义LoadView 和对MBProgressHUd进行二次封装。避免因MBProgressHUd的版本变化而改动大量代码！
```
HUD
+ (void)showLoadingWithView:(UIView *)view;

+ (void)showLoadingWithView:(UIView *)view title:(NSString *)title;

+ (void)showAlertWithView:(UIView *)view title:(NSString *)title;

+ (void)showAlertWithErrorView:(UIView *)view title:(NSString *)title;

+ (void)showAlertWithSuccessView:(UIView *)view title:(NSString *)title;

+ (void)hideLoadingWithView:(UIView *)view;
```

```
自定义 LoadingView
+ (void)showLoadingView:(UIView *)bgView;
+ (void)showLaodingView:(UIView *)bgView title:(NSString *)title;
+ (void)hideLoadingView;

```
