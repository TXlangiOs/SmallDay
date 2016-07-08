//
//  SJChooseCityViewController.m
//  SmallDay
//
//  Created by Vision on 16/7/7.
//  Copyright © 2016年 Vision. All rights reserved.
//

#import "SJChooseCityViewController.h"
#import "CityHeadCollectionReusableView.h"
#import "CityFootCollectionReusableView.h"
#import "SJChooseCityCollectionViewCell.h"
@interface SJChooseCityViewController ()


/**顶部标题*/
@property(nonatomic,strong)NSArray *domesticCitys;

/**底部标题*/
@property(nonatomic,strong)NSArray *overseasCitys;

/**属性*/
@property(nonatomic,weak)SJChooseCityCollectionViewCell *selectCell;


@end

@implementation SJChooseCityViewController

static NSString * const reuseIdentifier = @"Cell";

#pragma mark - 懒加载
- (NSArray *)domesticCitys {
    
    if (_domesticCitys == nil) {
        _domesticCitys = @[@"北京",@"上海", @"成都", @"广州", @"杭州", @"西安", @"重庆",@"厦门", @"台北",];
        
    }
    
    return _domesticCitys;
}

- (NSArray *)overseasCitys {
    
    if (_overseasCitys == nil) {
        _overseasCitys = @[@"罗马", @"迪拜", @"东京", @"巴黎", @"柏林", @"伦敦"];
    }
    return _overseasCitys;
}

- (NSString *)SD_Current_SelectedCity {
    
    if (_SD_Current_SelectedCity == nil) {
        
       _SD_Current_SelectedCity = @"SD_Current_SelectedCity";
    }
    
    return _SD_Current_SelectedCity;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = SJColor(247, 247, 247, 1);
    self.collectionView.alwaysBounceVertical = YES;
    
    [self setUpNav];
    
    [self registerContent];
    
    
    
}

#pragma mark - 注册
- (void)registerContent {
    
    [self.collectionView registerClass:[SJChooseCityCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView registerClass:[CityHeadCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headV"];
    
    [self.collectionView registerClass:[CityFootCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footV"];
    
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


#pragma mark UICollectionViewDataSource数据源
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
    SJChooseCityCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    
    if (indexPath.section == 0) {
        
        cell.cityname = _domesticCitys[indexPath.item];
        return cell;
    }
    cell.cityname = _overseasCitys[indexPath.item];
    
    return cell;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if ([kind isEqualToString:UICollectionElementKindSectionFooter] && indexPath.section == 1) {
    CityFootCollectionReusableView *footV = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footV" forIndexPath:indexPath];
       
        footV.titleContent = @"更多城市,敬请期待...";
        return footV;
    }
    
    
    
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

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    
    if (section == 0) {
        return CGSizeZero;
    }
    return CGSizeMake(SJscreenW, 60);
    
}


#pragma mark <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    /*
    // 取出当前cell
    SJChooseCityCollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setObject:cell.cityname forKey:self.SD_Current_SelectedCity];
    
    [user synchronize];
    [[NSNotificationCenter defaultCenter] postNotificationName:self.SD_Current_SelectedCity object:cell.cityname];    */
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
 
    
    
}



//- (void)selectItem:(SJChooseCityCollectionViewCell *)cell {
//    
//    _selectCell.textcolor = [UIColor blackColor];
//    cell.textcolor = [UIColor redColor];
//    _selectCell = cell;
//    
//    
//}





@end
