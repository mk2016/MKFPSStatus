//
//  MKFPSStatus.m
//  MKFPSStatus
//
//  Created by xiaomk on 16/6/27.
//  Copyright © 2016年 MK. All rights reserved.
//

#import "MKFPSStatus.h"

@implementation MKFPSStatus{
    CADisplayLink   *_displayLink;
    NSTimeInterval  _lastTime;
    NSUInteger      _count;
    CATextLayer     *_fpsTextLayer;
}

+ (instancetype)sharedInstance {
    static MKFPSStatus *sharedInstance = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedInstance = [[MKFPSStatus alloc] init];
    });
    return sharedInstance;
}

- (id)init{
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(applicationDidBecomeActiveNotification)
                                                     name: UIApplicationDidBecomeActiveNotification
                                                   object: nil];
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(applicationWillResignActiveNotification)
                                                     name: UIApplicationWillResignActiveNotification
                                                   object: nil];
        
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkTick:)];
        [_displayLink setPaused:YES];
        [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
        
        _fpsTextLayer = [CATextLayer layer];
        [_fpsTextLayer setFrame:CGRectMake(([[UIScreen mainScreen] bounds].size.width-50)/2+50, 3, 54, 16)];
        [_fpsTextLayer setFontSize: 13.0f];
        [_fpsTextLayer setContentsScale: [UIScreen mainScreen].scale];
        [_fpsTextLayer setForegroundColor: [UIColor greenColor].CGColor];
//        [_fpsTextLayer setBackgroundColor:[UIColor grayColor].CGColor];
        [_fpsTextLayer setBackgroundColor:[UIColor clearColor].CGColor];
        [_fpsTextLayer setAlignmentMode:kCAAlignmentCenter];
    }
    return self;
}

- (void)displayLinkTick:(CADisplayLink *)link {
    if (_lastTime == 0) {
        _lastTime = link.timestamp;
        return;
    }
    
    _count++;
    NSTimeInterval interval = link.timestamp - _lastTime;
    if (interval < 1) return;
    _lastTime = link.timestamp;
    float fps = _count / interval;
    _count = 0;
    
    NSString *text = [NSString stringWithFormat:@"%d FPS",(int)round(fps)];
    [_fpsTextLayer setString: text];
    
    CGFloat progress = fps / 60.0;
    UIColor *color = [UIColor colorWithHue:0.27 * (progress - 0.2) saturation:1 brightness:0.9 alpha:1];
    [_fpsTextLayer setForegroundColor:color.CGColor];
}

- (void)applicationDidBecomeActiveNotification {
    [_displayLink setPaused:NO];
}

- (void)applicationWillResignActiveNotification {
    [_displayLink setPaused:YES];
}

//- (void)becomeKeyWindow {
//    //prevent self to be key window
//    [self setHidden: YES];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self setHidden: NO];
//    });
//}

#pragma mark - ***** Open ******
- (void)open{
    [_fpsTextLayer removeFromSuperlayer];
    [[UIApplication sharedApplication].keyWindow.layer addSublayer:_fpsTextLayer];
    [_displayLink setPaused:NO];
}

- (void)openOnView:(UIView *)view frame:(CGRect)frame{
    [_fpsTextLayer removeFromSuperlayer];
    if (frame.size.width == 0 && frame.size.height == 0) {
        frame = CGRectMake(([[UIScreen mainScreen] bounds].size.width-50)/2+50, 3-20, 54, 16);
    }
    [view.layer addSublayer:_fpsTextLayer];
    _fpsTextLayer.frame = frame;
    [_displayLink setPaused:NO];
}

- (void)close{
    [_displayLink setPaused:YES];
    [_fpsTextLayer removeFromSuperlayer];
}

- (void)dealloc{
    [_displayLink setPaused:YES];
    [_displayLink removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
