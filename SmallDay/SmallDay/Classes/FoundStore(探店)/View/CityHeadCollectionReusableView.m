//
//  CityHeadCollectionReusableView.m
//  SmallDay
//
//  Created by Vision on 16/7/7.
//  Copyright © 2016年 Vision. All rights reserved.
//

#import "CityHeadCollectionReusableView.h"
@interface CityHeadCollectionReusableView ()

/**文本*/
@property(nonatomic,weak)UILabel *lable;

@end

@implementation CityHeadCollectionReusableView


- (instancetype)initWithFrame:(CGRect)frame {
    
    if ( self = [super initWithFrame:frame]) {
       
        UILabel *lable =  ({
            
            UILabel *lable = [[UILabel alloc]init];
            self.lable = lable;
            lable.textAlignment = NSTextAlignmentCenter;
            self.lable.textColor = [UIColor blackColor];
            self.lable.font = [UIFont systemFontOfSize:20];
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
