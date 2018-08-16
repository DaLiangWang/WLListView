//
//  WLCollectionView.m
//  链式语法
//
//  Created by 王亮 on 2018/8/16.
//  Copyright © 2018年 王亮. All rights reserved.
//

#import "WLCollectionViewDelegate.h"
@interface WLCollectionViewDelegate ()

@end
@implementation WLCollectionViewDelegate
-(WLBaseCollectionViewLayerModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[WLBaseCollectionViewLayerModel alloc]init];
    }
    return _viewModel;
}
- (instancetype)initWithDelegate:(id)delegate
{
    self = [super init];
    if (self) {
        self.delegate = delegate;
    }
    return self;
}
#pragma mark -CollectionView代理-
//返回4个section
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [self.viewModel viewLayer].count;
}
//每个section的数量由数据源的count值确定
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[self.viewModel viewLayer] objectAtIndex:section].item.count;
}
//创建 cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if([self.delegate respondsToSelector:@selector(wl_collectionView:layerModel:cellIndexPath:)]){
        return [self.delegate wl_collectionView:collectionView layerModel:self.viewModel cellIndexPath:indexPath];
    }
    return [[UICollectionViewCell alloc]init];
}

//cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [[[self.viewModel viewLayer] objectAtIndex:indexPath.section].item objectAtIndex:indexPath.row].cellSize;
}
//section的边距(上，左，下，右)
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return [[self.viewModel viewLayer] objectAtIndex:section].insetForSection;
}
//section内，cell的间距 纵向
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return [[self.viewModel viewLayer] objectAtIndex:section].VerticalSection;

}
//section内，cell的间距 水平
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return [[self.viewModel viewLayer] objectAtIndex:section].HorizontalSection;
}
//点击cell的响应
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if([self.delegate respondsToSelector:@selector(wl_collectionView:layerModel:didIndexPath:)]){
        [self.delegate wl_collectionView:collectionView layerModel:self.viewModel didIndexPath:indexPath];
    }
}
@end
