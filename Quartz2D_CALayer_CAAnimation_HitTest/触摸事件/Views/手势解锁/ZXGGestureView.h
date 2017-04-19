//
//  ZXGGestureView.h
//  Quartz2D_CALayer_CAAnimation_HitTest
//
//  Created by san_xu on 2017/4/19.
//  Copyright © 2017年 com.zxg. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZXGGestureView;

@protocol ZXGGestureViewDelegate <NSObject>

- (void)view:(ZXGGestureView *)vi img:(UIImage *)img;

@end

@interface ZXGGestureView : UIView

@property (weak,nonatomic)id<ZXGGestureViewDelegate> delegate;

@end
