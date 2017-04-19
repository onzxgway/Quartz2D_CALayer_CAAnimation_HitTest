//
//  ZXGStatusView.m
//  Quartz2D_CALayer_CAAnimation_HitTest
//
//  Created by san_xu on 2017/4/18.
//  Copyright © 2017年 com.zxg. All rights reserved.
//

#import "ZXGStatusView.h"

@implementation ZXGStatusView

- (void)drawRect:(CGRect)rect {
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //绘图上下文栈
    CGContextSaveGState(ctx);
    
    //虚线
    //phase  第一个线段的长度 lengths[0] - 5
    CGFloat lengths[4] = {10,5,20,8};
    CGContextSetLineDash(ctx, 0, lengths, 4);
    
    CGContextMoveToPoint(ctx, 20, 20);
    CGContextAddLineToPoint(ctx, 120, 120);
    CGContextStrokePath(ctx);
    
    CGContextRestoreGState(ctx);
    
    //设置线宽
    CGContextSetLineWidth(ctx, 10);
    
    //设置线的颜色
    //    CGContextSetRGBStrokeColor(ctx, 1, 0, 0, 1);
    [[UIColor redColor] setStroke];
    
    //设置线头的样式
    CGContextSetLineCap(ctx, kCGLineCapRound);
    
    //设置两条线连接处的样式
    CGContextSetLineJoin(ctx, kCGLineJoinMiter);
    
    CGContextMoveToPoint(ctx, 120, 20);
    CGContextAddLineToPoint(ctx, 20, 120);
    CGContextAddLineToPoint(ctx, 190, 150);
    CGContextStrokePath(ctx);
    
}

@end
