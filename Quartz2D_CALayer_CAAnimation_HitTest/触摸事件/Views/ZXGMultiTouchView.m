//
//  ZXGMultiTouchView.m
//  Quartz2D_CALayer_CAAnimation_HitTest
//
//  Created by san_xu on 2017/4/18.
//  Copyright © 2017年 com.zxg. All rights reserved.
//

#import "ZXGMultiTouchView.h"

@interface ZXGMultiTouchView()
@property (nonatomic , strong) NSArray *images;
@end

@implementation ZXGMultiTouchView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //开启多点触控
        self.multipleTouchEnabled = YES;
    }
    return self;
}

//懒加载
- (NSArray *)images {
    if (_images == nil) {
        _images = @[
                    [UIImage imageNamed:@"spark_blue"],
                    [UIImage imageNamed:@"spark_cyan"],
                    [UIImage imageNamed:@"spark_green"],
                    [UIImage imageNamed:@"spark_red"]
                    ];
    }
    return _images;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //取图片的索引
    int index = 0;
    //多点触摸的时候，获取多个手指对应的UITouch对象
    for (UITouch *touch in touches) {
        //获取touch对象对应要显示的图片
        UIImage *img = self.images[index];
        index++; //索引+1
        //创建UIImageView
        UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
        [self addSubview:imgView];
        //获取当前手指的位置
        CGPoint point = [touch locationInView:touch.view];
        imgView.center = point;
        
        //动画的方式移除imageView
        [UIView animateWithDuration:2 animations:^{
            imgView.alpha = 0;
        } completion:^(BOOL finished) {
            [imgView removeFromSuperview];
        }];
    }
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self touchesBegan:touches withEvent:event];
}


@end
