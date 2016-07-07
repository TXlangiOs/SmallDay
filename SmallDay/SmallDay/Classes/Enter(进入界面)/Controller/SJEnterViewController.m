//
//  SJEnterViewController.m
//  SmallDay
//
//  Created by Vision on 16/7/7.
//  Copyright © 2016年 Vision. All rights reserved.
//

#import "SJEnterViewController.h"
#import "SJEnterButton.h"
#import "MainTabBarController.h"
@interface SJEnterViewController ()
@property(nonatomic,assign)NSInteger index;

@property(nonatomic,weak)UIImageView *imageView;
@end

@implementation SJEnterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加子控件
    [self setUpSubView];
    
    // 添加转场动画
    [self addCATransitionAnimation];
    


}

#pragma mark - 添加子控件
- (void)setUpSubView {
    
    // 图片
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.frame = self.view.bounds;
    imageView.image = [UIImage imageNamed:@"page0"];
    [self.view addSubview:imageView];
    self.imageView = imageView;
    
    // 微信
    CGFloat butY = SJscreenH * 0.85;
    CGFloat butH = 32;
    SJEnterButton *wwechatBut = [SJEnterButton buttonWithType:UIButtonTypeCustom];
    
    [wwechatBut setBackgroundImage:[UIImage imageNamed:@"wwechat"] forState:UIControlStateNormal];
    [wwechatBut setTitle:@"微信登录" forState:UIControlStateNormal];
    wwechatBut.titleLabel.font = [UIFont systemFontOfSize:14];
    [wwechatBut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [wwechatBut sizeToFit];
    
    CGFloat butW = wwechatBut.sj_width;
    CGFloat wweButX = SJscreenW * 0.5 - butW - 20;
    
    wwechatBut.frame = CGRectMake(wweButX, butY, butW , butH );
    
    
    // 微博
    SJEnterButton *wweiboBut = ({
        
        SJEnterButton *wweiboBut = [SJEnterButton buttonWithType:UIButtonTypeCustom];
        
        [wweiboBut setBackgroundImage:[UIImage imageNamed:@"wweibo"] forState:UIControlStateNormal];
        [wweiboBut sizeToFit];
        [wweiboBut setTitle:@"微博登录" forState:UIControlStateNormal];
        wweiboBut.titleLabel.font = [UIFont systemFontOfSize:14];
        [wweiboBut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        CGFloat wweiboButX = SJscreenW * 0.5 + 20;
        wweiboBut.frame = CGRectMake(wweiboButX, butY, butW , butH );
        wweiboBut;
    });
    
    
    // 底部标题按钮
    UIButton *titleBut = ({
        UIButton *titleBut = [UIButton buttonWithType:UIButtonTypeCustom];
        [titleBut setTitle:@"暂不登录，进入小日子" forState:UIControlStateNormal];
        [titleBut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [titleBut setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        [titleBut sizeToFit];
        titleBut.sj_x = SJscreenW * 0.5 - titleBut.sj_width * 0.5;
        titleBut.sj_y = CGRectGetMaxY(wwechatBut.frame) + 7;
        titleBut.titleLabel.font = [UIFont systemFontOfSize:14];
        [titleBut addTarget:self action:@selector(jumpUpMain) forControlEvents:UIControlEventTouchUpInside];
        titleBut;
    });
    
    
    [self.view addSubview:wwechatBut];
    [self.view addSubview:wweiboBut];
    [self.view addSubview:titleBut];
    
    
}

// 跳转主框架
- (void)jumpUpMain {
  
    MainTabBarController *mv = [[MainTabBarController alloc]init];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = mv;
}


#pragma mark - 添加转场动画
- (void)addCATransitionAnimation {
    
    _index = 1;
    
    [NSTimer scheduledTimerWithTimeInterval:2.3 target:self selector:@selector(addImageAnimation) userInfo:nil repeats:YES];
}


- (void)addImageAnimation {
    
    if (self.index == 3) _index = 0;
    
    NSString * iconimage = [NSString stringWithFormat:@"page%ld",_index];
    
    self.imageView.image = [UIImage imageNamed:iconimage];
    
    //添加动画效果
    CATransition * aim = [CATransition animation];
    //设置属性
    aim.type = @"fade";
    //添加动画
    [self.imageView.layer addAnimation:aim forKey:nil];
    
    
    self.index ++;
    
}

@end
