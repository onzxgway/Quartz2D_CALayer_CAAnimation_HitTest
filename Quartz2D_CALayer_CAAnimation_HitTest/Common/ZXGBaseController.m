//
//  ZXGBaseController.m
//  Quartz2D_CALayer_CAAnimation_HitTest
//
//  Created by san_xu on 2017/4/17.
//  Copyright © 2017年 com.zxg. All rights reserved.
//

#import "ZXGBaseController.h"
#import "ZXGBaseModel.h"

@interface ZXGBaseController ()

@end

@implementation ZXGBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 60;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reuseID];
    
    UIView *footView = [UIView new];
    self.tableView.tableFooterView = footView;
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    ZXGBaseModel *model = self.dataSource[section];
    return model.titles.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID forIndexPath:indexPath];
    ZXGBaseModel *model = self.dataSource[indexPath.section];
    cell.textLabel.text = model.titles[indexPath.row];
    return cell;
}

@end
