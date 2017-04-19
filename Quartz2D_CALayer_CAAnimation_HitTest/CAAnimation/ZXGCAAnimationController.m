//
//  ZXGCAAnimationController.m
//  Quartz2D_CALayer_CAAnimation_HitTest
//
//  Created by san_xu on 2017/4/19.
//  Copyright © 2017年 com.zxg. All rights reserved.
//

#import "ZXGCAAnimationController.h"
#import "ZXGBaseModel.h"
#import "ZXGCAAnimationViewController.h"

@interface ZXGCAAnimationController ()

@end

@implementation ZXGCAAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"核心动画";
}

- (NSArray *)dataSource {
    
    ZXGBaseModel *model = [[ZXGBaseModel alloc] init];
    model.titles = @[@"CABasicAnimation",@"CAKeyframeAnimation",@"CAAnimationGroup",@"CATransition"];
    model.methods = @[@"method0",@"method1",@"method2",@"method3"];
    
    return @[model];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ZXGBaseModel *model = self.dataSource[indexPath.section];
    NSString *mothodName = model.methods[indexPath.row];
    
    ZXGCAAnimationViewController *ctrl = [[ZXGCAAnimationViewController alloc] init];
    [ctrl setValue:mothodName forKey:@"aSelectorName"];
    ctrl.titleName = model.titles[indexPath.row];
    [self.navigationController pushViewController:ctrl animated:YES];
}

@end
