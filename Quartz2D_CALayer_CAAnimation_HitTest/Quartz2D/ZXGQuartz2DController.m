//
//  ViewController.m
//  Quartz2D_CALayer_CAAnimation_HitTest
//
//  Created by san_xu on 2017/4/17.
//  Copyright © 2017年 com.zxg. All rights reserved.
//

#import "ZXGQuartz2DController.h"
#import "ZXGBaseModel.h"
#import "ZXGQuartz2DViewController.h"

@interface ZXGQuartz2DController ()

@end

@implementation ZXGQuartz2DController

- (NSArray *)dataSource {
    ZXGBaseModel *modelOne = [[ZXGBaseModel alloc] init];
    modelOne.titles = @[@"画直线",@"画多条直线",@"画矩形",@"画圆",@"画弧",@"画同心圆",@"贝塞尔曲线",@"设置路径的状态",@"关闭路径",@"填充路径"];
    modelOne.methods = @[@"method0",@"method1",@"method2",@"method3",@"method4",@"method5",@"method6",@"method7",@"method8",@"method9"];
    modelOne.sectionTitle = @"基本绘图";
    
    ZXGBaseModel *modelTwo = [[ZXGBaseModel alloc] init];
    modelTwo.titles = @[@"奇偶模式",@"非零环绕模式"];
    modelTwo.methods = @[@"method10",@"method11"];
    modelTwo.sectionTitle = @"填充模式";
    
    ZXGBaseModel *modelThree = [[ZXGBaseModel alloc] init];
    modelThree.titles = @[@"饼图",@"柱形图"];
    modelThree.methods = @[@"method12",@"method13"];
    modelThree.sectionTitle = @"绘制图形";
    
    ZXGBaseModel *modelFour = [[ZXGBaseModel alloc] init];
    modelFour.titles = @[@"画文字",@"画图片",@"矩阵操作",@"剪裁图片",@"模拟下雪"];
    modelFour.methods = @[@"method14",@"method15",@"method16",@"method17",@"method18"];
    modelFour.sectionTitle = @"其他";
    
    ZXGBaseModel *modelFive = [[ZXGBaseModel alloc] init];
    modelFive.titles = @[@"UIBezierPath",@"CGMutablePathRef"];
    modelFive.methods = @[@"method19",@"method20"];
    modelFive.sectionTitle = @"UIBezierPath";
    
    ZXGBaseModel *modelSix = [[ZXGBaseModel alloc] init];
    modelSix.titles = @[@"创建BitmapContext",@"平铺",@"屏幕截图"];
    modelSix.methods = @[@"method21",@"method22",@"method23"];
    modelSix.sectionTitle = @"Bitmap Graphics Context";
    
    return @[modelOne,modelTwo,modelThree,modelFour,modelFive,modelSix];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Quartz2D";
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ZXGBaseModel *model = self.dataSource[indexPath.section];
    NSString *mothodName = model.methods[indexPath.row];
    
    ZXGQuartz2DViewController *ctrl = [[ZXGQuartz2DViewController alloc] init];
    [ctrl setValue:mothodName forKey:@"aSelectorName"];
    ctrl.titleName = model.titles[indexPath.row];
    [self.navigationController pushViewController:ctrl animated:YES];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UITableViewHeaderFooterView *headerFooterView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"UITableViewHeaderFooterView"];
    if (!headerFooterView) {
        headerFooterView = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:@"UITableViewHeaderFooterView"];
    }

    ZXGBaseModel *model = self.dataSource[section];
    headerFooterView.textLabel.text = model.sectionTitle;
    
    return headerFooterView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 38;
}

@end
