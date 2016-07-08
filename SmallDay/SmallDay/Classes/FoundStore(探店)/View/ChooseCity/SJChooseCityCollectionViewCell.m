//
//  SJChooseCityCollectionViewCell.m
//  SmallDay
//
//  Created by Vision on 16/7/8.
//  Copyright © 2016年 Vision. All rights reserved.
//

#import "SJChooseCityCollectionViewCell.h"
@interface SJChooseCityCollectionViewCell ()

/**文本*/
@property(nonatomic,weak)UILabel *lable;

@end

@implementation SJChooseCityCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    
    if (self = [super initWithFrame:frame]) {
        
        UILabel *label = ({
        
            UILabel *label = [[UILabel alloc]init];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor blackColor];
            label.highlightedTextColor = [UIColor redColor];
            label.font = [UIFont systemFontOfSize:18];
            _lable = label;
            label;
        });
        
        [self.contentView addSubview:label];
        
        
    }
    
    return self;
    
}


- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    _lable.frame = self.bounds;
    
    
}

- (void)setCityname:(NSString *)cityname {
    
    _cityname = cityname;
    _lable.text = cityname;
    
    
}

//- (void)setItemContent:(NSString *)itemContent {
//    
//    _itemContent = itemContent;
//    
//    _lable.text = itemContent;
//    
//}


-(void)setTextcolor:(UIColor *)textcolor {
    
    _textcolor = textcolor;
    _lable.textColor = textcolor;
    
    
}
//- (void)setFrame:(CGRect)frame {
//    
//    frame.origin.x -=1;
//    frame.origin.y -=1;
//    frame.size.width -=1;
//    frame.size.height -=1;
//
//    
//    [super setFrame:frame];
//}



@end

