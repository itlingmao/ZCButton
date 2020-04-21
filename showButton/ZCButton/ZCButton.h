//
//  ZCButton.h
//  button
//
//  Created by 张超 on 2020/4/17.
//  Copyright © 2020 张超. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ZCButton;

typedef ZCButton *_Nonnull(^zc_title)(NSString * ,UIControlState);
typedef ZCButton *_Nonnull(^zc_color)(UIColor * ,UIControlState);
typedef ZCButton *_Nonnull(^zc_target)(UIControlEvents ,void(^)(void));
typedef ZCButton *_Nonnull(^zc_frame)(CGRect);
typedef ZCButton *_Nonnull(^zc_cornerRadius)(BOOL, CGFloat);
typedef ZCButton *_Nonnull(^zc_targetAnim)(NSTimeInterval ,CGAffineTransform , CGAffineTransform);
typedef ZCButton *_Nonnull(^zc_image)(UIImage * ,UIControlState);
typedef ZCButton *_Nonnull(^zc_backImage)(UIImage * ,UIControlState);

@interface ZCButton : UIButton

@property (nonatomic, copy, readonly)zc_title zc_titleLabel;
/**
 * @discussion TitleColor: UIColor *
 * @discussion forState: UIControlState
*/
@property (nonatomic, copy, readonly)zc_color zc_titleColor;

@property (nonatomic, copy, readonly)zc_target zc_addTarget;

@property (nonatomic, copy, readonly)zc_frame zc_rectMake;

@property (nonatomic, copy, readonly)zc_cornerRadius zc_radius;

@property (nonatomic, copy, readonly)zc_targetAnim zc_targetAnimation;

@property (nonatomic, copy, readonly)zc_image zc_imageState;

@property (nonatomic, copy, readonly)zc_backImage zc_backImageState;

@end

NS_ASSUME_NONNULL_END
