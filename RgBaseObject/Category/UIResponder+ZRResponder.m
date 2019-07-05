//
//  UIResponder+ZRResponder.m
//  RgBaseObjectDemo
//
//  Created by rogue on 2019/7/5.
//  Copyright © 2019 rogue. All rights reserved.
//

#import "UIResponder+ZRResponder.h"

@implementation UIResponder (ZRResponder)

- (void)zr_routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo
{
    [[self nextResponder] zr_routerEventWithName:eventName userInfo:userInfo];
}

- (void)zr_routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo complete:(void (^)(id))complete {
    [[self nextResponder] zr_routerEventWithName:eventName userInfo:userInfo complete:complete];
}

@end
