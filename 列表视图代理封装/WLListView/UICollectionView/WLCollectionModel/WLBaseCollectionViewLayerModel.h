//
//  WLBaseCollectionViewLayerModel.h
//  xiacai_ios_v6
//
//  Created by 王亮 on 2018/4/18.
//  Copyright © 2018年 王振标. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class WLBaseCollectionViewLayerSection,WLBaseCollectionViewLayerRow;
@interface WLBaseCollectionViewLayerModel : NSObject
/** section数量 */
@property(nonatomic,strong) NSMutableArray<WLBaseCollectionViewLayerSection *> *viewLayer;



-(id)getCellData:(NSIndexPath *)indexPath;
@end
@interface WLBaseCollectionViewLayerSection : NSObject
/** section 样式区别 */
@property(nonatomic,strong) NSString *type;
/** section 当前坐标 */
@property(nonatomic,strong) NSIndexSet *indexSet;

/** section 背景颜色  */
@property(nonatomic,strong) UIColor *backgroundColor;
/** section 背景图片 */
@property(nonatomic,strong) UIImage *backgroundImage;
/** section 内边距 */
@property(nonatomic,assign) UIEdgeInsets insetForSection;
/** section内，cell的间距 垂直 */
@property(nonatomic,assign) CGFloat VerticalSection;
/** section内，cell的间距 水平 */
@property(nonatomic,assign) CGFloat HorizontalSection;
/** section 头试图大小 */
@property(nonatomic,assign) CGSize headerSize;
/** section 头试图数据 */
@property(nonatomic,strong) id headerData;
/** section 脚试图大小 */
@property(nonatomic,assign) CGSize footSize;

/** row 数据 */
@property(nonatomic,strong) NSMutableArray<WLBaseCollectionViewLayerRow *> *item;
@end
@interface WLBaseCollectionViewLayerRow : NSObject
/** row 单个cell 的标签 区分cell用途 */
@property(nonatomic,strong) id type;
/** row 单个cell 大小 */
@property(nonatomic,assign) CGSize cellSize;
/** 单个cell 的数据 */
@property(nonatomic,strong) id data;
/** 单个cell 额外 数据 */
@property(nonatomic,strong) id otherData;
/** row 当前坐标 */
@property(nonatomic,strong) NSIndexPath *indexPath;

@end
