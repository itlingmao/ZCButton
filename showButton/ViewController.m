//
//  ViewController.m
//  showButton/Users/zhangchao/ZCButton/showButton/ViewController.m
//
//  Created by 张超 on 2020/4/20.
//  Copyright © 2020 张超. All rights reserved.
//

#import "ViewController.h"
#import "ZCButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
       ZCButton *button = [[ZCButton alloc] init];
           
       button.zc_rectMake(CGRectMake(120, 100, 100, 60))
       .zc_titleLabel(@"ok键", UIControlStateNormal)
       .zc_titleColor([UIColor whiteColor], UIControlStateSelected)
       .zc_radius(YES, 5)
       .zc_imageState([UIImage imageNamed:@"san_qq"], UIControlStateNormal)
       .zc_backImageState([UIImage imageNamed:@"btn"], UIControlStateNormal)
       .zc_addTarget(UIControlEventTouchUpInside, ^{
           button.zc_targetAnimation(1, CGAffineTransformMakeScale(1.1, 1.1), CGAffineTransformMakeScale(0.9, 0.9));
       });
       [self.view addSubview:button];
}


@end
