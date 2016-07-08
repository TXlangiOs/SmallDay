//
//  SJFoundStoreViewController.m
//  SmallDay
//
//  Created by Vision on 16/7/7.
//  Copyright © 2016年 Vision. All rights reserved.
//

#import "SJFoundStoreViewController.h"
#import "BeautySkyViewController.h"
#import "BeautyEditViewController.h"
#import "SJChooseCityViewController.h"
#import "SJNavigationController.h"
@interface SJFoundStoreViewController ()




@end

@implementation SJFoundStoreViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildViewController];
    
    [self setUpNav];
    
}
#pragma make - 添加子控制器
- (void)addChildViewController {
    
    // 美天
    BeautySkyViewController *svc = [[BeautySkyViewController alloc]init];
    svc.title = @"美天";
    [self addChildViewController:svc];
    
    // 美辑
    BeautyEditViewController *evc = [[BeautyEditViewController alloc]init];
    evc.title = @"美辑";
    [self addChildViewController:evc];
}


#pragma mark - 设置导航条内容
- (void)setUpNav {
    
    // 左侧内容
    UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom ];
    [but setTitle:@"罗马" forState:UIControlStateNormal];
    [but setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [but setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [but setImage:[UIImage imageNamed:@"home_down"] forState:UIControlStateNormal];
    but.titleLabel.font = [UIFont systemFontOfSize:17];
    [but sizeToFit];
    [but addTarget:self action:@selector(clickChooseCityBut) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *leftView = [[UIView alloc]init];
    leftView.sj_width = but.sj_width;
    leftView.sj_height = but.sj_height;
    
    [leftView addSubview:but];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftView];
    
    //右侧内容
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"附近" style:0 target:self action:@selector(nearClick)];
}


#pragma mark - 点击左边按钮
- (void)clickChooseCityBut {
    
    SJChooseCityViewController *chooseVc = [[SJChooseCityViewController alloc]init];
    
    SJNavigationController *nav = [[SJNavigationController alloc]initWithRootViewController:chooseVc];
    
    [self presentViewController:nav animated:YES completion:nil];
    
}

#pragma mark - 点击左边按钮
- (void)nearClick {
   
    
    
}




@end
