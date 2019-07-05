//
//  UIResponder+ZRResponder.h
//  RgBaseObjectDemo
//
//  Created by rogue on 2019/7/5.
//  Copyright © 2019 rogue. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIResponder (ZRResponder)

- (void)zr_routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo;

- (void)zr_routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo complete:(void (^)(id parameter))complete;

@end

NS_ASSUME_NONNULL_END
