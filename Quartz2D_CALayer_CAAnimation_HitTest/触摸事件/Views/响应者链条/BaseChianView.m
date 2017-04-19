//
//  BaseView.m
//  07-事件的传递
//
//  Created by apple on 15/11/18.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "BaseChianView.h"

@implementation BaseChianView
//重写的方法，子类继承
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@ -- touchesBegan",[self class]);
    
    [self.nextResponder touchesBegan:touches withEvent:event];
}

@end
