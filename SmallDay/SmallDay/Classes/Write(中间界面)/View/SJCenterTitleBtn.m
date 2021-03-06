//
//  SJCenterTitleBtn.m
//  SmallDay
//
//  Created by Vision on 16/7/7.
//  Copyright © 2016年 Vision. All rights reserved.
//

#import "SJCenterTitleBtn.h"

@implementation SJCenterTitleBtn

+ (instancetype)centerTitleBtnWithImageName:(NSString *)imageN titleName:(NSString *)title {
    
    SJCenterTitleBtn *centerBtn =  [[self alloc] init];
    centerBtn.imageName = imageN;
    centerBtn.title = title;
    
    return centerBtn;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //初始化按钮属性
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return self;
}

// 设置标题
- (void)setTitle:(NSString *)title
{
    _title = title;
    
    [self setTitle:title forState:UIControlStateNormal];
}
// 设置图片
- (void)setImageName:(NSString *)imageName
{
    _imageName = imageName;
    
    [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
}

// 设置按钮当中图片的位置
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat x = contentRect.size.width * 0.2;
    CGFloat y = contentRect.size.height * 0.15;
    CGFloat w = contentRect.size.width - x * 2;
    CGFloat h = contentRect.size.height * 0.5;
    CGRect rect = CGRectMake(x, y, w, h);
    return rect;
}

// 设置按钮当中标题的位置
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat x = 0;
    CGFloat y = contentRect.size.height * 0.65;
    CGFloat w = contentRect.size.width;
    CGFloat h = contentRect.size.height * 0.3;
    CGRect rect = CGRectMake(x, y, w, h);
    return rect;
}

@end
