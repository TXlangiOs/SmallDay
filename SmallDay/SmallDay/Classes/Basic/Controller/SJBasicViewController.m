//
//  SJBasicViewController.m
//  SmallDay
//
//  Created by Vision on 16/7/7.
//  Copyright © 2016年 Vision. All rights reserved.
//

#import "SJBasicViewController.h"

@interface SJBasicViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
/**底部视图*/
@property(nonatomic,weak)UICollectionView *bottomView;

/**顶部视图*/
@property(nonatomic,weak)UIScrollView *topView;

/**下划线*/
@property(nonatomic,weak)UIView *underLine;

/**标题按钮数组*/
@property(nonatomic,strong)NSMutableArray *titleButtons;

/**选中按钮*/
@property(nonatomic,weak)UIButton *selecteButton;

/**记录*/
@property(nonatomic,assign)BOOL isInital;

@end

@implementation SJBasicViewController
static NSString * const ID = @"CELL";

#pragma mark - 懒加载
- (NSMutableArray *)titleButtons {
    
    if (_titleButtons == nil) {
        _titleButtons = [NSMutableArray array];
    }
    return _titleButtons;
}

#pragma mark - view加载完成
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置不要额外滚动区域
    self.automaticallyAdjustsScrollViewInsets = NO;
    

    [self setUpBottomView];
    
    [self setUpTopView];
    
}

#pragma mark - 当前View即将显示 当子类和现在的View 加载完，会调用
- (void)viewWillAppear:(BOOL)animated {
    
    // 当前对象调用夫类 :viewWillAppear方法
    [super viewWillAppear:animated];
    
    
    if (_isInital == NO ) {
        
        // 设置顶部视图标题
        [self setUpTopViewTitle];
        
        _isInital = YES;
    }
    
    
}


#pragma mark - 设置底部视图
- (void)setUpBottomView {
    // 创建流水布局
    UICollectionViewFlowLayout *flowLayout = ({
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.itemSize = [UIScreen mainScreen].bounds.size;
        // 设置滚动方向
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        // 清除间距
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout;
    });
    
    
    // 创建collectView
    UICollectionView *collectView = ({
        UICollectionView *collectView = [[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:flowLayout];
        collectView.backgroundColor = [UIColor whiteColor];
        // 设置代理
        collectView.delegate = self;
        collectView.dataSource = self;
        // 注册cell
        [collectView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
        // 隐藏水平指示器
        collectView.showsHorizontalScrollIndicator = NO;
        // 启动分页功能
        collectView.pagingEnabled = YES;
        collectView.scrollsToTop = NO;
        _bottomView = collectView;
        collectView;
    });
    
    [self.view addSubview:collectView];
    
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.childViewControllers.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    // 清除之前的子控制器的View
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    
    // 添加 对应的子控制器View
    UIViewController *vc = self.childViewControllers[indexPath.row];
    
    // 设置对应的子控制器View的Fram：否则会有默认的Y值20
    vc.view.frame = [UIScreen mainScreen].bounds;
    
    [cell.contentView addSubview:vc.view];
    
    return cell;
    
}

#pragma mark - 设置顶部视图
- (void)setUpTopView {
    // 顶部视图
    UIScrollView *topView = ({
        
        UIScrollView *topView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 120, 44)];
        topView.scrollsToTop = NO;
        topView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.8];
        self.navigationItem.titleView = topView;
        topView;
    });
    _topView = topView;
}

#pragma mark - 设置顶部视图标题
- (void) setUpTopViewTitle {
    // 顶部视图按钮
    NSInteger count = self.childViewControllers.count;
    CGFloat X = 0;
    CGFloat W = _topView.sj_width / count;
    CGFloat H = _topView.sj_height;
    for (int i = 0; i< count; i++) {
        UIButton *titleBut = [UIButton buttonWithType:UIButtonTypeCustom];
        X = i *W;
        titleBut.frame = CGRectMake(X, 0, W, H);
        UIViewController *vc = self.childViewControllers[i];
        
        [titleBut setTitle:vc.title forState:UIControlStateNormal];
        titleBut.titleLabel.font = [UIFont systemFontOfSize:20];
        [titleBut setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [titleBut setTitleColor:[UIColor blackColor]
                       forState:UIControlStateSelected];
        titleBut.tag = i;
        [titleBut addTarget:self action:@selector(clickBut:) forControlEvents:UIControlEventTouchUpInside ];
        [_topView addSubview:titleBut];
        
        [self.titleButtons addObject:titleBut];
        
        if (i==0) {
            [self clickBut:titleBut];
            
            // 添加 下划线
            UIView *underLine = [[UIView alloc]init];
            underLine.backgroundColor = SJColor(60, 60, 60, 1);
            [titleBut.titleLabel sizeToFit];
            underLine.sj_width = titleBut.titleLabel.sj_width;
            underLine.sj_height = 2;
            underLine.sj_y = _topView.sj_height - underLine.sj_height;
            underLine.sj_centerX = titleBut.sj_centerX;
            [self.topView addSubview:underLine];
            _underLine = underLine;
            
            // 添加 分割线
            UIView *separatorLine = [[UIView alloc]init];
            separatorLine.backgroundColor = SJColor(50, 50, 50, 0.3);
            separatorLine.sj_width = 1.2;
            separatorLine.sj_height = titleBut.titleLabel.sj_height;
            separatorLine.sj_centerY = titleBut.sj_centerY;
            separatorLine.sj_centerX = _topView.sj_width *0.5 - 1;
            [self.topView addSubview:separatorLine];
            
        }
    }
}

#pragma mark - 点击按钮
- (void)clickBut:(UIButton *)sender {
    [self selectedButton:sender];
    // 设置底部视图偏移量
    CGFloat offsetX = sender.tag * SJscreenW;
    _bottomView.contentOffset = CGPointMake(offsetX, 0);
    
}

#pragma mark - 选中按钮
- (void)selectedButton:(UIButton *)button {
    // 设置按钮状态
    _selecteButton.selected = NO;
    button.selected = YES;
    _selecteButton = button;
    
    // 设置下划线位置
    [UIView animateWithDuration:0.2 animations:^{
        _underLine.sj_centerX = button.sj_centerX;
    }];
}


#pragma make - UICollectionViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 获取页码
    NSUInteger page = scrollView.contentOffset.x / SJscreenW;
    
    // 获取对应的标题按钮
    UIButton *But = _titleButtons[page];
    
    // 设置选中按钮
    [self selectedButton:But];
}



@end
