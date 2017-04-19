//
//  BaseView.m
//  07-事件的传递
//
//  Created by apple on 15/11/18.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
        NSLog(@"%@ -- touchesBegan",[self class]);
}

//执行touchesBegan之前会先调用hitTest。找最合适的控件
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
        
        //模拟hitTest的实现
        //    • hitTest:withEvent:会忽略隐藏、不和用户交互的、透明度小于0.01的视图
        if (self.isHidden || !self.userInteractionEnabled || self.alpha <= 0.01) {
            return nil;
        }
        
        //    • 首先调用当前视图的pointInside:withEvent:方法判断触摸点是否在当前视图内；
        //    • 若返回NO,则hitTest:withEvent:返回nil;
        if (![self pointInside:point withEvent:event]) {
            return nil;
        }
        
        //    • 若返回YES,则向当前视图的所有子视图(subviews)发送hitTest:withEvent:消息，所有子视图的遍历顺序是从top到bottom，即从subviews数组的末尾向前遍历,直到有子视图返回非空对象或者全部子视图遍历完毕；
        for (NSInteger i = self.subviews.count - 1; i >= 0; --i) {
            UIView *subView = self.subviews[i];
            
            CGPoint subPoint = [self convertPoint:point toView:subView];//左边转换
            
            if ([subView pointInside:subPoint withEvent:event]) {
                UIView *resultView = [subView hitTest:subPoint withEvent:event];
                if (resultView) {
                    return resultView;
                }
            }
            
        }
        
        //    • 若第一次有子视图返回非空对象,则hitTest:withEvent:方法返回此对象，处理结束；
        //    如所有子视图都返回非，则hitTest:withEvent:方法返回自身(self)。
        return self;
}
@end
