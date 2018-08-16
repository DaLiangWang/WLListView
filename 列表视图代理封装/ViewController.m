//
//  ViewController.m
//  列表视图代理封装
//
//  Created by 王亮 on 2018/8/16.
//  Copyright © 2018年 王亮. All rights reserved.
//

#import "ViewController.h"
#import "WLCollectionViewDelegate.h"

@interface ViewController ()<WLCollectionDelegate>{
    WLCollectionViewDelegate *data;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    data = [[WLCollectionViewDelegate alloc]initWithDelegate:self];
    
    data.viewModel = [WLBaseCollectionViewLayerModel new];
    //    用户数据
    WLBaseCollectionViewLayerSection *userInfo = [WLBaseCollectionViewLayerSection new];
    userInfo.type = @"userInfo";
    userInfo.insetForSection = UIEdgeInsetsMake(0, 0, 0, 0);
    userInfo.HorizontalSection = 0;
    userInfo.VerticalSection = 0;
    {
        WLBaseCollectionViewLayerRow *userInfoRow = [WLBaseCollectionViewLayerRow new];
        userInfoRow.type = @"userInfo";
        userInfoRow.data = [UIColor redColor];
        userInfoRow.cellSize = CGSizeMake(200, 100);
        [userInfo.item addObject:userInfoRow];
    }
    {
        WLBaseCollectionViewLayerRow *userInfoRow = [WLBaseCollectionViewLayerRow new];
        userInfoRow.type = @"userInfo";
        userInfoRow.data = [UIColor yellowColor];
        userInfoRow.cellSize = CGSizeMake(200, 100);
        [userInfo.item addObject:userInfoRow];
    }
    {
        WLBaseCollectionViewLayerRow *userInfoRow = [WLBaseCollectionViewLayerRow new];
        userInfoRow.type = @"userInfo";
        userInfoRow.data = [UIColor grayColor];
        userInfoRow.cellSize = CGSizeMake(200, 100);
        [userInfo.item addObject:userInfoRow];
    }
    [data.viewModel.viewLayer addObject:userInfo];
    
    
    UICollectionViewFlowLayout *Layout = [UICollectionViewFlowLayout new];
    [Layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    UICollectionView *cv = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 25, 200, 200) collectionViewLayout:Layout];
    
    cv.delegate = data;
    cv.dataSource = data;
    
    [self.view addSubview:cv];
    
}
-(UICollectionViewCell *)wl_collectionView:(UICollectionView *)collectionView
                                layerModel:(WLBaseCollectionViewLayerModel *)model
                             cellIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellT = @"1234";
    [collectionView registerClass:UICollectionViewCell.class forCellWithReuseIdentifier:cellT];
    
    UICollectionViewCell  *otherCell = [collectionView dequeueReusableCellWithReuseIdentifier:cellT forIndexPath:indexPath];
    UIColor *cel = [model getCellData:indexPath];
    otherCell.backgroundColor = cel;
    
    return otherCell;
}
-(void)wl_collectionView:(UICollectionView *)collectionView
              layerModel:(WLBaseCollectionViewLayerModel *)model
            didIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"12341234");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
