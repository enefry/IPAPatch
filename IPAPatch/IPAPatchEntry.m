//
//  IPAPatchEntry.m
//  IPAPatch
//
//  Created by wutian on 2017/3/17.
//  Copyright © 2017年 Weibo. All rights reserved.
//

#import "IPAPatchEntry.h"
#import <UIKit/UIKit.h>

#if __has_include("FLEXManager.h")
#import "FLEXManager.h"
#define FLEXEnable 1
#else
#define FLEXEnable 0
#endif

#if FLEXEnable
@interface UIWindow(share)
@end

@implementation UIWindow(share)

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (event.type == UIEventTypeMotion && event.subtype == UIEventSubtypeMotionShake) {
        NSLog(@"Laboratory 摇晃了手机");
        [[FLEXManager sharedManager] showExplorer];
    }
}

@end
#endif

@implementation IPAPatchEntry

+ (void)load
{
    // DO YOUR WORKS...
    
    // For Example:
    [self for_example_showAlert];
}

+ (void)for_example_showAlert
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"Hacked" message:@"Hacked with IPAPatch" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:NULL]];
        UIViewController * controller = [UIApplication sharedApplication].keyWindow.rootViewController;
        while (controller.presentedViewController) {
            controller = controller.presentedViewController;
        }
        [controller presentViewController:alertController animated:YES completion:NULL];
    });
}

@end
