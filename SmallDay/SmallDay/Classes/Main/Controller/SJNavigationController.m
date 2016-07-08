//
//  SJNavigationController.m
//  SmallDay
//
//  Created by Vision on 16/7/7.
//  Copyright © 2016年 Vision. All rights reserved.
//

#import "SJNavigationController.h"

@interface SJNavigationController ()

@end

@implementation SJNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.tintColor = [UIColor blackColor];
}

#pragma make - 统一设置全局背景图,字体大小
+(void)load {
    // 获取全局当前类的navigationBar
    UINavigationBar *NavBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    // 设置背景图
    [NavBar setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    
    // 设置字体大小
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    dic[NSFontAttributeName] = [UIFont systemFontOfSize:17];
    
    [NavBar setTitleTextAttributes:dic];
    
}





@end
