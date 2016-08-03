# MKFPSStatus


####用于显示当前的FPS,给app性能提供直观的显示，为app的UI性能优化提供参考。

###导入
* pod 'MKFPSStatus', '~> 1.0.2'
* 将 MKFPSStatus 文件夹拖入你的项目中，#import "MKFPSStatus.h" 即可

###用法
在 appDelegate.m 中
```
#import "MKFPSStatus.h"

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //other code
#ifdef DEBUG
    [[MKFPSStatus sharedInstance] open];
#endif
    return YES;
}
```

###效果图
 ![image](https://github.com/mk2016/MKFPSStatus/raw/master/Screenshots/0.png)
 ![image](https://github.com/mk2016/MKFPSStatus/raw/master/Screenshots/1.png)