//
//  ZXGCAAnimationViewController.m
//  Quartz2D_CALayer_CAAnimation_HitTest
//
//  Created by san_xu on 2017/4/19.
//  Copyright © 2017年 com.zxg. All rights reserved.
//

#import "ZXGCAAnimationViewController.h"

@interface ZXGCAAnimationViewController ()

@property (weak,nonatomic)CALayer *layer;
//记录当前图片的索引
@property (nonatomic, assign) NSInteger currentIndex;
//数组 存储所有的图片
@property (nonatomic, strong) NSArray *images;

@end

@implementation ZXGCAAnimationViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    CALayer *lay = [CALayer layer];
    self.layer = lay;
    [self.view.layer addSublayer:lay];
    lay.frame = CGRectMake(50, 50, 200, 200);
    lay.backgroundColor = [UIColor redColor].CGColor;
    lay.contents = (id)[UIImage imageNamed:@"one.jpg"].CGImage;
}

#pragma mark -------- 基础动画
- (void)method0 { //
    [self addBtns:@[@"平移方式1",@"平移方式2",@"平移方式3",@"旋转",@"TimingFunction"]];
}

- (void)addBtns:(NSArray *)titles {
    CGFloat btnW = 100;
    CGFloat btnH = 30;
    NSInteger lineCount = 3;
    CGFloat marginX = (self.view.bounds.size.width - lineCount * btnW) / (CGFloat)(lineCount + 1);
    for (int i = 0; i < titles.count; ++i) {
        CGFloat btnX = marginX + (btnW + marginX) * (i % lineCount);
        CGFloat btnY = 410 + (btnH + 20) * (i / lineCount);
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = i;
        [self.view addSubview:btn];
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
}
- (void)btnClick:(UIButton *)btn {
    switch (btn.tag) {
        case 0:
            [self demo1];
            break;
        case 1:
             [self demo2];
            break;
        case 2:
             [self demo3];
            break;
        case 3:
            [self demo4];
            break;
        case 4:
            [self demo5];
            break;
        default:
            break;
    }
}

- (void)demo5 {
    if ([@"method0" isEqualToString:self.aSelectorName]) {
        [self basicAnimation5];
    }
    
}

- (void)demo4 {
    if ([@"method0" isEqualToString:self.aSelectorName]) {
        [self basicAnimation4];
    }
}

//2 平移
- (void)demo3 {
    if ([@"method0" isEqualToString:self.aSelectorName]) {
        [self basicAnimation3];
    }
    if ([@"method1" isEqualToString:self.aSelectorName]) {
        [self keyFrameAnimation3];
    }
}

- (void)demo2 {
    if ([@"method0" isEqualToString:self.aSelectorName]) {
       [self basicAnimation2];
    }
    if ([@"method1" isEqualToString:self.aSelectorName]) {
        [self keyFrameAnimation2];
    }
    if ([@"method3" isEqualToString:self.aSelectorName]) {
        self.currentIndex++;
        [self showImage:kCATransitionFromRight];
    }
}

- (void)demo1 {
    if ([@"method0" isEqualToString:self.aSelectorName]) {
        [self basicAnimation1];
    }
    
    if ([@"method1" isEqualToString:self.aSelectorName]) {
        [self keyFrameAnimation1];
    }
    
    if ([@"method3" isEqualToString:self.aSelectorName]) {
        self.currentIndex--;
        [self showImage:kCATransitionFromLeft];
    }
}

- (void)basicAnimation1 {
    //1 平移
    //1.1 创建核心动画的对象
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    
    //设置值，设置动画结束的位置
    //    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 300)];
    //在当前的位置增加。。
    animation.byValue = [NSValue valueWithCGPoint:CGPointMake(50, 50)];
    //设置动画的时间
    animation.duration = 2;
    
    //动画执行完成之后，保留现在的位置
    animation.removedOnCompletion = NO; // 动画结束之后不删除
    animation.fillMode = kCAFillModeForwards; //动画结束后保持现在的位置
    
    
    //核心动画结束后。控件本身的位置不变（改变的仅仅是一个子layer）
    
    //1.2 添加到layer中
    [self.layer addAnimation:animation forKey:nil];
}
- (void)basicAnimation2 {
    //1 平移
    //1.1 创建核心动画的对象
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    
    //设置值，设置动画结束的位置
    //    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 300)];
    //在当前的位置增加。。
    animation.byValue = @(50);
    //设置动画的时间
    animation.duration = 2;
    
    //动画执行完成之后，保留现在的位置
    animation.removedOnCompletion = NO; // 动画结束之后不删除
    animation.fillMode = kCAFillModeForwards; //动画结束后保持现在的位置
    
    
    //核心动画结束后。控件本身的位置不变（改变的仅仅是一个子layer）
    
    //1.2 添加到layer中
    [self.layer addAnimation:animation forKey:nil];
}
- (void)basicAnimation3 {
    //1 平移
    //1.1 创建核心动画的对象
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    
    //在当前的位置增加。。
    //    animation.byValue = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(50, 50, 1)];
    
    animation.byValue = @(100);
    
    //设置动画的时间
    animation.duration = 2;
    
    //动画执行完成之后，保留现在的位置
    animation.removedOnCompletion = NO; // 动画结束之后不删除
    animation.fillMode = kCAFillModeForwards; //动画结束后保持现在的位置
    
    
    //核心动画结束后。控件本身的位置不变（改变的仅仅是一个子layer）
    
    //1.2 添加到layer中
    [self.layer addAnimation:animation forKey:nil];
}
- (void)basicAnimation4 {
    //1 创建基本动画对象
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    //在原来的基础上增加
    animation.byValue = @(M_PI);
    
    //动画结束之后，保持位置
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    //动画的时间
    animation.duration = 3;
    
    //2 把对象添加到layer中
    [self.layer addAnimation:animation forKey:nil];
}
- (void)basicAnimation5 {
    //1 创建基本动画对象
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    //
    //    kCAMediaTimingFunctionEaseIn   //先慢后快
    //    kCAMediaTimingFunctionEaseOut  //先快后慢
    //    kCAMediaTimingFunctionEaseInEaseOut  //先慢后快再慢
    //    kCAMediaTimingFunctionLinear  //匀速
    
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    //在原来的基础上增加
    animation.byValue = @(M_PI);
    
    //动画结束之后，保持位置
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    //动画的时间
    animation.duration = 3;
    
    //2 把对象添加到layer中
    [self.layer addAnimation:animation forKey:nil];
}

#pragma mark -------- 关键帧动画
- (void)method1 {
    [self addBtns:@[@"关键帧动画1",@"关键帧动画2",@"关键帧动画3"]];
}

#pragma mark -------- 组动画
- (void)method2 {
    //创建一个数组存储动画
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:3];
    
    //1 平移
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    anim.toValue = @(400);
    [array addObject:anim];
    //    [self.myView.layer addAnimation:anim forKey:nil];
    
    //2 缩放
    anim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anim.toValue = @(0.5);
    [array addObject:anim];
    
    //    [self.myView.layer addAnimation:anim forKey:nil];
    
    //3 旋转
    anim = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anim.toValue = @(M_PI);
    [array addObject:anim];
    
    //    [self.myView.layer addAnimation:anim forKey:nil];
    
    
    //组动画--存储一些动画，统一设置这些动画的共同的属性
    CAAnimationGroup *group = [CAAnimationGroup animation];
    //把基本动画添加到组动画中
    group.animations = array;
    
    //
    group.duration = 3;
    //
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    
    [self.layer addAnimation:group forKey:nil];
}

- (void)keyFrameAnimation1 {
    //1
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //设置路径
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 200, 200)];
    animation.path = path.CGPath;
    
    animation.duration = 3;
    animation.rotationMode = @"auto";
    
    //动画结束，保持结束的位置
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    //2
    //forkey中的key 是移除动画的时候使用的
    [self.layer addAnimation:animation forKey:@"key"];
}
- (void)keyFrameAnimation2 {
    //1 创建 关键帧动画 对象
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    //设置关键帧动画途径的点
    NSValue *v1 = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    NSValue *v2 = [NSValue valueWithCGPoint:CGPointMake(200, 100)];
    NSValue *v3 = [NSValue valueWithCGPoint:CGPointMake(200, 200)];
    NSValue *v4 = [NSValue valueWithCGPoint:CGPointMake(100, 200)];
    NSValue *v5 = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    
    //设置动画的轨迹
    animation.values = @[v1,v2,v3,v4,v5];
    //设置轨迹的时间-比如和values的个数一样，
    //数组中的第一个值必须为0
    //数组中的最后一个值必须为1
    //设置每一个点的时间
    animation.keyTimes = @[@0,@(1/10.0),@(2/10.0),@(3/10.0),@1];
    
    animation.duration = 10;
    
    //动画结束后，保持最后的位置
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    //2 把对象添加到layer
    [self.layer addAnimation:animation forKey:nil];
}
- (void)keyFrameAnimation3 {
    //图标抖动
    //1 创建关键帧动画对象
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    
    //设置动画的轨迹
    animation.values = @[@(M_PI_4*0.1),@(-M_PI_4*0.1),@(M_PI_4*0.1)];
    
    
    //重复的次数
    animation.repeatCount = MAXFLOAT;
    //动画的时间
    animation.duration = 0.4;
    //2 把对象添加到layer中
    [self.layer addAnimation:animation forKey:nil];
}

#pragma mark -------- 转场动画
- (void)method3 {
    [self addBtns:@[@"上一张",@"下一张"]];
}

//懒加载-图片准备好
- (NSArray *)images {
    if (!_images) {
        _images = @[
                    [UIImage imageNamed:@"1.jpg"],
                    [UIImage imageNamed:@"2.jpg"],
                    [UIImage imageNamed:@"3.jpg"]
                    ];
    }
    return _images;
}

//设置imageview中显示的图片   -- subType 转场动画的方向
- (void)showImage:(NSString *)subType {
    //判断索引是否越界
    if (self.currentIndex == self.images.count) {
        //如果是最后一张之后 ，显示第一张
        self.currentIndex = 0;
    }else if(self.currentIndex == -1) {
        //如果是第一张之前，显示最后一张
        self.currentIndex = self.images.count - 1;
    }
    
    //获取索引对应的图片
    UIImage *img = self.images[self.currentIndex];
    self.layer.contents = (id)img.CGImage;
    
    //添加转场动画
    [self addTransition:subType];
}

//添加转场动画   -- subType 动画的方向
- (void)addTransition:(NSString *)subType {
    //1 创建转场动画的对象
    CATransition *anim = [[CATransition alloc] init];
    anim.type = @"cube";//动画的效果
    //
    //    anim.subtype = @"fromLeft";
    anim.subtype = subType;
    //动画的时间
    anim.duration = 2;
    
    //设置动画的起始位置 （默认是0 从头开始）  0.5 从一半开始
    //    anim.startProgress = 0.5;
    
    //设置动画结束的位置 （默认是1 到最后）  0.5 到一半结束
    //    anim.endProgress = 0.5;
    
    //2 添加到layer中
    [self.layer addAnimation:anim forKey:nil];
}


@end
