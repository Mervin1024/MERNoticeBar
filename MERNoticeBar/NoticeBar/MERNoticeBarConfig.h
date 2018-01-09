//
//  MERNoticeBarConfig.h
//  MERNoticeBar
//
//  Created by mervin on 2017/5/11.
//  Copyright © 2017年 mervin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MERNoticeBarEnum.h"

/**
 NoticeBar 属性配置管理类
 */
@interface MERNoticeBarConfig : NSObject

#pragma mark - properties
/**
 *   Notice title, default is nil.
 */
@property (nonatomic, strong) NSString *title;

/**
 *   NoticeBar image, default is nil.
 */
@property (nonatomic, strong) UIImage *image;

/**
 *   Margin around the noticeBar, default is 20.0f.
 */
@property (nonatomic, assign) CGFloat margin;

/**
 *   Notice title color, default is black.
 */
@property (nonatomic, strong) UIColor *textColor;

/**
 *   Background color, default is white.
 */
@property (nonatomic, strong) UIColor *backgroundColor;

/**
 *   NoticeBar animationType :{
 *     MERNoticeBarAnimationTypeTop,          //default
 *     MERNoticeBarAnimationTypeBottom,
 *     MERNoticeBarAnimationTypeLeft,
 *     MERNoticeBarAnimationTypeRight
 *   }
 */
@property (nonatomic, assign) MERNoticeBarAnimationType animationType;

/**
 *   NoticeBar Style :{
 *     MERNoticeBarStyleOnNavigationBar,      //default
 *     MERNoticeBarStyleBelowStatusBar,
 *     MERNoticeBarStyleOnStatusBar,
 *     MERNoticeBarStyleOnTabbar
 *   }
 */
@property (nonatomic, assign) MERNoticeBarStyle barStyle;

@property (nonatomic, readonly, assign) MERNoticeBarProperties barProperties;
@property (nonatomic, readonly, assign) UIWindowLevel beginWindowLevel;
@property (nonatomic, readonly, assign) UIWindowLevel endWindowLevel;

@property (nonatomic, assign) MERNoticeBarDefaultType defaultType;

#pragma mark - functions

- (instancetype)initWithTitle:(NSString *)title
                    textColor:(UIColor *)textColor
              backgroundColor:(UIColor *)backgroundColor;

- (instancetype)initWithTitle:(NSString *)title
                        image:(UIImage *)image
                    textColor:(UIColor *)textColor
              backgroundColor:(UIColor *)backgroundColor;

- (instancetype)initWithTitle:(NSString *)title
                    textColor:(UIColor *)textColor
              backgroundColor:(UIColor *)backgroundColor
                     barStyle:(MERNoticeBarStyle)barStyle;

- (instancetype)initWithTitle:(NSString *)title
                        image:(UIImage *)image
                    textColor:(UIColor *)textColor
              backgroundColor:(UIColor *)backgroundColor
                     barStyle:(MERNoticeBarStyle)barStyle;

- (instancetype)initWithTitle:(NSString *)title
                        image:(UIImage *)image
                    textColor:(UIColor *)textColor
              backgroundColor:(UIColor *)backgroundColor
                     barStyle:(MERNoticeBarStyle)barStyle
                animationType:(MERNoticeBarAnimationType)animationType;

- (instancetype)initWithDefaultType:(MERNoticeBarDefaultType)defaultType;

- (CGAffineTransform)noticeBarViewTransformWithFrame:(CGRect)frame;

- (CGFloat)imageOriginYFromSuperViewHeight:(CGFloat)superViewHeight imageHeight:(CGFloat)imageHeight;

- (MERStatusBarStylesChanges)statusStylesChangesByCurrentStatus:(UIStatusBarStyle)currentStatus;

@end
