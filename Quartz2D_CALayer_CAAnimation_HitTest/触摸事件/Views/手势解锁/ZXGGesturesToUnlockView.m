//
//  ZXGGesturesToUnlockView.m
//  Quartz2D_CALayer_CAAnimation_HitTest
//
//  Created by san_xu on 2017/4/19.
//  Copyright © 2017年 com.zxg. All rights reserved.
//

#import "ZXGGesturesToUnlockView.h"
#import "ZXGGestureView.h"

@interface ZXGGesturesToUnlockView ()<ZXGGestureViewDelegate>
@property (weak, nonatomic) IBOutlet ZXGGestureView *myGestureView;
@property (weak, nonatomic) IBOutlet UIImageView *topIndicateImage;

@end

@implementation ZXGGesturesToUnlockView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.myGestureView.delegate = self;
}

+ (instancetype)gesturesToUnlockView {
    return [[[NSBundle mainBundle] loadNibNamed:@"ZXGGesturesToUnlockView" owner:nil options:nil] lastObject];
}

- (void)view:(ZXGGestureView *)vi img:(UIImage *)img {
    self.topIndicateImage.image = img;
}


@end
