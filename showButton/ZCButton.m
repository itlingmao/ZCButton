//
//  ZCButton.m
//  button
//
//  Created by 张超 on 2020/4/17.
//  Copyright © 2020 张超. All rights reserved.
//

#import "ZCButton.h"

typedef void(^addTarget)(void);

@interface ZCButton ()

@property (nonatomic, copy) addTarget addTarget_block;

@end

@implementation ZCButton

@synthesize zc_titleLabel = _zc_titleLabel;
@synthesize zc_titleColor = _zc_titleColor;
@synthesize zc_addTarget = _zc_addTarget;
@synthesize zc_rectMake = _zc_rectMake;
@synthesize zc_radius = _zc_radius;
@synthesize zc_targetAnimation = _zc_targetAnimation;
@synthesize zc_imageState = _zc_imageState;
@synthesize zc_backImageState = _zc_backImageState;


-(zc_title)zc_titleLabel{
    
    if (!_zc_titleLabel) {
        
        __weak typeof(self) weakSelf = self;
        
        _zc_titleLabel = ^(NSString *title, UIControlState state){
            
            [weakSelf zclabelText:title forState:state];
            
            return weakSelf;
        };
    }
    return _zc_titleLabel;
}

-(zc_color)zc_titleColor {
    
    if (!_zc_titleColor) {
        
        __weak typeof(self) weakSelf = self;
        
        _zc_titleColor = ^(UIColor *color, UIControlState state){
        
            [weakSelf zclabelColor:color forState:state];
        
            return weakSelf;
        };
    }
    
    return _zc_titleColor;
}

-(zc_target)zc_addTarget {
    
    if (!_zc_addTarget) {
        
        __weak typeof(self)weakSelf = self;
        
        _zc_addTarget = ^(UIControlEvents controlEvents ,void(^addTargetBlock)(void)){
            
            if (addTargetBlock) {
                
                weakSelf.addTarget_block = addTargetBlock;
            }
            
            [weakSelf addTarget:weakSelf action:@selector(click:) forControlEvents:controlEvents];
            
            return weakSelf;
        };
    }
    
    return _zc_addTarget;
}

- (zc_frame)zc_rectMake {
    
    if (!_zc_rectMake) {
        
        __weak typeof(self) weakSelf = self;
        
        _zc_rectMake = ^(CGRect rect){
            
            weakSelf.frame = rect;
            
            return weakSelf;
        };
    }
    
    return _zc_rectMake;
}
- (zc_cornerRadius)zc_radius {
    
    if (!_zc_radius) {
        
        __weak typeof(self) weakSelf = self;
        
        _zc_radius = ^(BOOL toBounds, CGFloat radius){
            
            weakSelf.layer.masksToBounds = toBounds;
            weakSelf.layer.cornerRadius = radius;
            
            return weakSelf;
        };
    }
    return _zc_radius;
}

-(zc_targetAnim)zc_targetAnimation{
    
    if (!_zc_targetAnimation) {
        __weak typeof(self) weakSelf = self;
        
        _zc_targetAnimation = ^(NSTimeInterval duration,CGAffineTransform begin, CGAffineTransform ends){
            
                        [UIView animateKeyframesWithDuration:duration delay:0 options:0 animations: ^{
                            
                               [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1 / 3.0 animations: ^{

                                   weakSelf.transform = begin;
                               }];
                            
                               [UIView addKeyframeWithRelativeStartTime:((duration/2)/3.0) relativeDuration:1/3.0 animations: ^{

                                   weakSelf.transform = ends;
                               }];
                            
                               [UIView addKeyframeWithRelativeStartTime:(duration/3.0) relativeDuration:1/3.0 animations: ^{

                                   weakSelf.transform = CGAffineTransformMakeScale(1.0, 1.0);
                               }];
                            
                        } completion:nil];
                       
            return weakSelf;
        };
    }
    
    return _zc_targetAnimation;
}

-(zc_image)zc_imageState {
    
    if (!_zc_imageState) {
        __weak typeof(self) weakSelf = self;
        
        _zc_imageState = ^(UIImage *image ,UIControlState state){
            
            [weakSelf setImage:image forState:state];
            
            return weakSelf;
        };
    }
    return _zc_imageState;
}

-(zc_backImage)zc_backImageState {
    
    if (!_zc_backImageState) {
        __weak typeof(self) weakSelf = self;
        
        _zc_backImageState = ^(UIImage *image ,UIControlState state){
            
            [weakSelf setBackgroundImage:image forState:state];
            
            return weakSelf;
        };
    }
    return _zc_backImageState;
}


-(void)zclabelText:(NSString *)labelText forState:(UIControlState)state; {
    
    [self setTitle:labelText forState:state];
}
-(void)zclabelColor:(UIColor *)labelColor forState:(UIControlState)state; {
    
        [self setTitleColor:labelColor forState:state];
}

- (void)click:(ZCButton *)button{
    
    if (self.addTarget_block) {
        self.addTarget_block();
    }
    
}

@end
