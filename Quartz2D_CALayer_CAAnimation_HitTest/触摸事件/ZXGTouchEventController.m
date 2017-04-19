//
//  ZXGTouchEventController.m
//  Quartz2D_CALayer_CAAnimation_HitTest
//
//  Created by san_xu on 2017/4/18.
//  Copyright © 2017年 com.zxg. All rights reserved.
//

#import "ZXGTouchEventController.h"
#import "ZXGBaseModel.h"
#import "ZXGTouchEventViewController.h"

@interface ZXGTouchEventController ()

@end

@implementation ZXGTouchEventController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"触摸事件";
}

- (NSArray *)dataSource {
    
    ZXGBaseModel *model = [[ZXGBaseModel alloc] init];
    model.titles = @[@"触摸移动",@"多点触摸",@"涂鸦",@"手势解锁",@"事件的传递",@"响应者链条",@"手势识别演示"];
    model.methods = @[@"method0",@"method1",@"method2",@"method3",@"method4",@"method5",@"method6"];
    
    return @[model];
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ZXGBaseModel *model = self.dataSource[indexPath.section];
    NSString *mothodName = model.methods[indexPath.row];
    
    ZXGTouchEventViewController *ctrl = [[ZXGTouchEventViewController alloc] init];
    [ctrl setValue:mothodName forKey:@"aSelectorName"];
    ctrl.titleName = model.titles[indexPath.row];
    [self.navigationController pushViewController:ctrl animated:YES];
}
@end
