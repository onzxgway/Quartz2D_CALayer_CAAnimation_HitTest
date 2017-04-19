//
//  ZXGTouchEventViewController.m
//  Quartz2D_CALayer_CAAnimation_HitTest
//
//  Created by san_xu on 2017/4/18.
//  Copyright © 2017年 com.zxg. All rights reserved.
//

#import "ZXGTouchEventViewController.h"
#import "ZXGTouchView.h"
#import "ZXGMultiTouchView.h"
#import "ZXGGraffitiView.h"
#import "ZXGGesturesToUnlockView.h"
#import "ZXGHittestView.h"
#import "ZXGChianView.h"

@interface ZXGTouchEventViewController ()<UIGestureRecognizerDelegate>
//记录当前图片的索引
@property (nonatomic, assign) int currentIndex;
@property (strong,nonatomic)ZXGTouchView *demoView;
@property (strong,nonatomic)ZXGMultiTouchView *multiTouchView;
@property (strong,nonatomic)ZXGHittestView *hittestView;
@property (weak,nonatomic)UIImageView *imageView;
@end

@implementation ZXGTouchEventViewController
#pragma mark - lazy load
- (ZXGTouchView *)demoView {
    if (!_demoView) {
        _demoView = [[ZXGTouchView alloc] init];
        _demoView.backgroundColor = [UIColor greenColor];
        [self.view addSubview:_demoView];
    }
    return _demoView;
}

- (ZXGMultiTouchView *)multiTouchView {
    if (!_multiTouchView) {
        _multiTouchView = [[ZXGMultiTouchView alloc] init];
        _multiTouchView.backgroundColor = [UIColor blackColor];
        [self.view addSubview:_multiTouchView];
    }
    return _multiTouchView;
}

- (ZXGHittestView *)hittestView {
    if (!_hittestView) {
        _hittestView = [ZXGHittestView hittestView];
        [self.view addSubview:_hittestView];
        
    }
    return _hittestView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark ------- 触摸练习
- (void)method0 {
    self.demoView.frame = CGRectMake(50, 50, 50, 50);
}

#pragma mark ------- 多点触摸
- (void)method1 {
    self.multiTouchView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
}

#pragma mark ------- 涂鸦
- (void)method2 { //涂鸦
    ZXGGraffitiView *demoView = [ZXGGraffitiView graffitiView];
    [self.view addSubview:demoView];
    demoView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
}

#pragma mark ------- 手势解锁
- (void)method3 { //手势解锁
    ZXGGesturesToUnlockView *demoView = [ZXGGesturesToUnlockView gesturesToUnlockView];
    [self.view addSubview:demoView];
    demoView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
}

#pragma mark ------- 事件的传递
- (void)method4 { //事件的传递
    self.hittestView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    
}

#pragma mark ------- 响应者链条
- (void)method5 { //响应者链条
    ZXGChianView *chianView = [ZXGChianView hittestView];
    [self.view addSubview:chianView];
    chianView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
}

#pragma mark ------- 手势识别演示
- (void)method6 { //手势识别演示
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.userInteractionEnabled = YES;
    self.imageView = imageView;
    imageView.image = [UIImage imageNamed:@"1.jpg"];
    [self.view addSubview:imageView];
    imageView.frame = CGRectMake(50, 150, 300, 180);
    
    
    //让currentIndex的值  和图片的名字一致
    self.currentIndex = 1;
    
    //1 捏合手势
    //1.1 捏合手势 -- 缩放图片  -- 不需要开启控件的多点触摸
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    //1.2 把捏合手势添加到视图中
    [imageView addGestureRecognizer:pinch];
    
    //1.3 设置代理属性
    pinch.delegate = self;
    
    //2 旋转手势
    //2.1 创建旋转手势识别器
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotate:)];
    //2.2 把旋转手势添加到视图中
    [imageView addGestureRecognizer:rotation];
    //2.3 设置代理属性
    rotation.delegate = self;
    
    //问题：当一个视图同时实现捏合和旋转手势之后，同时只有一个手势起作用
    //解决：设置捏合和旋转手势的代理
    
    
    //3 轻扫手势
    //3.1 创建轻扫的手势识别器 -- 向左
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    
    //设置轻扫的方向
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    //3.2
    [imageView addGestureRecognizer:swipeLeft];
    
    
    //创建轻扫的手势识别器 -- 向右
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    //设置方向
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [imageView addGestureRecognizer:swipeRight];
}

//3 轻扫手势要执行的方法
- (void)swipe:(UISwipeGestureRecognizer *)recognizer {
    if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
        //向左扫
        NSLog(@"left");
        //下一张图片
        self.currentIndex++;
        
    }else{
        //向右扫
        NSLog(@"right");
        //上一张图片
        self.currentIndex--;
    }
    
    //判断currentIndex。的值是否超出了范围
    if (self.currentIndex == 4) {
        //如果是最后一张图片之后
        self.currentIndex = 1;
    }else if(self.currentIndex == 0) {
        self.currentIndex = 3;
    }
    
    //获取图片的名称
    NSString *imgName = [NSString stringWithFormat:@"%d.jpg",self.currentIndex];
    self.imageView.image = [UIImage imageNamed:imgName];
}



//2 旋转手势要执行的方法
- (void)rotate:(UIRotationGestureRecognizer *)recognizer {
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, recognizer.rotation);
    //重置旋转的弧度
    recognizer.rotation = 0;
}


//1 捏合手势要执行的方法
- (void)pinch:(UIPinchGestureRecognizer *)recognizer {
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, recognizer.scale, recognizer.scale);
    //重置缩放的比例
    recognizer.scale = 1;
}

//代理方法
//问题：当一个视图同时实现捏合和旋转手势之后，同时只有一个手势起作用
//解决：设置捏合和旋转手势的代理

//此方法，决定两个手势识别器是否可以同时执行，如果返回yes 两个手势识别器可以同时执行
//默认值是NO  两个手势识别器，不能同时执行
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}


//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"controller");
//    //如果想把一个控制器的view添加到另一个控制器的view
//    //必须把该控制器也添加到另一个控制器，保证事件能够正常传递
//}

@end
