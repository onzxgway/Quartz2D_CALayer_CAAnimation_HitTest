//
//  ZXGHittestView.m
//  Quartz2D_CALayer_CAAnimation_HitTest
//
//  Created by san_xu on 2017/4/19.
//  Copyright © 2017年 com.zxg. All rights reserved.
//

#import "ZXGChianView.h"

@implementation ZXGChianView

+ (instancetype)hittestView {
    return [[[NSBundle mainBundle] loadNibNamed:@"ZXGChianView" owner:nil options:nil] lastObject];
}

@end
