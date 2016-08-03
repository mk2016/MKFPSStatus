# MKFPSStatus


####用于显示当前的FPS,给app性能提供直观的显示，为app的UI性能优化提供参考。

###用法
```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //other code
#ifdef DEBUG
    [[MKFPSStatus sharedInstance] open];
#endif
    return YES;
}
```
 ![image](https://github.com/mk2016/MKFPSStatus/raw/master/Screenshots/0.png)
 ![image](https://github.com/mk2016/MKFPSStatus/raw/master/Screenshots/1.png)