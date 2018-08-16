//
//  WLCollectionViewFlowLayout.h
//  tubaobao
//
//  Created by 王亮 on 2017/8/25.
//  Copyright © 2017年 Rice. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WLCollectionViewDelegateFlowLayout <UICollectionViewDelegateFlowLayout>
@optional
- (UIColor *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout backgroundColorForSection:(NSInteger)section;
- (UIImage *)collectionView:(UICollectionView *)collectionView imageLayout:(UICollectionViewLayout *)collectionViewLayout backgroundColorForSection:(NSInteger)section;

@end

@interface WLCollectionViewFlowLayout : UICollectionViewFlowLayout

@property (nonatomic, strong) NSMutableArray<UICollectionViewLayoutAttributes *> *decorationViewAttrs;

@end
