//
//  ZRActionSheet.m
//  RgBaseObjectDemo
//
//  Created by rogue on 2019/7/8.
//  Copyright © 2019 rogue. All rights reserved.
//

#import "ZRActionSheet.h"
#import "ZRColor.h"
#import "ZRMacro.h"
#import "ZRInitView.h"


@interface ZRActionSheetItem : UIView

@property (nonatomic, copy) void (^selected)(NSInteger index);

@property (nonatomic) NSInteger index;

@property (nonatomic, strong) UILabel *title_lab;

@property (nonatomic, strong) CAShapeLayer *line_layer;

@end

@implementation ZRActionSheetItem

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self rg_loadViews];
    }
    return self;
}

- (void)rg_loadViews {
    self.frame = CGRectMake(0, 0, ZR_ScreenWidth, ZR_matching_width(46));
    
    self.title_lab = newLabel();
    self.title_lab.textColor = colorWithHex(0x303133);
    self.title_lab.frame = self.bounds;
    self.title_lab.font = ZR_match_font(16);
    self.title_lab.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.title_lab];
    
    UIBezierPath *pathOne = [UIBezierPath bezierPath];
    pathOne.lineWidth = 0.5;
    [pathOne moveToPoint:CGPointMake(0, CGRectGetHeight(self.frame) - 0.5)];
    [pathOne addLineToPoint:CGPointMake(self.frame.size.width, CGRectGetHeight(self.frame) - 0.5)];
    [pathOne stroke];
    
    self.line_layer = [CAShapeLayer layer];
    self.line_layer.strokeColor = colorWithHex(0xF0F2F4).CGColor;
    [self.layer addSublayer:self.line_layer];
    self.line_layer.path = pathOne.CGPath;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(execute)];
    [self addGestureRecognizer:tap];
}

- (void)execute {
    if(self.selected) {
        self.selected(self.index);
    }
}

- (void)setItemTitle:(NSString * _Nullable)title index:(NSInteger)index {
    self.title_lab.text = ZR_string(title);
    self.index = index;
}

- (void)setSelectFontProperty:(NSDictionary *)font {
    UIColor *color = [font objectForKey:NSForegroundColorAttributeName];
    UIFont *fontSize = [font objectForKey:NSFontAttributeName];
    if(color) {
        self.title_lab.textColor = color;
    }
    if(fontSize) {
        self.title_lab.font = fontSize;
    }
}

@end






























@interface ZRActionSheet()

@property (nonatomic, strong) UIView *content_view;

@end

@implementation ZRActionSheet

+ (ZRActionSheet *)zr_actionSheetWithFrame:(CGRect)frame titles:(NSArray * _Nonnull)titles titlesFontProperty:(NSArray<NSDictionary *> *)properties selectTitleComplete:(void (^)(NSInteger index))complete {
    ZRActionSheet *as = [[ZRActionSheet alloc] initWithFrame:frame];
    [as sc_actionSheetWithTitles:titles titlesFontProperty:properties selectTitleComplete:complete];
    return as;
}

- (void)showInView:(UIView *)view {
    self.alpha = 0;
    [view addSubview:self];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 1;
    }];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self sc_loadViews];
    }
    return self;
}

- (void)sc_loadViews {
    self.backgroundColor = [black() colorWithAlphaComponent:0.4];
    
    self.content_view = newView();
    self.content_view.backgroundColor = white();
    [self addSubview:self.content_view];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)];
    [self addGestureRecognizer:tap];
}

- (void)sc_actionSheetWithTitles:(NSArray * _Nonnull)titles titlesFontProperty:(NSArray<NSDictionary *> *)properties selectTitleComplete:(void (^)(NSInteger index))complete {
    
    __block void (^blockComplete)(NSInteger index) = complete;
    
    CGFloat itemHeight = ZR_matching_width(46);
    CGFloat totalHeight = titles.count * itemHeight;
    CGFloat top_y = CGRectGetHeight(self.frame) - totalHeight;
    
    self.content_view.frame = CGRectMake(0, top_y, ZR_ScreenWidth, totalHeight);
    
    __weak typeof(self) weakSelf = self;
    [titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        ZRActionSheetItem *item = [[ZRActionSheetItem alloc] init];
        [item setSelectFontProperty:[properties objectAtIndex:idx]];
        [item setItemTitle:[titles objectAtIndex:idx] index:idx];
        item.selected = ^(NSInteger index) {
            blockComplete(index);
            [weakSelf close];
        };
        item.frame = CGRectMake(0, itemHeight * idx, ZR_ScreenWidth, itemHeight);
        [self.content_view addSubview:item];
    }];
    
}

- (void)close {
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


@end
