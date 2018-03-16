# MERNoticeBar
一个风格类似于 QQ 的顶部导航栏信息提醒 view，使用 Objective-C 语言。

截屏示例
===

<p><img src="https://github.com/Mervin1024/MERNoticeBar/blob/master/Rources/notice_bar_iPhone6.gif?raw=true" width="20%" height="20%">
<img src="https://github.com/Mervin1024/MERNoticeBar/blob/master/Rources/notice_bar_iPhoneX.gif?raw=true" width="20%" height="20%"></p>
提示 : 如果需要应用内状态栏样式变化，需要在 "info.plist" 文件内设 "View controller-based status bar appearance" 为 "NO"。

另一个使用 Swift 编写的相似项目 'NoticeBar'
===
非常感谢 [@qiuncheng](https://github.com/qiuncheng) 为我提供的思路。
一开始我找到了 [@qiuncheng](https://github.com/qiuncheng) 所写的项目 [NoticeBar](https://github.com/qiuncheng/NoticeBar) , 但是这个项目仅支持 `swift`，不太满足于我当时的项目需求。所以我就参照 `NoticeBar`这个项目仿写了个`Objective-C`版本的。完成后我又根据自己实际的需求进行了部分的改动，加入了自己的一点想法。<p>
**如果你需要`Swift`版本的项目代码 , 你可以试试 [`NoticeBar`](https://github.com/qiuncheng/NoticeBar)**

支持
===

Objective-C & iOS 8+

安装&使用
===
#### CocoaPods
1. 在 Podfile 文件中添加 `pod 'MERNoticeBar'`  .
2. 运行 `pod install` 或 `pod update`.
3. `import MERNoticebar`

#### Manually
1. [下载](https://github.com/Mervin1024/MERNoticeBar/archive/master.zip) 完整项目。
2. 将 MERNoticeBar 文件夹拖拽到你的项目中去。
3. `import MERNoticebar`

示例
===
#### 默认样式


以这个默认样式为例: -> `MERNoticeBarDefaultTypeSuccess`:
```
// title : The message you want to show
// defaultType : Above four types with different style above.
[MERNoticeBar showAnimationWithTitle:"#message" defaultType: MERNoticeBarDefaultTypeSuccess completed:^(BOOL finished) {
// completed
}];
```
#### 自定义

你也可以自定义 `MERNoticeBarConfig`



```

MERNoticeBarConfig *config = [[MERNoticeBarConfig alloc] initWithTitle:(NSString *)
                                                                     image:(UIImage *)
                                                                 textColor:(UIColor *)
                                                           backgroundColor:(UIColor *)
                                                                  barStyle:(MERNoticeBarStyle)
                                                             animationType:(MERNoticeBarAnimationType)];
[MERNoticeBar showAnimationWithConfig:config completed:nil];

```

待做
===
- 支持自定义图片背景
- 支持自定义的 contentView

联系
===
如果你对这个项目有什么意见或建议， [请告诉我](mailto:mervin931208@gmail.com)。或者 pull request.<p>

- 邮箱: mervin931208@gmail.com


License
===
[![](https://camo.githubusercontent.com/5e085da09b057cc65da38f334ab63f0c2705f46a/68747470733a2f2f75706c6f61642e77696b696d656469612e6f72672f77696b6970656469612f636f6d6d6f6e732f7468756d622f662f66382f4c6963656e73655f69636f6e2d6d69742d38387833312d322e7376672f31323870782d4c6963656e73655f69636f6e2d6d69742d38387833312d322e7376672e706e67)](https://raw.githubusercontent.com/Mervin1024/MERNoticeBar/master/LICENSE)

MERNoticeBar is provided under the MIT license. See LICENSE file for details.
