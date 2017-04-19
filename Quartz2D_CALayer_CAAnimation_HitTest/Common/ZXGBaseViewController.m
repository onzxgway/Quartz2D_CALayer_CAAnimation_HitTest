//
//  ZXGBaseViewController.m
//  Quartz2D_CALayer_CAAnimation_HitTest
//
//  Created by san_xu on 2017/4/18.
//  Copyright © 2017年 com.zxg. All rights reserved.
//

#import "ZXGBaseViewController.h"

@interface ZXGBaseViewController ()

@end

@implementation ZXGBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = self.titleName;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    ZXGPerformSelectorLeakWarning([self performSelector:NSSelectorFromString(self.aSelectorName)]);
}

@end
