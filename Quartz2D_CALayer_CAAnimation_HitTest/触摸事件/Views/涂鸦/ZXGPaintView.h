//
//  ZXGView.h
//  触摸事件
//
//  Created by san_xu on 2017/4/11.
//  Copyright © 2017年 com.zxg.networkMonitor. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, LineColor) {
    LineColorRed,
    LineColorGreen,
    LineColorBlue
};

@interface ZXGPaintView : UIView

@property (strong,nonatomic)UIColor *lineColor;

@property (assign,nonatomic)CGFloat percent;

//清屏
- (void)clear;
//后退
- (void)back;
//橡皮
- (void)eraser;
//保存
- (void)save;

@end
