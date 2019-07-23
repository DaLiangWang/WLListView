//
//  WLCollectionViewFlowLayout.m
//  tubaobao
//
//  Created by 王亮 on 2017/8/25.
//  Copyright © 2017年 Rice. All rights reserved.
//

#import "WLCollectionViewFlowLayout.h"
#import "WLCollectionReusableView.h"
#import "WLCollectionViewLayoutAttributes.h"

NSString *const WLCollectionViewSectionBackground = @"WLCollectionViewSectionBackground";

@implementation WLCollectionViewFlowLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.decorationViewAttrs = [NSMutableArray array];
        [self setup];
    }
    return self;
}

- (void)setup
{
    [self registerClass:[WLCollectionReusableView class] forDecorationViewOfKind:WLCollectionViewSectionBackground];
}

- (void)prepareLayout
{
    [super prepareLayout];
    [self.decorationViewAttrs removeAllObjects];
    
    NSInteger numberOfSections = [self.collectionView numberOfSections];
    id delegate = self.collectionView.delegate;
    if (!numberOfSections || ![delegate conformsToProtocol:@protocol(WLCollectionViewDelegateFlowLayout)]) {
        return;
    }
    
    for (NSInteger section = 0; section < numberOfSections; section++) {
        NSInteger numberOfItems = [self.collectionView numberOfItemsInSection:section];
        if (numberOfItems <= 0) {
            continue;
        }
        UICollectionViewLayoutAttributes *firstItem = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:section]];
        UICollectionViewLayoutAttributes *lastItem = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:numberOfItems - 1 inSection:section]];
        if (!firstItem || !lastItem) {
            continue;
        }
        
        UIEdgeInsets sectionInset = [self sectionInset];
        
        if ([delegate respondsToSelector:@selector(collectionView:layout:insetForSectionAtIndex:)]) {
            UIEdgeInsets inset = [delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:section];
            sectionInset = inset;
        }
        
        
        CGRect sectionFrame = CGRectUnion(firstItem.frame, lastItem.frame);
        sectionFrame.origin.x -= sectionInset.left;
        sectionFrame.origin.y -= sectionInset.top;
        
        if (self.scrollDirection == UICollectionViewScrollDirectionHorizontal) {
            sectionFrame.size.width += sectionInset.left + sectionInset.right;
            sectionFrame.size.height = self.collectionView.frame.size.height;
        } else {
            sectionFrame.size.width = self.collectionView.frame.size.width;
            sectionFrame.size.height += sectionInset.top + sectionInset.bottom;
        }
        
        // 2、定义
        WLCollectionViewLayoutAttributes *attr = [WLCollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:WLCollectionViewSectionBackground withIndexPath:[NSIndexPath indexPathForItem:0 inSection:section]];
        attr.frame = sectionFrame;
//        attr.frame.size.width -= 10;
//        attr.frame.origin.x += 5;
        attr.zIndex = -1;
//        检测是否执行代理方法 然后修改背景色活着图片
        if ([delegate respondsToSelector:@selector(collectionView:layout:backgroundColorForSection:)]) {
            attr.backgroundColor = [delegate collectionView:self.collectionView layout:self backgroundColorForSection:section];
        }
        
        if ([delegate respondsToSelector:@selector(collectionView:imageLayout:backgroundColorForSection:)]) {
            attr.backgroundImage = [delegate collectionView:self.collectionView imageLayout:self backgroundColorForSection:section];
        }
        
        if (attr.backgroundColor || attr.backgroundImage) {
            [self.decorationViewAttrs addObject:attr];
        }
    }
    
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    
    NSMutableArray *attrs = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    for (UICollectionViewLayoutAttributes *attr in self.decorationViewAttrs) {
        if (CGRectIntersectsRect(rect, attr.frame)) {
            [attrs addObject:attr];
        }
    }
    return attrs;
}




@end
