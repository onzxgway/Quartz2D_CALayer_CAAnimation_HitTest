//
//  ZXGCALayerViewController.m
//  Quartz2D_CALayer_CAAnimation_HitTest
//
//  Created by san_xu on 2017/4/17.
//  Copyright © 2017年 com.zxg. All rights reserved.
//

#import "ZXGCALayerViewController.h"
#import "ZXGLayer.h"

@interface ZXGCALayerViewController ()
@property (weak,nonatomic)UIView *demoView;
@property (weak,nonatomic)CALayer *lay;
@end

@implementation ZXGCALayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *demoView = [[UIView alloc] init];
    self.demoView = demoView;
    demoView.frame = CGRectMake(80, 80, 200, 200);
    demoView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:demoView];
}

#pragma mark - method0 ~ method5
- (void)method0 {
    
    //线宽。不会改变容器的大小
    self.demoView.layer.borderWidth = 6;
    //边框的颜色 类型是CGColorRef
    self.demoView.layer.borderColor = [UIColor redColor].CGColor;
    //设置圆角---相当于设置了剪裁区域
    self.demoView.layer.cornerRadius = 50;
    //设置透明度[0-1]，默认值1不透明
//    self.demoView.layer.opacity = 0.5;
    
    //CALayer 属于QuartzCore框架，可以跨平台(OSX和iOS)
    //如果CALayer的属性依赖于UIKit框架，就无法跨平台
    self.demoView.layer.contents = (id)[UIImage imageNamed:@"one.jpg"].CGImage;
    //设置剪裁,超过剪裁区域的内容会被减掉
//    self.demoView.layer.masksToBounds = YES;
    
    //设置阴影--不能和设置剪裁一起使用，否则会把阴影剪裁掉
    //阴影的颜色
    self.demoView.layer.shadowColor = [UIColor blueColor].CGColor;
    //设置阴影的偏移
//    self.demoView.layer.shadowOffset = CGSizeMake(20, 20);
    //阴影的透明度 默认值是0 完全透明--必须设置的
    self.demoView.layer.shadowOpacity = 1;
    //阴影的模糊程度
    self.demoView.layer.shadowRadius = 2;
    
    
    //    CGMutablePathRef path = CGPathCreateMutable();
    //    设置阴影的范围，不能和shadowOffset一起使用
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(20, 20, 240, 240)];
    self.demoView.layer.shadowPath = path.CGPath;
}

- (void)method1 {
    self.demoView.layer.contents = (id)[UIImage imageNamed:@"one.jpg"].CGImage;

    NSArray *titles = @[@"旋转",@"平移",@"缩放"];
    CGFloat margin = 50;
    CGFloat btnW = 60;
    for (int i = 0; i < 3; ++i) {
        CGFloat btnX = margin + i * (margin + btnW);
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.tag = i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        btn.frame = CGRectMake(btnX, 400, btnW, 40);
    }
}

- (void)btnClick:(UIButton *)btn {
    if (btn.tag == 0) {
        // 旋转
        self.demoView.layer.transform = CATransform3DRotate(self.demoView.layer.transform, M_PI_4, 0, 0, 1);
        
        //旋转
        //弧度是正数 是顺时针， 负数是逆时针
        //矢量（旋转的轴）的箭头的方向
        //    [self.demoView.layer setValue:@(-M_PI_4) forKeyPath:@"transform.rotation"];
        return;
    }
    
    if (btn.tag == 1) {
        // 平移
//        self.demoView.transform---CGAffineTransform
//        self.demoView.layer.transform -- CATransform3D
//        self.demoView.layer.transform = CATransform3DMakeTranslation(10, 10, 10);
        self.demoView.layer.transform = CATransform3DTranslate(self.demoView.layer.transform, 10, 10, 10);
        
        //kvc的方式重新赋值
        //把结构体转换成对象
        //    NSValue *value = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(100, 100, 100)];
        //    [self.demoView.layer setValue:value forKey:@"transform"];

        return;
    }
    
    if (btn.tag == 2) {
        
        // 缩放
        self.demoView.layer.transform = CATransform3DScale(self.demoView.layer.transform, 1.2, 1.2, 1.2);
//        self.demoView.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.5);
        
        //缩放
        //可以同时设置x和y方向上的缩放
        //    [self.demoView.layer setValue:@(0.5) forKeyPath:@"transform.scale"];
        
        return;
    }
}

- (void)method2 {
    CALayer *lay = [CALayer layer];
    [self.demoView.layer addSublayer:lay];
    lay.frame = CGRectMake(20, 20, 50, 50);

    lay.backgroundColor = [UIColor redColor].CGColor;
    lay.cornerRadius = 10;
    lay.shadowOpacity = 1;
    lay.shadowPath = [UIBezierPath bezierPathWithRect:CGRectMake(-10, -10, 70, 70)].CGPath;
}

- (void)method3 {
    self.demoView.layer.contents = (id)[UIImage imageNamed:@"clock"].CGImage;
    
    CALayer *lay = [CALayer layer];
    self.lay = lay;
    [self.demoView.layer addSublayer:lay];
    lay.backgroundColor = [UIColor blackColor].CGColor;
    lay.bounds = CGRectMake(0, 0, 4, self.demoView.layer.bounds.size.height / 2.0 - 25);
    
    lay.anchorPoint = CGPointMake(0.5, 1);
    lay.position = CGPointMake(self.demoView.layer.bounds.size.width / 2.0, self.demoView.layer.bounds.size.height / 2.0);
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(click) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    [timer fire];//立即执行一次定时器中的方法
}

- (void)click {
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitSecond fromDate:[NSDate date]];
    
    CGFloat angle = M_PI / 30.0 * components.second;
    self.lay.transform = CATransform3DMakeRotation(angle, 0, 0, 1);
}

- (void)method4 {
    //隐式动画---只有自己创建的layer才有隐式动画，UIView的根Layer是没有隐式动画的
    CALayer *lay = [CALayer layer];
    self.lay = lay;
    lay.backgroundColor = [UIColor redColor].CGColor;
    [self.demoView.layer addSublayer:lay];
    lay.frame = CGRectMake(50, 50, 50, 50);
}

- (void)method5 {
    //1 创建自定义layer
    ZXGLayer *layer = [ZXGLayer layer];
    [self.demoView.layer addSublayer:layer];
    
    //
    layer.frame = CGRectMake(10, 10, 100, 100);
    layer.backgroundColor = [UIColor blueColor].CGColor;
    
    //
    [layer setNeedsDisplay];
}

#pragma mark - touchesBegan

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    if ([@"method0" isEqualToString:self.aSelectorName]) {
        //默认情况下设置的是layer的中心点的坐标和UIView的center一样
        self.demoView.layer.position = CGPointMake(0, 0);
        //UIView的center就是CALayer的position
        //    self.demoView.center = CGPointMake(0, 0);
        
        //锚点--设置position控制layer图层的哪个点
        //默认值(0.5,0.5)--中心点
        //(0,0) --左上角    (1,1) 右下角
        self.demoView.layer.anchorPoint = CGPointMake(0, 0.5);
    }
    
    if ([@"method4" isEqualToString:self.aSelectorName]) {
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:touch.view];
        
        //设置动画的时间
        [CATransaction setAnimationDuration:2];
        
        //禁用隐式动画
        [CATransaction begin];  //关闭隐式动画的范围
        [CATransaction setDisableActions:YES]; //禁用
        self.lay.position = point;//自带隐式动画
        self.lay.backgroundColor = [UIColor blueColor].CGColor;
        [CATransaction commit];
        
        self.lay.transform = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
    }
}

@end
