//
//  ZXGDrawView.m
//  Quartz2D_CALayer_CAAnimation_HitTest
//
//  Created by san_xu on 2017/4/18.
//  Copyright © 2017年 com.zxg. All rights reserved.
//

#import "ZXGDrawView.h"

@interface ZXGDrawView ()
@property (nonatomic, assign) CGFloat snowY;
@end

@implementation ZXGDrawView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //和屏幕的刷新率一致  60帧/s
        CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(tick)];
        [link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    switch (self.drawType) {
        case DrawShapeTypePieChart:
            [self drawPieChart];
            break;
        case DrawShapeTypeBarGraph:
            [self drawBarGraph];
            break;
        case DrawShapeTypeImage:
            [self drawImage];
            break;
        case DrawShapeTypeChar:
            [self drawChar];
            break;
        case DrawShapeTypeMatrix:
            [self drawMatrix];
            break;
        case DrawShapeTypeClip:
            [self clipImage];
            break;
        case DrawShapeTypeSnow:
            [self snow];
            break;
        case DrawShapeTypePath:
            [self path];
            break;
        case DrawShapeTypeBezierPath:
            [self bezierPath];
            break;
            
        default:
            break;
    }
    
}

#pragma mark - CGMutablePathRef
- (void)path {
    //1
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //2 路径
    //在c语言的框架中如果一个函数名中有create  copy  retain，将来创建出来的对象是要release的
    CGMutablePathRef path = CGPathCreateMutable();
    //圆角矩形
    CGPathAddRoundedRect(path, NULL, CGRectMake(50, 50, 200, 200), 20, 20);
    //添加直线
    CGPathAddLineToPoint(path, NULL, 300, 300);
    
    //把路径添加到上下文中
    CGContextAddPath(ctx, path);
    
    //释放path  一定要释放，
    CGPathRelease(path);
    //3
    CGContextStrokePath(ctx);
}

#pragma mark - BezierPath
- (void)bezierPath {
    //画圆弧   clockwise 是YES 顺时针  NO逆时针
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:100 startAngle:0 endAngle:M_PI_4 clockwise:NO];
    [path setLineWidth:10];
    [[UIColor redColor] setStroke];
    [path stroke];
}

#pragma mark - 模拟下雪
- (void)snow {
    UIImage *img = [UIImage imageNamed:@"snowflake"];
    [img drawAtPoint:CGPointMake(100, self.snowY)];
}

- (void)tick {
    self.snowY += 1;
    
    if (self.snowY >= self.bounds.size.height) {
        self.snowY = 0;
    }
    
    [self setNeedsDisplay];
}

#pragma mark - 剪裁图片
- (void)clipImage {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //剪裁之前，保存当前绘图上下文的状态
    CGContextSaveGState(ctx);
    
    CGContextAddEllipseInRect(ctx, CGRectMake(50, 50, 200, 200));
    //剪裁区域 超过剪裁区域的内容，都会被剪切
    CGContextClip(ctx);
    
    //画图
    UIImage *img = [UIImage imageNamed:@"one.jpg"];
    [img drawInRect:CGRectMake(50, 50, 200, 200)];
    
    //还原绘图上下文的状态
    CGContextRestoreGState(ctx);
    
    //    //
    CGContextStrokePath(ctx);
}

#pragma mark - 矩阵操作

- (void)drawMatrix {
    //平移、缩放、旋转---都是对坐标系做的操作
    //1
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //图形上下文栈  保存绘图状态
    CGContextSaveGState(ctx);
    //平移
    CGContextTranslateCTM(ctx, 100, 100);
//    //缩放
    CGContextScaleCTM(ctx, 0.5, 0.5);
//    //旋转
    CGContextRotateCTM(ctx, M_PI_4);
    
    CGContextAddRect(ctx, CGRectMake(100, 100, 100, 100));
    
    CGContextSetLineWidth(ctx, 10);
    CGContextMoveToPoint(ctx, 0, 0);
    CGContextAddLineToPoint(ctx, 375, 0);
    
    CGContextStrokePath(ctx);
    //还原绘图状态
    CGContextRestoreGState(ctx);
    
    
    //还原绘图状态。画线，不参与平移缩放旋转
    CGContextMoveToPoint(ctx, 0, 200);
    CGContextAddLineToPoint(ctx, 375, 200);
    CGContextStrokePath(ctx);
}

#pragma mark - 画图片

- (void)drawImage {
    UIImage *img = [UIImage imageNamed:@"snowflake"];

    [img drawAtPoint:CGPointZero];
//    [img drawInRect:rect];
//    [img drawAsPatternInRect:rect];
}

#pragma mark - 画文字

- (void)drawChar {
    NSString *str = @"喂马劈材 周游世界";

    [str drawAtPoint:CGPointZero withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:[UIColor redColor],NSBackgroundColorAttributeName:[UIColor blueColor],NSStrikethroughStyleAttributeName:@(1)}];

    [str drawInRect:CGRectMake(50, 50, 100, 100) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:[UIColor redColor],NSBackgroundColorAttributeName:[UIColor blueColor],NSStrikethroughStyleAttributeName:@(1)}];
}

#pragma mark - 画柱状图
- (void)drawBarGraph {
    [self drawBarGraph:@[@20,@30,@20,@30] colors:@[[UIColor redColor],[UIColor blueColor],[UIColor greenColor],[UIColor orangeColor]]];
}

// nonnull非空  nullable可以为空
- (void)drawBarGraph:(nonnull NSArray *)percents colors:(nonnull NSArray<UIColor *>*)colors {
    CGFloat kMargin = 20;//条形图之间的间隔
    CGFloat barWidth = (self.bounds.size.width - (percents.count + 1) * kMargin) / percents.count;
    CGFloat totalHeight = self.bounds.size.height;
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGFloat barHeight = 0;
    for (int i = 0; i < percents.count; ++i) {
        
        barHeight = totalHeight * [percents[i] floatValue]/100;
        CGContextAddRect(ctx, CGRectMake(kMargin + i * (barWidth + kMargin), totalHeight - barHeight, barWidth, barHeight));
        [colors[i] set];
        CGContextDrawPath(ctx, kCGPathFill);
    }
}

#pragma mark - 画饼图
- (void)drawPieChart {
    [self drawPieChart:@[@20,@30,@20,@30] colors:@[[UIColor redColor],[UIColor blueColor],[UIColor greenColor],[UIColor orangeColor]]];
}

- (void)drawPieChart:(nonnull NSArray *)percents colors:(nonnull NSArray<UIColor *>*)colors {
    
    CGFloat centerX = self.bounds.size.width * 0.5;
    CGFloat centerY = self.bounds.size.height * 0.5;
    CGFloat radius = 90;
    int clockwise = 0;
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGFloat startAngle = 0;
    CGFloat endAngle = 0;
    for (int i = 0; i < percents.count; ++i) {
        startAngle = endAngle;
        endAngle = startAngle + [percents[i] floatValue]/100 * M_PI * 2;
        
        CGContextAddArc(ctx, centerX, centerY, radius, startAngle , endAngle, clockwise);
        CGContextAddLineToPoint(ctx, centerX, centerY);
        [colors[i] set];
        CGContextDrawPath(ctx, kCGPathFill);
    }
}

@end
