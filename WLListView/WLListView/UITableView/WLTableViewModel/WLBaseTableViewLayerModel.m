//
//  WLBaseTableViewLayerModel.m
//  xiacai_ios_v6
//
//  Created by 王亮 on 2018/4/25.
//  Copyright © 2018年 王振标. All rights reserved.
//

#import "WLBaseTableViewLayerModel.h"

@implementation WLBaseTableViewLayerModel
-(NSMutableArray<WLBaseTableViewLayerSection *> *)viewLayer{
    if (!_viewLayer){
        _viewLayer = [NSMutableArray array];
    }
    return _viewLayer;
}
-(NSArray *)getAllRowData{
  NSMutableArray *array = [NSMutableArray array];
  for (WLBaseTableViewLayerSection *sec in self.viewLayer) {
    for (WLBaseTableViewLayerRow *row in sec.item) {
      [array addObject:row.data];
    }
  }
  return array;
}
@end
@implementation WLBaseTableViewLayerSection
-(NSMutableArray<WLBaseTableViewLayerRow *> *)item{
    if (!_item){
        _item = [NSMutableArray array];
    }
    return _item;
}
@end
@implementation WLBaseTableViewLayerRow

@end

