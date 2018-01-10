# MERNoticeBar
A NoticeBar similar with QQ Navigationbar notice view,written by Objective-C.

ScreenShots
===

<p><img src="https://github.com/Mervin1024/MERNoticeBar/blob/master/Rources/notice_bar_iPhone6.gif?raw=true" width="20%" height="20%">
<img src="https://github.com/Mervin1024/MERNoticeBar/blob/master/Rources/notice_bar_iPhoneX.gif?raw=true" width="20%" height="20%"></p>
tips : Please set the "View controller-based status bar appearance" to "NO" in the "info.plist",otherwise the status bar style can not be changed.

Another 'NoticeBar' project by swift
===
At first I find the [NoticeBar](https://github.com/qiuncheng/NoticeBar) project by [@qiuncheng](https://github.com/qiuncheng) , but it just support `swift`.So I wrote this Objective-C version according to `NoticeBar`.After that I added some of my own ideas in this project.<p>
**If you want a swift version , you can try the [`NoticeBar`](https://github.com/qiuncheng/NoticeBar)**

Support
===

Objective-C & iOS 8+

Installation
===
#### CocoaPods
1. add `pod 'MERNoticeBar'` to your Podfile.
2. Run `pod install` OR `pod update`.
3. `import MERNoticebar`

#### Manually
1. [Download](https://github.com/Mervin1024/MERNoticeBar/archive/master.zip) the full file.
2. Drag the MERNoticeBar folder to your project.

Example
===
#### Default type


How to use? For example: -> `MERNoticeBarDefaultTypeSuccess`:
```
// title : The message you want to show
// defaultType : Above four types with different style above.
[MERNoticeBar showAnimationWithTitle:"#message" defaultType: MERNoticeBarDefaultTypeSuccess completed:^(BOOL finished) {
                // completed
 }];
```
#### Custom

Also you can custom `MERNoticeBarConfig`


```

MERNoticeBarConfig *config = [[MERNoticeBarConfig alloc] initWithTitle:(NSString *)
                                                                     image:(UIImage *)
                                                                 textColor:(UIColor *)
                                                           backgroundColor:(UIColor *)
                                                                  barStyle:(MERNoticeBarStyle)
                                                             animationType:(MERNoticeBarAnimationType)];
[MERNoticeBar showAnimationWithConfig:config completed:nil];

```

ToDo
===
- Custom Background image
- Custom content view

Contact
===
If you have a new idea about this project, [Please let me know.](mailto:mervin1024@163.com) OR pull request.<p>

- Email: mervin931208@gmail.com
- Email: mervin1024@163.com


License
===
[![](https://camo.githubusercontent.com/5e085da09b057cc65da38f334ab63f0c2705f46a/68747470733a2f2f75706c6f61642e77696b696d656469612e6f72672f77696b6970656469612f636f6d6d6f6e732f7468756d622f662f66382f4c6963656e73655f69636f6e2d6d69742d38387833312d322e7376672f31323870782d4c6963656e73655f69636f6e2d6d69742d38387833312d322e7376672e706e67)](https://raw.githubusercontent.com/Mervin1024/MERNoticeBar/master/LICENSE)

MERNoticeBar is provided under the MIT license. See LICENSE file for details.