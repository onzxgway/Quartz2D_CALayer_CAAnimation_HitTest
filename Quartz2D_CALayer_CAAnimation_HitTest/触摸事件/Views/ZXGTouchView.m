//
//  ZXGTouchView.m
//  Quartz2D_CALayer_CAAnimation_HitTest
//
//  Created by san_xu on 2017/4/18.
//  Copyright © 2017年 com.zxg. All rights reserved.
//

#import "ZXGTouchView.h"

@implementation ZXGTouchView

//1 触摸开始
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self touchesMoved:touches withEvent:event];
}

//2 屏幕上移动手指的时候
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //获取当前手指对应的UITouch对象
    UITouch *touch = [touches anyObject];
    
    //获取上次的位置
    CGPoint prePoint = [touch previousLocationInView:touch.view];
    //获取当前位置
    CGPoint currentPoint = [touch locationInView:touch.view];
    
    //计算偏移 + 之前的坐标
    CGFloat x = currentPoint.x - prePoint.x + self.center.x;
    CGFloat y = currentPoint.y - prePoint.y + self.center.y;
    //设置view的坐标
    self.center = CGPointMake(x, y);
}

//3 触摸结束，手指离开
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

//4 触摸被意外终止（比如：来电）
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

@end
