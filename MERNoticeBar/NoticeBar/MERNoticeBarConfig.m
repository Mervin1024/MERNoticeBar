//
//  MERNoticeBarConfig.m
//  MERNoticeBar
//
//  Created by mervin on 2017/5/11.
//  Copyright © 2017年 mervin. All rights reserved.
//

#import "MERNoticeBarConfig.h"

#define MERDefaultTextColor                 [UIColor blackColor]
#define MERDefaultBackgroundColor           [UIColor whiteColor]
#define MERDefaultNoticeBarStyle            0
#define MERDefaultNoticeBarAnimationType    0
#define MERNoticeBarFrameOffset             50

@implementation MERNoticeBarConfig

#pragma mark - setter & getter

- (void)setDefaultType:(MERNoticeBarDefaultType)defaultType {
    _defaultType = defaultType;
    UIImage *image;
    UIColor *textColor;
    UIColor *backgroundColor;
    
    switch (defaultType) {
        case MERNoticeBarDefaultTypeInfo: {
            image = [UIImage imageNamed:@"MERNoticeBar_info"];
            textColor = [UIColor blackColor];
            backgroundColor = [UIColor whiteColor];
        }
            break;
            
        case MERNoticeBarDefaultTypeAttention: {
            image = [UIImage imageNamed:@"MERNoticeBar_attention"];
            textColor = [UIColor whiteColor];
            backgroundColor = [UIColor orangeColor];
        }
            break;
            
        case MERNoticeBarDefaultTypeSuccess: {
            image = [UIImage imageNamed:@"MERNoticeBar_success"];
            textColor = [UIColor blackColor];
            backgroundColor = [UIColor whiteColor];
        }
            break;
            
        case MERNoticeBarDefaultTypeError: {
            image = [UIImage imageNamed:@"MERNoticeBar_error"];
            textColor = [UIColor whiteColor];
            backgroundColor = [UIColor colorWithRed:249/255.0 green:66/255.0 blue:47/255.0 alpha:1];
        }
            break;
    }
    self.image = image;
    self.textColor = textColor;
    self.backgroundColor = backgroundColor;
}

- (MERNoticeBarProperties)barProperties {
    MERNoticeBarProperties properties;

    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    BOOL isiPhoneX = (screenWidth == 375 && screenHeight == 812 ? YES : NO);
    CGFloat statusBarHeight = isiPhoneX ? 44 : 20;
    CGFloat navigationAndStatusHeight = statusBarHeight + 44;
    CGFloat tabbarHeight = isiPhoneX ? (49 + 34) : 49;
    switch (self.barStyle) {
        case MERNoticeBarStyleOnNavigationBar:
            properties.shadowOffSetY = 0.5;
            properties.fontSizeScaleFactor = 0.55;
            properties.textFont = [UIFont systemFontOfSize:16];
            properties.viewFrame = CGRectMake(-MERNoticeBarFrameOffset, -MERNoticeBarFrameOffset, screenWidth+MERNoticeBarFrameOffset*2, navigationAndStatusHeight+MERNoticeBarFrameOffset);
            break;
        case MERNoticeBarStyleOnStatusBar:
            properties.shadowOffSetY = 0.5;
            properties.fontSizeScaleFactor = 0.75;
            properties.textFont = [UIFont systemFontOfSize:11];
            properties.viewFrame = CGRectMake(-MERNoticeBarFrameOffset, -MERNoticeBarFrameOffset, screenWidth+MERNoticeBarFrameOffset*2, statusBarHeight+MERNoticeBarFrameOffset);
            break;
        case MERNoticeBarStyleOnTabbar:
            properties.shadowOffSetY = -0.5;
            properties.fontSizeScaleFactor = 0.55;
            properties.textFont = [UIFont systemFontOfSize:15];
            properties.viewFrame = CGRectMake(-MERNoticeBarFrameOffset, screenHeight - tabbarHeight, screenWidth+MERNoticeBarFrameOffset*2, tabbarHeight+MERNoticeBarFrameOffset);
            break;
        case MERNoticeBarStyleBelowStatusBar:
            properties.shadowOffSetY = 0.5;
            properties.fontSizeScaleFactor = 0.75;
            properties.textFont = [UIFont systemFontOfSize:11];
            properties.viewFrame = CGRectMake(-MERNoticeBarFrameOffset, -MERNoticeBarFrameOffset, screenWidth+MERNoticeBarFrameOffset*2, statusBarHeight * 2+MERNoticeBarFrameOffset);
            break;
    }
    return properties;
}

- (UIWindowLevel)beginWindowLevel {
    if (self.barStyle == MERNoticeBarStyleOnStatusBar) {
        return UIWindowLevelStatusBar + 1;
    }
    return UIWindowLevelNormal;
}

- (UIWindowLevel)endWindowLevel {
    return UIWindowLevelNormal;
}

#pragma mark - Initialization

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _title = nil;
        _image = nil;
        _textColor = MERDefaultTextColor;
        _backgroundColor = MERDefaultBackgroundColor;
        _barStyle = MERDefaultNoticeBarStyle;
        _animationType = MERDefaultNoticeBarAnimationType;
        _margin = MERNoticeBarFrameOffset;
    }
    
    return self;
}

- (instancetype)initWithDefaultType:(MERNoticeBarDefaultType)defaultType {
    self = [[MERNoticeBarConfig alloc] initWithTitle:nil
                                           textColor:MERDefaultTextColor
                                     backgroundColor:MERDefaultBackgroundColor];
    [self setDefaultType:defaultType];
    return self;
}

- (instancetype)initWithTitle:(NSString *)title
                    textColor:(UIColor *)textColor
              backgroundColor:(UIColor *)backgroundColor {
    return [self initWithTitle:title
                         image:nil
                     textColor:textColor
               backgroundColor:backgroundColor];
}

- (instancetype)initWithTitle:(NSString *)title
                        image:(UIImage *)image
                    textColor:(UIColor *)textColor
              backgroundColor:(UIColor *)backgroundColor {
    return [self initWithTitle:title
                         image:image
                     textColor:textColor
               backgroundColor:backgroundColor
                      barStyle:MERDefaultNoticeBarStyle];
}

- (instancetype)initWithTitle:(NSString *)title
                    textColor:(UIColor *)textColor
              backgroundColor:(UIColor *)backgroundColor
                     barStyle:(MERNoticeBarStyle)barStyle {
    return [self initWithTitle:title
                         image:nil
                     textColor:textColor
               backgroundColor:backgroundColor
                      barStyle:barStyle];
}

- (instancetype)initWithTitle:(NSString *)title
                        image:(UIImage *)image
                    textColor:(UIColor *)textColor
              backgroundColor:(UIColor *)backgroundColor
                     barStyle:(MERNoticeBarStyle)barStyle {
    return [self initWithTitle:title
                         image:image
                     textColor:textColor
               backgroundColor:backgroundColor
                      barStyle:barStyle
                 animationType:MERDefaultNoticeBarAnimationType];
}

- (instancetype)initWithTitle:(NSString *)title
                        image:(UIImage *)image
                    textColor:(UIColor *)textColor
              backgroundColor:(UIColor *)backgroundColor
                     barStyle:(MERNoticeBarStyle)barStyle
                animationType:(MERNoticeBarAnimationType)animationType {
    self = [[MERNoticeBarConfig alloc] init];
    _title = title;
    _image = image;
    _textColor = textColor;
    _backgroundColor = backgroundColor;
    _barStyle = barStyle;
    _animationType = animationType;
    return self;
}

#pragma mark - Public

- (CGAffineTransform)noticeBarViewTransformWithFrame:(CGRect)frame {
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (self.animationType) {
        case MERNoticeBarAnimationTypeTop: {
            if (self.barStyle == MERNoticeBarStyleOnTabbar) {
                transform = CGAffineTransformMakeTranslation(0, frame.size.height-MERNoticeBarFrameOffset);
            } else {
                transform = CGAffineTransformMakeTranslation(0, -frame.size.height+MERNoticeBarFrameOffset);
            }
        }
            break;
            
        case MERNoticeBarAnimationTypeBottom: {
            if (self.barStyle == MERNoticeBarStyleOnTabbar) {
                transform = CGAffineTransformMakeTranslation(0, frame.size.height-MERNoticeBarFrameOffset);
            } else {
                transform = CGAffineTransformMakeTranslation(0, -frame.size.height+MERNoticeBarFrameOffset);
            }
        }
            break;
            
        case MERNoticeBarAnimationTypeLeft: {
            transform = CGAffineTransformMakeTranslation(-frame.size.width+MERNoticeBarFrameOffset, 0);
        }
            break;
            
        case MERNoticeBarAnimationTypeRight: {
            transform = CGAffineTransformMakeTranslation(frame.size.width-MERNoticeBarFrameOffset, 0);
        }
            break;
    }
    return transform;
}

- (CGFloat)imageOriginYFromSuperViewHeight:(CGFloat)superViewHeight imageHeight:(CGFloat)imageHeight {
    CGFloat y = 0;
    switch (self.barStyle) {
        case MERNoticeBarStyleOnNavigationBar:
            y = (superViewHeight - MERNoticeBarFrameOffset - imageHeight) * 0.5 + 10 + MERNoticeBarFrameOffset;
            break;
        case MERNoticeBarStyleOnStatusBar:
            y = (superViewHeight - MERNoticeBarFrameOffset - imageHeight) * 0.5 + MERNoticeBarFrameOffset;
            break;
        case MERNoticeBarStyleOnTabbar:
            y = (superViewHeight - MERNoticeBarFrameOffset - imageHeight) * 0.5;
            break;
        case MERNoticeBarStyleBelowStatusBar:
            y = ((superViewHeight - MERNoticeBarFrameOffset) * 0.5 - imageHeight) * 0.5 + (superViewHeight - MERNoticeBarFrameOffset) * 0.5 + MERNoticeBarFrameOffset;
            break;
    }
    return y;
}

- (MERStatusBarStylesChanges)statusStylesChangesByCurrentStatus:(UIStatusBarStyle)currentStatus{
    MERStatusBarStylesChanges changes;
    if (self.barStyle == MERNoticeBarStyleOnTabbar) {
        changes.begin = currentStatus;
        changes.end = currentStatus;
        return changes;
    }
    if (currentStatus == UIStatusBarStyleDefault) {
        switch (self.defaultType) {
            case MERNoticeBarDefaultTypeInfo: {
                changes.begin = UIStatusBarStyleDefault;
                changes.end = UIStatusBarStyleDefault;
            }
                break;
                
            case MERNoticeBarDefaultTypeAttention: {
                changes.begin = UIStatusBarStyleLightContent;
                changes.end = UIStatusBarStyleDefault;
            }
                break;
                
            case MERNoticeBarDefaultTypeSuccess: {
                changes.begin = UIStatusBarStyleDefault;
                changes.end = UIStatusBarStyleDefault;
            }
                break;
                
            case MERNoticeBarDefaultTypeError: {
                changes.begin = UIStatusBarStyleLightContent;
                changes.end = UIStatusBarStyleDefault;
            }
                break;
        }
    } else if (currentStatus == UIStatusBarStyleLightContent) {
        switch (self.defaultType) {
            case MERNoticeBarDefaultTypeInfo: {
                changes.begin = UIStatusBarStyleDefault;
                changes.end = UIStatusBarStyleLightContent;
            }
                break;
                
            case MERNoticeBarDefaultTypeAttention: {
                changes.begin = UIStatusBarStyleLightContent;
                changes.end = UIStatusBarStyleLightContent;
            }
                break;
                
            case MERNoticeBarDefaultTypeSuccess: {
                changes.begin = UIStatusBarStyleDefault;
                changes.end = UIStatusBarStyleLightContent;
            }
                break;
                
            case MERNoticeBarDefaultTypeError: {
                changes.begin = UIStatusBarStyleLightContent;
                changes.end = UIStatusBarStyleLightContent;
            }
                break;
        }
    } else {
        changes.begin = currentStatus;
        changes.end = currentStatus;
    }
    
    return changes;
}

#pragma mark - Private

@end
