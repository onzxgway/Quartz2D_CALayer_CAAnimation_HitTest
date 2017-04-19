//
//  BaseView.h
//  07-事件的传递
//
//  Created by apple on 15/11/18.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, EventType) {
    EventTypePass = 1,
    EventTypeChain = 2
};

@interface BaseView : UIView

@end
