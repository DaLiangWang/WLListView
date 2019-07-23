//
//  TableViewController.m
//  WLListView
//
//  Created by 适途科技二 on 2019/7/23.
//  Copyright © 2019 WangLiang. All rights reserved.
//

#import "TableViewController.h"
#import "WLTableViewDelegate.h"
#import "WLBaseTableViewLayerModel.h"

@interface TableViewController ()<WLTableDelegate>{
    WLTableViewDelegate *data;
}

@end

@implementation TableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    data = [[WLTableViewDelegate alloc]initWithDelegate:self];
    {
        WLBaseTableViewLayerSection *Section = [WLBaseTableViewLayerSection new];
        Section.footH = 20;
        {
            WLBaseTableViewLayerRow *userInfoRow = [WLBaseTableViewLayerRow new];
            userInfoRow.type = @"add";
            userInfoRow.data = @"添加地址";
            userInfoRow.cellHeight = 100;
            [Section.item addObject:userInfoRow];
        }
        [data.viewModel.viewLayer addObject:Section];
    }
    {
        WLBaseTableViewLayerSection *Section = [WLBaseTableViewLayerSection new];
        Section.footH = 1;
        {
            WLBaseTableViewLayerRow *userInfoRow = [WLBaseTableViewLayerRow new];
            userInfoRow.type = @"url";
            userInfoRow.data = @"地址1";
            userInfoRow.cellHeight = 100;
            [Section.item addObject:userInfoRow];
        }
        [data.viewModel.viewLayer addObject:Section];
    }
    
    
    
    UITableView *cv = [[UITableView alloc]initWithFrame:self.view.bounds];
    cv.backgroundColor = [UIColor colorWithWhite:0.5f alpha:.2f];
    cv.delegate = data;
    cv.dataSource = data;
    
    [self.view addSubview:cv];
}
//cell创建
-(UITableViewCell *)wl_tableView:(UITableView *)tableView
                      layerModel:(WLBaseTableViewLayerModel *)layerModel
           cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellT = @"1234";
    [tableView registerClass:UITableViewCell.class forCellReuseIdentifier:cellT];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellT];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:0 reuseIdentifier:cellT];
    }
    cell.textLabel.text = layerModel.viewLayer[indexPath.section].item[indexPath.row].data;
    return cell;
}
- (void)wl_tableView:(UITableView *)tableView rowData:(WLBaseTableViewLayerRow *)rowData didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@",rowData);
}


@end
