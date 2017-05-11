//
//  MERNoticeBarEnum.h
//  MERNoticeBar
//
//  Created by mervin on 2017/5/11.
//  Copyright © 2017年 mervin. All rights reserved.
//

#ifndef MERNoticeBarEnum_h
#define MERNoticeBarEnum_h

typedef NS_ENUM(NSUInteger, MERNoticeBarDefaultType) {
    MERNoticeBarDefaultTypeSuccess,
    MERNoticeBarDefaultTypeAttention,
    MERNoticeBarDefaultTypeInfo,
    MERNoticeBarDefaultTypeError
};

typedef NS_ENUM(NSUInteger, MERNoticeBarAnimationType) {
    MERNoticeBarAnimationTypeTop,
    MERNoticeBarAnimationTypeBottom,
    MERNoticeBarAnimationTypeLeft,
    MERNoticeBarAnimationTypeRight
};

typedef NS_ENUM(NSUInteger, MERNoticeBarStyle) {
    MERNoticeBarStyleOnNavigationBar,
    MERNoticeBarStyleBelowStatusBar,
    MERNoticeBarStyleOnStatusBar,
    MERNoticeBarStyleOnTabbar
};

typedef struct {
    UIStatusBarStyle begin;
    UIStatusBarStyle end;
} MERStatusBarStylesChanges;

typedef struct {
    CGFloat shadowOffSetY;
    CGFloat fontSizeScaleFactor;
    __unsafe_unretained UIFont *textFont;
    CGRect  viewFrame;
} MERNoticeBarProperties;

#endif /* MERNoticeBarEnum_h */
