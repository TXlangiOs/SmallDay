//
//  UIView+Frame.m
//  SmallDay
//
//  Created by Vision on 16/7/6.
//  Copyright © 2016年 Vision. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)


- (void)setSj_x:(CGFloat)sj_x
{
    CGRect frame = self.frame;
    frame.origin.x = sj_x;
    self.frame = frame;
    
}

- (CGFloat)sj_x {
    
    return self.frame.origin.x;
}

- (void)setSj_y:(CGFloat)sj_y
{
    CGRect frame = self.frame;
    frame.origin.y = sj_y;
    self.frame = frame;
}

- (CGFloat)sj_y {
    
    return self.frame.origin.y;
}

- (void)setSj_width:(CGFloat)sj_width
{
    CGRect frame = self.frame;
    frame.size.width = sj_width;
    self.frame = frame;
    
}

- (CGFloat)sj_width
{
    
    return self.frame.size.width;
    
}

- (void)setSj_height:(CGFloat)sj_height
{
    CGRect frame = self.frame;
    frame.size.height = sj_height;
    self.frame = frame;
    
}

- (CGFloat)sj_height
{
    return self.frame.size.height;
}


- (void)setSj_centerX:(CGFloat)sj_centerX
{
    CGPoint center = self.center;
    center.x = sj_centerX;
    self.center = center;
    
}

- (CGFloat)sj_centerX
{
    return self.center.x;
}

- (void)setSj_centerY:(CGFloat)sj_centerY
{
    CGPoint center = self.center;
    center.y = sj_centerY;
    self.center = center;
    
}

- (CGFloat)sj_centerY
{
    return self.center.y;
}


@end
