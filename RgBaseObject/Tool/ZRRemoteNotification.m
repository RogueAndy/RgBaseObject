//
//  ZRRemoteNotification.m
//  ZRBaseObjectDemo
//
//  Created by rogue on 2019/6/27.
//  Copyright © 2019 rogue. All rights reserved.
//

#import "ZRRemoteNotification.h"
#import "ZRMacro.h"

// 在系统UserDefaults 里面注册一个app推送是否开启的开关判断 ZRRemoteNotification_Open_App = 1 时候为开启，其余状态都是关闭app推送
#define ZRRemoteNotification_Open_App @"ZRRemoteNotification_Open_App"

@implementation ZRRemoteNotification

+ (BOOL)isAllowAppRemoteNotification {
    BOOL isEnble = [self isAllowSystemRemoteNotification];
    if(isEnble) {
        isEnble = false;
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSString *open = [userDefaults objectForKey:ZRRemoteNotification_Open_App];
        if(ZR_StringIsEmpty(open)) {
            // 第一次进入默认开启
            open = @"1";
        }
        if([open isEqualToString:@"1"]) {
            isEnble = true;
        }
    }
    return isEnble;
}

+ (BOOL)isAllowSystemRemoteNotification {
    BOOL isEnable = NO;
    UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
    isEnable = (UIUserNotificationTypeNone == setting.types) ? NO : YES;
    return isEnable;
}

+ (void)intoSystemSetting {
    UIApplication *application = [UIApplication sharedApplication];
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if (@available(iOS 10.0, *)) {
        if ([application respondsToSelector:@selector(openURL:options:completionHandler:)]) {
            [application openURL:url options:@{} completionHandler:nil];
        }
    } else {
        if([application canOpenURL:url]) {
            [application openURL:url];
        }
    }
}

+ (BOOL)openRemoteNotification:(UIViewController *)viewController {
    if([self isAllowSystemRemoteNotification]) {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:@"1" forKey:ZRRemoteNotification_Open_App];
        [userDefaults synchronize];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
        return true;
    }
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"是否需要到设置页开启推送" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *s = [UIAlertAction actionWithTitle:@"是的"
                                                style:UIAlertActionStyleDefault
                                              handler:^(UIAlertAction * _Nonnull action) {
                                                  [ZRRemoteNotification intoSystemSetting];
                                              }];
    [alert addAction:s];
    
    UIAlertAction *c = [UIAlertAction actionWithTitle:@"取消"
                                                style:UIAlertActionStyleCancel
                                              handler:nil];
    
    [alert addAction:c];
    [viewController presentViewController:alert animated:true completion:nil];
    return false;
}

+ (BOOL)closeRemoteNotification {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:@"0" forKey:ZRRemoteNotification_Open_App];
    [userDefaults synchronize];
    [[UIApplication sharedApplication] unregisterForRemoteNotifications];
    return true;
}

@end
