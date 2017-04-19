//
//  ZXGFillModeView.m
//  Quartz2D_CALayer_CAAnimation_HitTest
//
//  Created by san_xu on 2017/4/18.
//  Copyright © 2017年 com.zxg. All rights reserved.
//

#import "ZXGFillModeView.h"

@implementation ZXGFillModeView

- (void)drawRect:(CGRect)rect {
    
    if (self.fillMode == FillModeEvenOdd) {
        [self demo1];
        return;
    }
    
    if (self.fillMode == FillModeZero) {
        [self demo2];
    }
    
}

//非零环绕规则  非零填  零不填
- (void)demo2 {
    // 1. 获取"图形上下文"
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:100 startAngle:0 endAngle:M_PI * 2 clockwise:1];
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:50 startAngle:0 endAngle:M_PI * 2 clockwise:0];
    
    CGContextAddPath(ctx, path1.CGPath);
    CGContextAddPath(ctx, path.CGPath);
    
    // 默认填充模式: nonzero winding number rule(非零绕数规则)从左到右跨过, +1。从右到左跨过, -1。最后如果为0, 那么不填充, 否则填充
    //      CGContextDrawPath(ctx, kCGPathFill);
    CGContextFillPath(ctx);
    
}

//奇偶填充  ： 奇填偶不填
- (void)demo1 {
    // 1. 获取"图形上下文"
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 200, 100)];
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 150) radius:80 startAngle:0 endAngle:M_PI * 2 clockwise:1];
    UIBezierPath *path2 = [UIBezierPath bezierPathWithRect:CGRectMake(250, 30, 20, 200)];
    
    CGContextAddPath(ctx, path2.CGPath);
    CGContextAddPath(ctx, path1.CGPath);
    CGContextAddPath(ctx, path.CGPath);
    
    
    // 说明: 被覆盖过奇数次的点填充, 被覆盖过偶数次的点不填充
    // E: Even （偶数）
    // O: Odd (奇数)
    // EOFill表示奇偶模式填充
    CGContextDrawPath(ctx, kCGPathEOFill);
    
}

@end
