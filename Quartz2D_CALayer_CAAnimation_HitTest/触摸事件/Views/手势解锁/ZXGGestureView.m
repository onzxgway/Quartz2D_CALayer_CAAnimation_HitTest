//
//  ZXGGestureView.m
//  Quartz2D_CALayer_CAAnimation_HitTest
//
//  Created by san_xu on 2017/4/19.
//  Copyright © 2017年 com.zxg. All rights reserved.
//

#import "ZXGGestureView.h"

static CGFloat const kCount = 9;//按钮的个数

@interface ZXGGestureView ()
@property (assign,nonatomic)CGPoint currentPoint;
@property (strong,nonatomic)NSMutableArray *selectedBtns;
@end

@implementation ZXGGestureView

- (NSMutableArray *)selectedBtns {
    if (!_selectedBtns) {
        _selectedBtns = [NSMutableArray array];
    }
    return _selectedBtns;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        for (int i = 0; i < kCount; ++i) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.tag = i;
            btn.userInteractionEnabled = NO;  //userInteractionEnabled 与 enabled 互不相关
            [self addSubview:btn];
            [btn setBackgroundImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
            [btn setBackgroundImage:[UIImage imageNamed:@"gesture_node_error"] forState:UIControlStateDisabled];
        }
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat kMargin = 20;
    NSInteger kCount = 3;
    CGFloat btnW = (self.bounds.size.width - 4 * kMargin) / kCount;
    
    CGFloat x = 0;
    CGFloat y = 0;
    for (int i = 0; i < self.subviews.count; ++i) {
        x = kMargin + (kMargin + btnW) * (i % kCount);
        y = kMargin + (kMargin + btnW) * (i / 3);
        
        UIButton *btn = self.subviews[i];
        btn.frame = CGRectMake(x, y, btnW, btnW);
    }
    
}


- (void)drawRect:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    for (int i = 0; i < self.selectedBtns.count; ++i) {
        UIButton *btn = self.selectedBtns[i];
        if (i == 0) {
            [path moveToPoint:btn.center];
        } else {
            [path addLineToPoint:btn.center];
        }
    }
    
    if (!CGPointEqualToPoint(self.currentPoint, CGPointZero)) {
        [path addLineToPoint:self.currentPoint];
    }
    [[UIColor whiteColor] setStroke];
    [path setLineWidth:5];
    [path stroke];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesBegan");
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:touch.view];
    
    for (int i = 0; i < self.subviews.count; ++i) {
        UIButton *btn = self.subviews[i];
        
        if (CGRectContainsPoint(btn.frame, point)) {
            [btn setSelected:YES];
            if (![self.selectedBtns containsObject:btn]) {
                [self.selectedBtns addObject:btn];
            }
        }
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesMoved");
    [self touchesBegan:touches withEvent:event];
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:touch.view];
    self.currentPoint = point;
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesEnded");
    //去掉最后的多余的线段
    self.currentPoint = CGPointZero;
    [self setNeedsDisplay];
    
    //判断结果
    NSMutableString *result = [NSMutableString string];
    for (UIButton *btn in self.selectedBtns) {
        [result appendString:[NSString stringWithFormat:@"%zd",btn.tag]];
    }
    if ([@"01246" isEqualToString:result]) {
        
    } else {
        for (UIButton *btn in self.selectedBtns) {
            [btn setEnabled:NO];
            [btn setSelected:NO];
        }
    }
    
    self.userInteractionEnabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.userInteractionEnabled = YES;
        for (UIButton *btn in self.selectedBtns) {
            [btn setEnabled:YES];
            [btn setSelected:NO];
        }
        [self.selectedBtns removeAllObjects];
        [self setNeedsDisplay];
    });
    
    
    //截屏
    [self screenShoot];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesCancelled");
    
}

- (void)screenShoot {
    
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0);
    
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(view:img:)]) {
        [self.delegate view:self img:img];
    }
}

@end
