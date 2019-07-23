//
//  WLTableViewDelegate.h
//  列表视图代理封装
//
//  Created by 王亮 on 2018/8/16.
//  Copyright © 2018年 王亮. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "WLBaseTableViewLayerModel.h"


@protocol WLTableDelegate <NSObject>

@required
//cell创建
-(UITableViewCell *)wl_tableView:(UITableView *)tableView
                   layerModel:(WLBaseTableViewLayerModel *)layerModel
        cellForRowAtIndexPath:(NSIndexPath *)indexPath;
/** 头试图返回 */
-(UIView *)wl_tableView:(UITableView *)tableView layerModel:(id)layerModel viewForHeaderInSection:(NSInteger)section;
/** 脚试图返回 */
-(UIView *)wl_tableView:(UITableView *)tableView layerModel:(id)layerModel viewForFooterInSection:(NSInteger)section;
/** cell创建完成后返回 */
- (void)wl_tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;
/** 在删除cell之后调用，停止显示cell的时候调用,界面不显示cell时。 */
- (void)wl_tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath;
@optional
// 结束拖拽时触发
- (void)wl_scrollViewDidEndDragging:(UIScrollView *)scrollView  willDecelerate:(BOOL)decelerate;
- (void)wl_tableView:(UITableView *)tableView rowData:(WLBaseTableViewLayerRow *)rowData didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface WLTableViewDelegate : NSObject <UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,weak) id<WLTableDelegate> delegate;

- (instancetype)initWithDelegate:(id)delegate;

@property(nonatomic,strong) WLBaseTableViewLayerModel *viewModel;

@end
