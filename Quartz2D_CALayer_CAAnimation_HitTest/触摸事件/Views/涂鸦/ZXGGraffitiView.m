//
//  ZXGGraffitiView.m
//  Quartz2D_CALayer_CAAnimation_HitTest
//
//  Created by san_xu on 2017/4/18.
//  Copyright © 2017年 com.zxg. All rights reserved.
//

#import "ZXGGraffitiView.h"
#import "ZXGPaintView.h"

@interface ZXGGraffitiView ()
@property (weak, nonatomic) IBOutlet ZXGPaintView *myPaintView;
@end

@implementation ZXGGraffitiView

+ (instancetype)graffitiView {
    return [[[NSBundle mainBundle] loadNibNamed:@"ZXGGraffitiView" owner:nil options:nil] lastObject];
}

- (IBAction)clear:(id)sender {
    [self.myPaintView clear];
}
- (IBAction)back:(id)sender {
    [self.myPaintView back];
}
- (IBAction)erase:(id)sender {
    [self.myPaintView eraser];
}
- (IBAction)save:(id)sender {
    [self.myPaintView save];
}
- (IBAction)colorBtnClick:(UIButton *)sender {
    
    switch (sender.tag) {
        case 0: //red
            self.myPaintView.lineColor = [UIColor redColor];
            break;
        case 1: //green
            self.myPaintView.lineColor = [UIColor greenColor];
            break;
        case 2: //blue
            self.myPaintView.lineColor = [UIColor blueColor];
            break;
            
        default:
            break;
    }
}
- (IBAction)mySlider:(UISlider *)sender {
    self.myPaintView.percent = sender.value;
}

@end
