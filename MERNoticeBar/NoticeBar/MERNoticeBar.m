//
//  MERNoticeBar.m
//  MERNoticeBar
//
//  Created by mervin on 2017/5/11.
//  Copyright © 2017年 mervin. All rights reserved.
//

#import "MERNoticeBar.h"

static NSString *const MERNoticeBarAfterQueueNameString = @"con.mervin1024.MERNoticeBar.MERNoticeBar";

@implementation MERNoticeBar

#pragma mark - Initialization

- (instancetype)initWithTitle:(NSString *)title defaultType:(MERNoticeBarDefaultType)defaultType {
    MERNoticeBarConfig *config = [[MERNoticeBarConfig alloc] initWithDefaultType:defaultType];
    config.title = title;
    return [self initWithConfig:config];
}

- (instancetype)initWithConfig:(MERNoticeBarConfig *)config {
    self = [super initWithFrame:config.barProperties.viewFrame];
    if (self) {
        _config = config;
        self.backgroundColor = config.backgroundColor;
        self.layer.shadowOffset = CGSizeMake(0, config.barProperties.shadowOffSetY);
        self.layer.shadowColor = [UIColor lightGrayColor].CGColor;
        self.layer.shadowRadius = 5;
        self.layer.shadowOpacity = 0.44;
        [self configureSubviews];
    }
    return self;
}

- (void)configureSubviews {
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.text = _config.title;
    _titleLabel.textColor = _config.textColor;
    _titleLabel.minimumScaleFactor = _config.barProperties.fontSizeScaleFactor;
    _titleLabel.adjustsFontSizeToFitWidth = YES;
    _titleLabel.font = _config.barProperties.textFont;
    [self addSubview:_titleLabel];
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;

    CGFloat titleLabelOriginX = 0;
    CGFloat titleLabelOriginY = 0;
    CGFloat titleLabelHeight = 0;
    CGFloat titleLabelWidth = 0;
    
    BOOL needImage = _config.image && _config.barStyle != MERNoticeBarStyleOnStatusBar && _config.barStyle != MERNoticeBarStyleBelowStatusBar;
    if (needImage) {
        _imageView = [[UIImageView alloc] initWithImage:_config.image];
        [self addSubview:_imageView];
        
        CGFloat imageWidth = 20;
        CGFloat imageOriginX = _config.margin + 10;
        CGFloat imageOriginY = [_config imageOriginYFromSuperViewHeight:CGRectGetHeight(self.bounds) imageHeight:imageWidth];
        [_imageView setFrame:CGRectMake(imageOriginX, imageOriginY, imageWidth, imageWidth)];
        
        titleLabelOriginX = CGRectGetMaxX(_imageView.frame) + _config.margin + 10;
        titleLabelOriginY = CGRectGetMinY(_imageView.frame);
        titleLabelWidth = screenWidth - titleLabelOriginX - _config.margin - 10;
        titleLabelHeight = CGRectGetHeight(_imageView.frame);
        _titleLabel.textAlignment = NSTextAlignmentLeft;
    } else {
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        
        titleLabelHeight = 25;
        titleLabelWidth = screenWidth - _config.margin * 2;
        titleLabelOriginX = _config.margin;
        titleLabelOriginY = [_config imageOriginYFromSuperViewHeight:CGRectGetHeight(self.bounds) imageHeight:titleLabelHeight];
    }
    [_titleLabel setFrame:CGRectMake(titleLabelOriginX, titleLabelOriginY, titleLabelWidth, titleLabelHeight)];
}

#pragma mark - Public

- (void)showAnimationCompleted:(noticeBarCompleted)completed {
    [self showWithDuration:0.8 completed:completed];
}

- (void)showWithDuration:(NSTimeInterval)duration completed:(noticeBarCompleted)completed {
    UIStatusBarStyle appStatusBarStyle = [UIApplication sharedApplication].statusBarStyle;
//    __weak typeof(&*self)weakSelf = self;
    [self showWithDuration:duration willShow:^{
//        __strong typeof(&*weakSelf)strongSelf = weakSelf;
        UIWindowLevel currentWindowLevel = self.config.beginWindowLevel;
        [UIApplication sharedApplication].keyWindow.windowLevel = currentWindowLevel;
        UIStatusBarStyle currentStatusBarStyle = [self.config statusStylesChangesByCurrentStatus:appStatusBarStyle].begin;
        [UIApplication sharedApplication].statusBarStyle = currentStatusBarStyle;
    } completed:^(BOOL finished) {
        if (completed) {
            completed(finished);
        }
        if (finished) {
            UIWindowLevel currentWindowLevel = self.config.endWindowLevel;
            [UIApplication sharedApplication].keyWindow.windowLevel = currentWindowLevel;
            UIStatusBarStyle currentStatusBarStyle = [self.config statusStylesChangesByCurrentStatus:appStatusBarStyle].end;
            [UIApplication sharedApplication].statusBarStyle = currentStatusBarStyle;
        }
    }];
}

- (void)showWithDuration:(NSTimeInterval)duration willShow:(void(^)(void))willShow completed:(noticeBarCompleted)completed {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    NSArray *subviews = keyWindow.subviews;
    if (subviews.count > 0) {
        for (UIView *view in subviews) {
            if ([view isKindOfClass:[self class]]) {
                [view removeFromSuperview];
            }
        }
    }
    willShow();
    [keyWindow addSubview:self];
    self.transform = [_config noticeBarViewTransformWithFrame:self.frame];
    [UIView animateWithDuration:0.4 delay:0.0 usingSpringWithDamping:0.58 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        if (finished) {
            const char *queueName = [MERNoticeBarAfterQueueNameString UTF8String];
            dispatch_queue_t afterQueue = dispatch_queue_create(queueName, NULL);
            dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC);
            dispatch_after(delayTime, afterQueue, ^{
                dispatch_async(dispatch_get_main_queue(), ^{
                    [UIView animateWithDuration:0.3 animations:^{
                        self.transform = [self.config noticeBarViewTransformWithFrame:self.frame];
                    } completion:^(BOOL finished) {
                        completed(finished);
                        if (finished) {
                            [self removeFromSuperview];
                        }
                    }];
                });
            });
            
        }
    }];
}

@end
