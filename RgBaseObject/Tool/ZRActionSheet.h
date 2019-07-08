//
//  ZRActionSheet.h
//  RgBaseObjectDemo
//
//  Created by rogue on 2019/7/8.
//  Copyright © 2019 rogue. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface ZRActionSheet : UIView

+ (ZRActionSheet *)zr_actionSheetWithFrame:(CGRect)frame titles:(NSArray * _Nonnull)titles titlesFontProperty:(NSArray<NSDictionary *> *)properties selectTitleComplete:(void (^)(NSInteger index))complete;

- (void)showInView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
