//
//  WLCollectionView.h
//  链式语法
//
//  Created by 王亮 on 2018/8/16.
//  Copyright © 2018年 王亮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLBaseCollectionViewLayerModel.h"

@protocol WLCollectionDelegate <NSObject>

@required
//cell创建
-(UICollectionViewCell *)wl_collectionView:(UICollectionView *)collectionView
                                layerModel:(WLBaseCollectionViewLayerModel *)model
                             cellIndexPath:(NSIndexPath *)indexPath;

@optional
//头脚视图创建
- (UICollectionReusableView *)wl_collectionView:(UICollectionView *)collectionView
              viewForSupplementaryElementOfKind:(NSString *)kind
                              layersectionModel:(id)section
                                    atIndexPath:(NSIndexPath *)indexPath;
//点击cell的响应
- (void)wl_collectionView:(UICollectionView *)collectionView
               layerModel:(WLBaseCollectionViewLayerModel *)model
             didIndexPath:(NSIndexPath *)indexPath;
// 结束拖拽时触发
- (void)wl_scrollViewDidEndDragging:(UIScrollView *)scrollView  willDecelerate:(BOOL)decelerate;

// 滑动换页
- (void)wl_changeDragging:(UIScrollView *)scrollView pageNumber:(NSInteger)pageNumber;
@end


@interface WLCollectionViewDelegate : NSObject <UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,weak) id<WLCollectionDelegate> delegate;
@property (nonatomic) UICollectionViewScrollDirection scrollDirection; // default is UICollectionViewScrollDirectionVertical

- (instancetype)initWithDelegate:(id)delegate;

@property(nonatomic,strong) WLBaseCollectionViewLayerModel *viewModel;

@end
