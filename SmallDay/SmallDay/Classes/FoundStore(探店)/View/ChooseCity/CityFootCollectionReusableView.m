//
//  CityFootCollectionReusableView.m
//  SmallDay
//
//  Created by Vision on 16/7/8.
//  Copyright © 2016年 Vision. All rights reserved.
//

#import "CityFootCollectionReusableView.h"
@interface CityFootCollectionReusableView ()

/**文本*/
@property(nonatomic,weak)UILabel *lable;

@end

@implementation CityFootCollectionReusableView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UILabel *lable =  ({
            
            UILabel *lable = [[UILabel alloc]init];
            self.lable = lable;
            lable.textAlignment = NSTextAlignmentCenter;
            self.lable.textColor = [UIColor blackColor];
            self.lable.font = [UIFont systemFontOfSize:16];
            lable;
        });
        
        [self addSubview:lable];
  
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.lable.frame = self.bounds;
}

- (void)setTitleContent:(NSString *)titleContent {
    
    _titleContent = titleContent;
    
    self.lable.text = titleContent;
    
}



@end
