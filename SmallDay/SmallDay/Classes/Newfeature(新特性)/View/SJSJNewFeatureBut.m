//
//  SJSJNewFeatureBut.m
//  SmallDay
//
//  Created by Vision on 16/7/6.
//  Copyright © 2016年 Vision. All rights reserved.
//

#import "SJSJNewFeatureBut.h"

@implementation SJSJNewFeatureBut

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    // 重新布置子控件
    
    // 设置文字
    [self.titleLabel sizeToFit];

    self.titleLabel.sj_x  = self.sj_width - self.titleLabel.sj_width - 8;
    self.titleLabel.sj_centerY = self.bounds.size.height * 0.5;
    
}

@end
