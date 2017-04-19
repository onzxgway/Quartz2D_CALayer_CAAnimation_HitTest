//
//  ZXGQuartz2DViewController.m
//  Quartz2D_CALayer_CAAnimation_HitTest
//
//  Created by san_xu on 2017/4/18.
//  Copyright © 2017年 com.zxg. All rights reserved.
//

#import "ZXGQuartz2DViewController.h"
#import "ZXGView.h"
#import "ZXGStatusView.h"
#import "ZXGFillModeView.h"
#import "ZXGDrawView.h"

@interface ZXGQuartz2DViewController ()
@property (strong,nonatomic)ZXGView *demoView;
@property (strong,nonatomic)ZXGDrawView *drawView;
@property (strong,nonatomic)ZXGFillModeView *fillModeView;
@end

@implementation ZXGQuartz2DViewController

#pragma mark - lazy load
- (ZXGDrawView *)drawView {
    if (!_drawView) {
        _drawView = [[ZXGDrawView alloc] init];
        _drawView.frame = CGRectMake(50, 50, 300, 300);
        _drawView.backgroundColor = [UIColor grayColor];
        [self.view addSubview:_drawView];
    }
    return _drawView;
}
- (ZXGView *)demoView {
    if (!_demoView) {
        _demoView = [[ZXGView alloc] init];
        _demoView.frame = CGRectMake(50, 50, 300, 300);
        _demoView.backgroundColor = [UIColor grayColor];
        [self.view addSubview:_demoView];
    }
    return _demoView;
}
- (ZXGFillModeView *)fillModeView {
    if (!_fillModeView) {
        _fillModeView = [[ZXGFillModeView alloc] init];
        _fillModeView.frame = CGRectMake(50, 50, 300, 300);
        _fillModeView.backgroundColor = [UIColor grayColor];
        [self.view addSubview:_fillModeView];
    }
    return _fillModeView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - method0 ~ method9 基本绘图
- (void)method0 { //画直线
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 20, 20);
    CGPathAddLineToPoint(path, NULL, 120, 120);
    self.demoView.path = path;
}

- (void)method1 { //画多条直线
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPoint points[4] = {
        CGPointMake(50, 50),
        CGPointMake(150, 50),
        CGPointMake(150, 150),
        CGPointMake(50, 150)
    };
    CGPathAddLines(path, NULL, points, 4);
    self.demoView.path = path;
}

- (void)method2 { //画矩形
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(50, 50, 100, 100));
    self.demoView.path = path;
}

- (void)method3 { //画圆
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddEllipseInRect(path, NULL, CGRectMake(50, 50, 100, 100));
    self.demoView.path = path;
}

- (void)method4 { //画圆弧
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddArc(path, NULL, 100, 100, 80, 0, M_PI_4, NO);
    self.demoView.path = path;
}


- (void)method5 { //画同心圆
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddArc(path, NULL, 100, 100, 80, 0, M_PI * 2, NO);
    CGPathMoveToPoint(path, NULL, 190, 100);
    CGPathAddArc(path, NULL, 100, 100, 90, 0, M_PI * 2, NO);
    self.demoView.path = path;
}

- (void)method6 { //贝塞尔曲线
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 20, 120);//起始点
    //控制点和结束点
    CGPathAddQuadCurveToPoint(path, NULL, 80, 20, 180, 120);
    self.demoView.path = path;
}

- (void)method7 { //设置路径的状态
    
    ZXGStatusView *demoView = [[ZXGStatusView alloc] init];
    demoView.frame = CGRectMake(80, 80, 200, 200);
    demoView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:demoView];
}

- (void)method8 { //关闭路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPoint points[3] = {
        CGPointMake(50, 50),
        CGPointMake(150, 50),
        CGPointMake(150, 150)
    };
    CGPathAddLines(path, NULL, points, 3);
    CGPathCloseSubpath(path); //关闭路径  在起点和终点之间用直线连接
    self.demoView.path = path;
}

- (void)method9 { //填充路径
    //填充路径一定要有一个区域，否则填充不了，比如一条直线就不可以填充。
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddEllipseInRect(path, NULL, CGRectMake(50, 50, 100, 100));
    self.demoView.path = path;
    self.demoView.drawType = DrawTypeFill;
}


#pragma mark - method10 ~ method11 填充模式
- (void)method10 { //奇偶模式
    self.fillModeView.fillMode = FillModeEvenOdd;
}

- (void)method11 { //非零环绕
    self.fillModeView.fillMode = FillModeZero;
}


#pragma mark - method12 ~ method13
- (void)method12 { //饼图
    self.drawView.drawType = DrawShapeTypePieChart;
}

- (void)method13 { //柱形图
    self.drawView.drawType = DrawShapeTypeBarGraph;
}

#pragma mark - 其他
- (void)method14 { //画文字
    self.drawView.drawType = DrawShapeTypeChar;
}

- (void)method15 { //画图片
    self.drawView.drawType = DrawShapeTypeImage;
}

- (void)method16 { //矩阵操作
    self.drawView.drawType = DrawShapeTypeMatrix;
}

- (void)method17 { //剪裁图片
    self.drawView.drawType = DrawShapeTypeClip;
}

- (void)method18 { //模拟下雪
    self.drawView.drawType = DrawShapeTypeSnow;
}

#pragma mark ----- 路径 path
- (void)method19 { //UIBezierPath
    self.drawView.drawType = DrawShapeTypeBezierPath;
}

- (void)method20 { //CGMutablePathRef
    self.drawView.drawType = DrawShapeTypePath;
}


#pragma mark -----
- (void)method21 {
    //1 创建bitmap graphics context
    //第一个参数 设置绘图上下文的大小
    //第二个参数 不透明度
    //第三个参数 scale  @1x  @2x   值是0的时候，和当前设备的主屏幕的缩放因子一样
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(200, 200), NO, 0);
    
    //画图
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 200, 200)];
    [path fill];
    
    //获取当前上下文中的图片
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    //结束上下文
    UIGraphicsEndImageContext();
    
    UIView *demoView = [[UIView alloc] init];
    demoView.frame = CGRectMake(80, 80, 200, 200);
    demoView.backgroundColor = [UIColor redColor];
    [self.view addSubview:demoView];
    
    demoView.layer.contents = (id)img.CGImage;
    
}

- (void)method22 {
    UIView *demoView = [[UIView alloc] init];
    demoView.frame = CGRectMake(50, 50, 300, 300);
    demoView.backgroundColor = [UIColor redColor];
    [self.view addSubview:demoView];
    
    //1 创建绘图上下文
    CGFloat w = demoView.bounds.size.width;
    CGFloat h = 20;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(w, h), NO, 0);
    
    //2 画线
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, h)];
    [path addLineToPoint:CGPointMake(w, h)];
    [path stroke];
    
    //3 获取到上下文中的图形
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    //4 关闭上下文
    UIGraphicsEndImageContext();
    
    demoView.backgroundColor = [UIColor colorWithPatternImage:img];
}

- (void)method23 {
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"one.jpg"]];
    imgView.frame = CGRectMake(50, 50, 300, 300);
    [self.view addSubview:imgView];
    
    //1 创建上下文
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);
    //2 截取屏幕的图片
    //UIGraphicsGetCurrentContext 获取当前的绘图上下文，函数
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    //3 从上下文中取图片
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    //4 结束上下文
    UIGraphicsEndImageContext();
    
    //5 保存到相册
    UIImageWriteToSavedPhotosAlbum(img, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
}


- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"截图保存成功,请到本地相册查看" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

@end
