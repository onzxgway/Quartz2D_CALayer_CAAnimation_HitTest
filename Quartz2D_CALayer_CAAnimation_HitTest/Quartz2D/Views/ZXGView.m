//
//  ZXGView.m
//  Quartz2D_CALayer_CAAnimation_HitTest
//
//  Created by san_xu on 2017/4/18.
//  Copyright © 2017年 com.zxg. All rights reserved.
//

#import "ZXGView.h"

@implementation ZXGView

- (void)drawRect:(CGRect)rect {
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
//    CGContextMoveToPoint(ctx, 10, 10);
//    CGContextAddLineToPoint(ctx, 80, 80);
    
    CGContextAddPath(ctx, self.path);
    
    if (self.drawType == DrawTypeFill) {
        //    CGContextFillPath(ctx); //等价于
        CGContextDrawPath(ctx, kCGPathFill);
        return;
    }
    
//    CGContextStrokePath(ctx); //等价于
    CGContextDrawPath(ctx, kCGPathStroke);
    
}

@end
