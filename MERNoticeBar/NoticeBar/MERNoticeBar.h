//
//  MERNoticeBar.h
//  MERNoticeBar
//
//  Created by mervin on 2017/5/11.
//  Copyright © 2017年 mervin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MERNoticeBarConfig.h"

typedef void(^NoticeBarCompletedBlock)(BOOL finished);

/**
 MERNoticeBar 可自动消失的信息栏展示View
 */
@interface MERNoticeBar : UIView

@property (nonatomic, readonly, strong) MERNoticeBarConfig *config;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *imageView;

+ (instancetype)showAnimationWithTitle:(NSString *)title defaultType:(MERNoticeBarDefaultType)defaultType completed:(NoticeBarCompletedBlock)completed;
+ (instancetype)showAnimationWithConfig:(MERNoticeBarConfig *)config completed:(NoticeBarCompletedBlock)completed;

- (instancetype)initWithTitle:(NSString *)title defaultType:(MERNoticeBarDefaultType)defaultType;
- (instancetype)initWithConfig:(MERNoticeBarConfig *)config;

- (void)showAnimationCompleted:(NoticeBarCompletedBlock)completed;// default duration is 0.7s
- (void)showWithDuration:(NSTimeInterval)duration completed:(NoticeBarCompletedBlock)completed;

@end
