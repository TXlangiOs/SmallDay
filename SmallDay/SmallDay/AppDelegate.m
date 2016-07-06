//
//  AppDelegate.m
//  SmallDay
//
//  Created by Vision on 16/7/6.
//  Copyright © 2016年 Vision. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "SJTabBarController.h"
#import "SJNewFeatureViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    [self setupWindows];
    
    
    return YES;
}

#pragma mark - 设置窗口
- (void)setupWindows {
    
    self.window = [[UIWindow alloc]initWithFrame:SJscreenBounds];
    
    SJNewFeatureViewController *vc = [[SJNewFeatureViewController alloc]init];
    self.window.rootViewController = vc;
    
    [self.window makeKeyAndVisible];
    
    
}
@end
