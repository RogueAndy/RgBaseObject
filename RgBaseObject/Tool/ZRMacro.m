//
//  ZRMacro.m
//  ZRBaseObjectDemo
//
//  Created by rogue on 2019/1/10.
//  Copyright © 2019 rogue. All rights reserved.
//

#import "ZRMacro.h"

float ZR_ios_system_swift(void) {
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}

BOOL ZRIPHONE_X_swift(void) {
    BOOL isPhoneX = false;
    if (@available(iOS 11.0, *)) {
        isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;
    }
    
    return isPhoneX;
}

CGFloat ZRSafeAreaTopHeight_swift(void) {
    return ZRIPHONE_X_swift() ? 88 : 64;
}

CGFloat ZRSafeAreaBottomHeight_swift(void) {
    return ZRIPHONE_X_swift() ? (49 + 34) : 49;
}

CGFloat ZRSafeAreaNaviTopY_swift(void) {
    return ZRIPHONE_X_swift() ? 44 : 20;
}

CGFloat ZRSafeAreaTabBottomY_swift(void) {
    return ZRIPHONE_X_swift() ? 34 : 0;
}

CGFloat ZRSafeAreaBottomY_swift(void) {
    return ZRIPHONE_X_swift() ? 17 : 0;
}

CGRect ZR_ScreenBound_swift(void) {
    return [[UIScreen mainScreen] bounds];
}

CGFloat ZR_ScreenWidth_swift(void) {
    return [[UIScreen mainScreen] bounds].size.width;
}

CGFloat ZR_ScreenHeight_swift(void) {
    return [[UIScreen mainScreen] bounds].size.height;
}


BOOL ZR_StringIsEmpty_swift(NSString *str) {
    return [str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 || [[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] < 1 ? true : false;
}

NSString *ZR_string_swift(NSString *str) {
    NSString *value = @"";
    value = str ? str : @"";
    return value;
}

CGFloat ZR_matching_scale_swift(void) {
    return ZR_ScreenWidth_swift() / 375.0;
}

CGFloat ZR_matching_width_swift(CGFloat width) {
    return round((width) * ZR_matching_scale_swift());
}

UIFont *ZR_font_swift(CGFloat size) {
    return [UIFont systemFontOfSize:size];
}

UIFont *ZR_fontWeight_swift(CGFloat size, CGFloat weight) {
    return [UIFont systemFontOfSize:size weight:weight];
}

UIFont *ZR_match_font_swift(CGFloat size) {
    return [UIFont systemFontOfSize:ZR_matching_width_swift(size)];
}

UIFont *ZR_match_fontWeight_swift(CGFloat size, CGFloat weight) {
    return [UIFont systemFontOfSize:ZR_matching_width_swift(size) weight:ZR_matching_width_swift(weight)];
}

NSString *ZR_imageFromBundle_swift(NSString *bundleName, NSString *imageName) {
    return [[[NSBundle mainBundle] pathForResource:bundleName ofType:@"bundle"] stringByAppendingPathComponent:imageName];
}

@implementation ZRMacro

+ (UIWindow *)getKeyWindow {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if (!window) {
        window = [[UIApplication sharedApplication].windows objectAtIndex:0];
    }
    return window;
}

@end
