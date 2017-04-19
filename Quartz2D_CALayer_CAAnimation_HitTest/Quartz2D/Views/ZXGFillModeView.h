//
//  ZXGFillModeView.h
//  Quartz2D_CALayer_CAAnimation_HitTest
//
//  Created by san_xu on 2017/4/18.
//  Copyright © 2017年 com.zxg. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, FillMode) {
    FillModeEvenOdd,
    FillModeZero,
};

@interface ZXGFillModeView : UIView

@property (assign,nonatomic)FillMode fillMode;

@end
