//
//  SJExperienceViewController.m
//  SmallDay
//
//  Created by Vision on 16/7/7.
//  Copyright © 2016年 Vision. All rights reserved.
//

#import "SJExperienceViewController.h"

@interface SJExperienceViewController ()

@end

@implementation SJExperienceViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
   self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype)init {
    UICollectionViewFlowLayout *fL = [[UICollectionViewFlowLayout alloc] init];
    
    //初始化colletionView的布局
    CGFloat itemW = SJscreenW / 3.0 - 1.0;
    CGFloat itemH = 50;
    
    // cell的大小
    fL.itemSize = CGSizeMake(itemW, itemH);
    fL.minimumLineSpacing = 1;
    fL.minimumInteritemSpacing = 1;
    //每个headView的大小
    fL.headerReferenceSize = CGSizeMake(SJscreenW, 60);
    
    //fL.sectionInset = UIEdgeInsetsMake(20, 0, 20,0);
    return [super initWithCollectionViewLayout:fL];
    
}


#pragma mark <UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>


@end
