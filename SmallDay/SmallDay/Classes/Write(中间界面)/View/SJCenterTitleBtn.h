//
//  SJCenterTitleBtn.h
//  SmallDay
//
//  Created by Vision on 16/7/7.
//  Copyright © 2016年 Vision. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SJCenterTitleBtn : UIButton
//图片名称
@property (nonatomic, copy) NSString *imageName;
//标题
@property (nonatomic, copy) NSString *title;


+ (instancetype)centerTitleBtnWithImageName:(NSString *)imageN titleName:(NSString *)title;
@end
