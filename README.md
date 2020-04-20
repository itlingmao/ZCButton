# ZCButton
链式 button
引进ZCButon.h
使用方法如下
           
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
