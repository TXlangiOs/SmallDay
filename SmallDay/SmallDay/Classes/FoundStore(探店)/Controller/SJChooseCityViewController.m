//
//  SJChooseCityViewController.m
//  SmallDay
//
//  Created by Vision on 16/7/7.
//  Copyright © 2016年 Vision. All rights reserved.
//

#import "SJChooseCityViewController.h"
#import "CityHeadCollectionReusableView.h"
@interface SJChooseCityViewController ()


/**顶部标题*/
@property(nonatomic,strong)NSArray *domesticCitys;

/**底部标题*/
@property(nonatomic,strong)NSArray *overseasCitys;


@end

@implementation SJChooseCityViewController

static NSString * const reuseIdentifier = @"Cell";

#pragma mark - 懒加载
- (NSArray *)domesticCitys {
    
    if (_domesticCitys == nil) {
        _domesticCitys = @[@"北京",@"上海", @"成都", @"广州", @"杭州", @"西安", @"重庆", @"厦门", @"台北"];
        
    }
    
    return _domesticCitys;
}

- (NSArray *)overseasCitys {
    
    if (_overseasCitys == nil) {
        _overseasCitys = @[@"罗马", @"迪拜", @"东京", @"巴黎", @"柏林", @"伦敦"];
    }
    return _overseasCitys;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = SJColor(247, 247, 247, 1);
    self.collectionView.alwaysBounceVertical = YES;
    
    [self setUpNav];
    
    [self registerContent];
    
    
    
}

// 注册
- (void)registerContent {
    
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView registerClass:[CityHeadCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headV"];
    
}


#pragma mark - 设置导航条
- (void)setUpNav {
    
    self.title = @"选择城市";
 
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:0 target:self action:@selector(clickCancle)];
    
}

- (void)clickCancle {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


- (instancetype)init {
    // 设置布局
    UICollectionViewFlowLayout *layout = ({
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
        //初始化colletionView的布局
        CGFloat itemW = SJscreenW / 3.0 - 1.0;
        CGFloat itemH = 50;
        
        // cell的大小
        layout.itemSize = CGSizeMake(itemW, itemH);
        layout.minimumLineSpacing = 1;
        layout.minimumInteritemSpacing = 1;
        //每个headView的大小
        layout.headerReferenceSize = CGSizeMake(SJscreenW, 60);

        layout;
    });
    
    //layout.sectionInset = UIEdgeInsetsMake(20, 0, 20,0);
    return [super initWithCollectionViewLayout:layout];
}


#pragma mark <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 2;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return self.domesticCitys.count;
    }
    return self.overseasCitys.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
       CityHeadCollectionReusableView *headV = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headV" forIndexPath:indexPath];
        
        if (indexPath.section == 0) {
            headV.titleContent= @"国内城市";
        } else {
            headV.titleContent = @"国外城市";
        }
        return headV;
        
    }else {
        return nil;
    }
}



/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
