//
//  ZXGDrawView.h
//  Quartz2D_CALayer_CAAnimation_HitTest
//
//  Created by san_xu on 2017/4/18.
//  Copyright © 2017年 com.zxg. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, DrawShapeType) {
    DrawShapeTypePieChart,
    DrawShapeTypeBarGraph,
    DrawShapeTypeImage,
    DrawShapeTypeChar,
    DrawShapeTypeMatrix,
    DrawShapeTypeClip,
    DrawShapeTypeSnow,
    DrawShapeTypePath,
    DrawShapeTypeBezierPath
};

@interface ZXGDrawView : UIView

@property (assign,nonatomic)DrawShapeType drawType;

@end
