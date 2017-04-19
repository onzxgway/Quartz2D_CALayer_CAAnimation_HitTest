//
//  ZXGCALayerController.m
//  Quartz2D_CALayer_CAAnimation_HitTest
//
//  Created by san_xu on 2017/4/17.
//  Copyright © 2017年 com.zxg. All rights reserved.
//

#import "ZXGCALayerController.h"
#import "ZXGBaseModel.h"
#import "ZXGCALayerViewController.h"

@interface ZXGCALayerController ()

@end

@implementation ZXGCALayerController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"CALayer";
}

- (NSArray *)dataSource {
    ZXGBaseModel *model = [[ZXGBaseModel alloc] init];
    model.titles = @[@"CALayer演示",@"transform属性",@"创建CALayer对象",@"模拟时钟",@"隐式动画",@"自定义Layer"];
    model.methods = @[@"method0",@"method1",@"method2",@"method3",@"method4",@"method5"];
    
    return @[model];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ZXGBaseModel *model = self.dataSource[indexPath.section];
    NSString *mothodName = model.methods[indexPath.row];
    
    ZXGCALayerViewController *ctrl = [[ZXGCALayerViewController alloc] init];
    [ctrl setValue:mothodName forKey:@"aSelectorName"];
    ctrl.titleName = model.titles[indexPath.row];
    [self.navigationController pushViewController:ctrl animated:YES];
}


@end
