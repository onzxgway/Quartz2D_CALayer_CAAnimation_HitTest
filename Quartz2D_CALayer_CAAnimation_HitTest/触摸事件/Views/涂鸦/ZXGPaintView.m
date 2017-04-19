//
//  ZXGView.m
//  触摸事件
//
//  Created by san_xu on 2017/4/11.
//  Copyright © 2017年 com.zxg.networkMonitor. All rights reserved.
//

#import "ZXGPaintView.h"
#import "ZXGBezierPath.h"

@interface ZXGPaintView ()

@property (strong,nonatomic)NSMutableArray *arr;
@property (strong,nonatomic)ZXGBezierPath *path;
@property (assign,nonatomic)NSInteger index;
@end

@implementation ZXGPaintView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.percent = 0.1;
}

- (NSMutableArray *)arr {
    if (!_arr) {
        _arr = [NSMutableArray arrayWithCapacity:10];
    }
    return _arr;
}

/*
   响应者对象：能够处理事件的对象。  继承UIResponder就是响应者。
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    self.path = [ZXGBezierPath bezierPath];
    self.path.lineColor = self.lineColor;
    [self.path setLineWidth:self.percent * 10];
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:touch.view];
    [self.path moveToPoint:point];
    [self.arr addObject:self.path];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:touch.view];
    
    [self.path addLineToPoint:point];
    [self setNeedsDisplay];
}

/*  UITouch介绍
 1、当用户触摸屏幕时，会创建一个与手指相关联的UITouch对象
 2、一根手指对应一个UITouch对象，多根手指对应多个UITouch对象(多点触摸)
 3、UITouch的作用 保存跟手指有关的信息，比如:触摸的位置、时间、阶段
 4、当手指移动时，系统会更新同一个UITouch对象，使之能够一直保存该手指在所在的触摸位置 
 5、当手指离开屏幕时，系统会销毁对应的UITouch对象
 */

- (void)drawRect:(CGRect)rect {
    
    for (ZXGBezierPath *path in self.arr) {
        [path.lineColor setStroke];
        [path stroke];
    }
}

//清屏
- (void)clear {
    [self.arr removeAllObjects];
    [self setNeedsDisplay];
}
//后退
- (void)back {
    [self.arr removeLastObject];
    [self setNeedsDisplay];
}
//橡皮
- (void)eraser {
    self.lineColor = self.backgroundColor;
}
//保存
- (void)save {
    
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0);
    
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(img, nil, nil, NULL);
}


@end
