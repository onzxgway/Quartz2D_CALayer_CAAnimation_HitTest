//
//  ZXGExampleController.m
//  Quartz2D_CALayer_CAAnimation_HitTest
//
//  Created by san_xu on 2017/4/17.
//  Copyright © 2017年 com.zxg. All rights reserved.
//

#import "ZXGExampleController.h"

@interface ZXGExampleController ()

@end

@implementation ZXGExampleController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addSegmentedControl];
}

- (void)addSegmentedControl {
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Quartz2D",@"HitTest",@"CALayer",@"CAAnimation"]];
    [self.view addSubview:segmentedControl];
    segmentedControl.frame = self.view.bounds;
    segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    segmentedControl.tintColor = [UIColor redColor];
    [segmentedControl setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} forState:UIControlStateNormal];
    [segmentedControl addTarget:self action:@selector(segmentedSelected:) forControlEvents:UIControlEventValueChanged];
}

- (void)segmentedSelected:(UISegmentedControl *)segmentedControl {
    
    UIWindow *keyWindow = [[[UIApplication sharedApplication] windows] firstObject];
    keyWindow.rootViewController = [keyWindow.rootViewController.storyboard instantiateViewControllerWithIdentifier:[NSString stringWithFormat:@"%zd",segmentedControl.selectedSegmentIndex]];
    
}

@end
