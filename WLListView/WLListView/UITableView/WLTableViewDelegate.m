//
//  WLTableViewDelegate.m
//  列表视图代理封装
//
//  Created by 王亮 on 2018/8/16.
//  Copyright © 2018年 王亮. All rights reserved.
//

#import "WLTableViewDelegate.h"

@implementation WLTableViewDelegate
-(WLBaseTableViewLayerModel *)viewModel{
  if (!_viewModel) {
    _viewModel = [[WLBaseTableViewLayerModel alloc]init];
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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
  return [self.viewModel.viewLayer count];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return [self.viewModel.viewLayer objectAtIndex:section].item.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  if([self.delegate respondsToSelector:@selector(wl_tableView:layerModel:cellForRowAtIndexPath:)]){
    return [self.delegate wl_tableView:tableView layerModel:self.viewModel cellForRowAtIndexPath:indexPath];
  }
  return [[UITableViewCell alloc]init];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
  if([self.delegate respondsToSelector:@selector(wl_tableView:layerModel:viewForHeaderInSection:)]){
    return [self.delegate wl_tableView:tableView layerModel:[self.viewModel.viewLayer objectAtIndex:section].headerData viewForHeaderInSection:section];
  }
  return [[UIView alloc]init];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
  return [self.viewModel.viewLayer objectAtIndex:section].headerH;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
  if([self.delegate respondsToSelector:@selector(wl_tableView:layerModel:viewForFooterInSection:)]){
    return [self.delegate wl_tableView:tableView layerModel:[self.viewModel.viewLayer objectAtIndex:section].footData viewForFooterInSection:section];
  }
  return [[UIView alloc]init];
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
  return [self.viewModel.viewLayer objectAtIndex:section].footH;
}


#pragma mark -让 tableView 分割线连接起来-
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
  if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
    [cell setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
  }
  if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
    [cell setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
  }
  
//  NSNumber *height = @(cell.frame.size.height);
  if (![[self.viewModel.viewLayer objectAtIndex:indexPath.section].item objectAtIndex:indexPath.row].cellHeight) {
    [[self.viewModel.viewLayer objectAtIndex:indexPath.section].item objectAtIndex:indexPath.row].cellHeight = cell.frame.size.height;
    [self.viewModel.viewLayer objectAtIndex:indexPath.section].allCellH += cell.frame.size.height;
  }
  
  if([self.delegate respondsToSelector:@selector(wl_tableView:willDisplayCell:forRowAtIndexPath:)]){
    return [self.delegate wl_tableView:tableView willDisplayCell:cell forRowAtIndexPath:indexPath];
  }
}
/** 在删除cell之后调用，停止显示cell的时候调用,界面不显示cell时。 */
- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath{
  if([self.delegate respondsToSelector:@selector(wl_tableView:didEndDisplayingCell:forRowAtIndexPath:)]){
    return [self.delegate wl_tableView:tableView didEndDisplayingCell:cell forRowAtIndexPath:indexPath];
  }
}


// 结束拖拽时触发
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView  willDecelerate:(BOOL)decelerate{
  if([self.delegate respondsToSelector:@selector(wl_scrollViewDidEndDragging:willDecelerate:)]){
    [self.delegate wl_scrollViewDidEndDragging:scrollView willDecelerate:decelerate];
  }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if([self.delegate respondsToSelector:@selector(wl_tableView:rowData:didSelectRowAtIndexPath:)]){
        [self.delegate wl_tableView:tableView rowData:self.viewModel.viewLayer[indexPath.section].item[indexPath.row] didSelectRowAtIndexPath:indexPath];
    }
}
@end
