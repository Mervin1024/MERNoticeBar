//
//  MERNoticeBar.h
//  MERNoticeBar
//
//  Created by mervin on 2017/5/11.
//  Copyright © 2017年 mervin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MERNoticeBarConfig.h"

typedef void(^noticeBarCompleted)(BOOL finished);

@interface MERNoticeBar : UIView

@property (nonatomic, readonly, strong) MERNoticeBarConfig *config;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *imageView;

- (instancetype)initWithTitle:(NSString *)title defaultType:(MERNoticeBarDefaultType)defaultType;
- (instancetype)initWithConfig:(MERNoticeBarConfig *)config;

- (void)showAnimationCompleted:(noticeBarCompleted)completed;// default duration is 0.8s
- (void)showWithDuration:(NSTimeInterval)duration completed:(noticeBarCompleted)completed;

@end
