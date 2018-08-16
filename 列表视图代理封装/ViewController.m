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
    
    //    用户数据
    WLBaseCollectionViewLayerSection *userInfo = [WLBaseCollectionViewLayerSection new];
    userInfo.type = @"userInfo";
    
    userInfo.headerSize = CGSizeMake(10, 30);
    userInfo.headerData = [UIColor orangeColor];
    
    userInfo.footSize = CGSizeMake(10, 30);
    userInfo.footData = [UIColor redColor];
    
    {
        WLBaseCollectionViewLayerRow *userInfoRow = [WLBaseCollectionViewLayerRow new];
        userInfoRow.type = @"userInfo";
        userInfoRow.data = [UIColor redColor];
        userInfoRow.cellSize = CGSizeMake(100, 100);
        [userInfo.item addObject:userInfoRow];
    }
    {
        WLBaseCollectionViewLayerRow *userInfoRow = [WLBaseCollectionViewLayerRow new];
        userInfoRow.type = @"userInfo";
        userInfoRow.data = [UIColor yellowColor];
        userInfoRow.cellSize = CGSizeMake(100, 100);
        [userInfo.item addObject:userInfoRow];
    }
    [data.viewModel.viewLayer addObject:userInfo];
    
    
    UICollectionViewFlowLayout *Layout = [UICollectionViewFlowLayout new];
    [Layout setScrollDirection:UICollectionViewScrollDirectionVertical];
//    [Layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];

    UICollectionView *cv = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 25, 300, 250) collectionViewLayout:Layout];
    cv.backgroundColor = [UIColor colorWithWhite:0.5f alpha:.2f];
    cv.delegate = data;
    cv.dataSource = data;
    
    [self.view addSubview:cv];
    
}
//cell创建
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
//头脚视图创建
- (UICollectionReusableView *)wl_collectionView:(UICollectionView *)collectionView
              viewForSupplementaryElementOfKind:(NSString *)kind
                              layersectionModel:(WLBaseCollectionViewLayerSection *)section
                                    atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *view = nil;
    NSString *type = section.type;
    if ([type isEqualToString:@"userInfo"]){
        static NSString *cellT = @"ssss1234";
        [collectionView registerClass:UICollectionReusableView.class forSupplementaryViewOfKind:kind withReuseIdentifier:cellT];
        view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:cellT forIndexPath:indexPath];

        view.backgroundColor = [kind isEqualToString:UICollectionElementKindSectionHeader]?section.headerData:section.footData;
    }
    return view;
}

//cell点击
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
