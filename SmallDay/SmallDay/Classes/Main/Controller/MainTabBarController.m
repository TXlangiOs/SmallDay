//
//  MainTabBarController.m
//  SmallDay
//
//  Created by Vision on 16/7/7.
//  Copyright © 2016年 Vision. All rights reserved.
//

#import "MainTabBarController.h"
#import "SJFoundStoreViewController.h"
#import "SJExperienceViewController.h"
#import "SJWriteViewController.h"
#import "SJClassifViewController.h"
#import "SJMineViewController.h"
#import "SJNavigationController.h"
@interface MainTabBarController ()


@property (nonatomic, strong) SJWriteViewController *writeVC;

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addAllChildViewController];
    
    [self setUpTabBar];
    
}

//在View显示完毕时, 添加按钮,覆盖在底部按钮之上.
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    //创建添加按钮
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addBtn setImage:[UIImage imageNamed:@"btn_card"] forState:UIControlStateNormal];
    CGFloat btnWH = 98;
    
    //按钮剧中显示
    addBtn.frame = CGRectMake((SJscreenW - btnWH) * 0.5,-32, btnWH, btnWH);
    [self.tabBar addSubview:addBtn];
    //监听按钮点击
    [addBtn addTarget:self action:@selector(addBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
}

//添加按钮点击
- (void)addBtnClick {
    
    SJWriteViewController *writeVC = [[SJWriteViewController alloc] init];
    self.writeVC = writeVC;
    __weak typeof(self) weakSelf = self;
    writeVC.closeTask = ^{
        weakSelf.writeVC = nil;
    };
    [[UIApplication sharedApplication].keyWindow addSubview:writeVC.view];
    
}



#pragma mark - 设置tabBar
- (void)setUpTabBar {
    
    
    self.tabBar.tintColor = [UIColor blackColor];
    self.tabBar.translucent = NO;
    self.tabBar.backgroundImage = [UIImage imageNamed:@"bar"];
    
    // 创建背景图片
    UIImageView *imageV = [[UIImageView alloc] init];
    imageV.image = [UIImage imageNamed:@"tabbar_bg"];
    [imageV setContentMode:UIViewContentModeCenter];
    imageV.frame = CGRectMake(0, -8, self.tabBar.sj_width, self.tabBar.sj_height);
    
    // 把图片添加到tabBar底部
    [self.tabBar insertSubview:imageV atIndex:0];
    
    // 去掉系统tabBar的线
    [self.tabBar setShadowImage:[UIImage imageWithColor:[UIColor clearColor]]];
    [self.tabBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]]];
    
    
}



#pragma mark - 添加所有的子控制器
- (void)addAllChildViewController {
    
    // 探店
    SJFoundStoreViewController * fvc = [[SJFoundStoreViewController alloc]init];
    [self addOneChildVc:fvc image:[UIImage imageNamed:@"recommendation_1"] selImage:[UIImage imageNamed:@"recommendation_2"] title:@"探店"];
    
    // 体验
    
    SJExperienceViewController * evc = [[SJExperienceViewController alloc]init];
    [self addOneChildVc:evc image:[UIImage imageNamed:@"broadwood_1"] selImage:[UIImage imageNamed:@"broadwood_2"] title:@"体验"];
    
    [self addOneChildVc:[[UIViewController alloc]init] image:nil selImage:nil title:nil];
    
    // 分类
    SJClassifViewController * cvc = [[ SJClassifViewController alloc]init];
    [self addOneChildVc:cvc image:[UIImage imageNamed:@"classification_1"] selImage:[UIImage imageNamed:@"classification_2"] title:@"分类"];
    

    // 我的
    SJMineViewController * mvc = [[SJMineViewController alloc]init];
    [self addOneChildVc:mvc  image:[UIImage imageNamed:@"my_1"] selImage:[UIImage imageNamed:@"my_2"] title:@"我的"];
    
}

// 添加一个子控制器
- (void)addOneChildVc:(UIViewController *)vc image:(UIImage *)image selImage:(UIImage *)selImage title:(NSString *)title
{
    
    // 包装导航控制器
    SJNavigationController *nav = [[SJNavigationController alloc] initWithRootViewController:vc];
    
    // 设置TabBar内容
    nav.tabBarItem.title  = title;
    nav.tabBarItem.image = image;
    nav.tabBarItem.selectedImage = selImage;
    
    // 添加子控制器
    [self addChildViewController:nav];
}





@end
