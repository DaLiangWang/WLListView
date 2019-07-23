//
//  WLBaseTableViewLayerModel.h
//  xiacai_ios_v6
//
//  Created by 王亮 on 2018/4/25.
//  Copyright © 2018年 王振标. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class WLBaseTableViewLayerSection,WLBaseTableViewLayerRow;
@interface WLBaseTableViewLayerModel : NSObject
/** section数量 */
@property(nonatomic,strong) NSMutableArray<WLBaseTableViewLayerSection *> *viewLayer;


-(NSArray *)getAllRowData;

@end
@interface WLBaseTableViewLayerSection : NSObject
/** section 样式区别 */
@property(nonatomic,strong) NSString *type;
/** section内所有cell高度 */
@property(nonatomic,assign) CGFloat allCellH;
/** 头试图高度 */
@property(nonatomic,assign) CGFloat headerH;
/** 头试图数据 */
@property(nonatomic,strong) id headerData;
/** 脚试图高度 */
@property(nonatomic,assign) CGFloat footH;
/** 脚试图数据 */
@property(nonatomic,strong) id footData;
/** row 数据 */
@property(nonatomic,strong) NSMutableArray<WLBaseTableViewLayerRow *> *item;
@end
@interface WLBaseTableViewLayerRow : NSObject
/** row 单个cell 的区别 */
@property(nonatomic,strong) id type;
/** row 单个cell 大小 */
@property(nonatomic,assign) CGFloat cellHeight;
/** 单个cell 的数据 */
@property(nonatomic,strong) id data;
/** 单个cell 额外 数据 */
@property(nonatomic,strong) id otherData;
@end

