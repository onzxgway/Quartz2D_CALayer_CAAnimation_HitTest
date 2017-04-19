//
//  ZXGLayer.m
//  Quartz2D_CALayer_CAAnimation_HitTest
//
//  Created by san_xu on 2017/4/17.
//  Copyright © 2017年 com.zxg. All rights reserved.
//

#import "ZXGLayer.h"

@implementation ZXGLayer

//显示layer的时候不会调用drawInContext。--必须调用setNeedsDisplay
- (void)drawInContext:(CGContextRef)ctx {
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddEllipseInRect(path, NULL, CGRectMake(10, 10, 80, 80));
    CGContextAddPath(ctx, path);
    CGContextSetRGBStrokeColor(ctx, 1, 0, 0, 1.0);
    CGContextFillPath(ctx);
}

@end
