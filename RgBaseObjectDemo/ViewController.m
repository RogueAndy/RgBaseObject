//
//  ViewController.m
//  RgBaseObjectDemo
//
//  Created by rogue on 2019/6/27.
//  Copyright © 2019 rogue. All rights reserved.
//

#import "ViewController.h"
#import "ZRMacro.h"
#import "UIButton+ZREnlargeEdge.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIFont *d = [UIFont systemFontOfSize:22 weight:22];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(20, 100, 100, 30);
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitle:@"点击" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setEnlargeEdgeWithTop:20 right:40 bottom:20 left:10];
    [self.view addSubview:btn];
}

- (void)test {
    NSLog(@"dddddd");
}

@end
