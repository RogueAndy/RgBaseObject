//
//  UIButton+EnlargeEdge.h
//  XXJ
//
//  Created by rogue on 2018/4/24.
//  Copyright © 2018年 rogue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ZREnlargeEdge)

- (void)setEnlargeEdge:(CGFloat)size;
- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;
@end
