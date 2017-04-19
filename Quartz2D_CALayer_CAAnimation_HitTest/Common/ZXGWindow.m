//
//  ZXGWindow.m
//  Quartz2D_CALayer_CAAnimation_HitTest
//
//  Created by san_xu on 2017/4/17.
//  Copyright © 2017年 com.zxg. All rights reserved.
//

#import "ZXGWindow.h"
#import "ZXGExampleController.h"

static CGFloat const kWindowWidth = 260;

@implementation ZXGWindow

static ZXGWindow *window_;

+ (void)showWindow {
    
    window_ = [[self alloc] init];
    window_.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - kWindowWidth - 30, 0, kWindowWidth, 30);
    window_.windowLevel = UIWindowLevelAlert;
    window_.rootViewController = [[ZXGExampleController alloc] init];
    window_.hidden = NO;
    window_.alpha = 0.4;
}

@end
