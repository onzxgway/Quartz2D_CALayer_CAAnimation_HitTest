//
//  ZXGView.h
//  Quartz2D_CALayer_CAAnimation_HitTest
//
//  Created by san_xu on 2017/4/18.
//  Copyright © 2017年 com.zxg. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, DrawType) {
    DrawTypeStroke,
    DrawTypeFill,
};

@interface ZXGView : UIView

@property (assign,nonatomic)DrawType drawType;
@property (assign,nonatomic)CGMutablePathRef path;

@end
