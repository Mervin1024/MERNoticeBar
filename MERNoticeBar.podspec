Pod::Spec.new do |s|

  s.name         = "MERNoticeBar"
  s.version      = "0.0.1"
  s.summary      = "A simple NoticeBar that can automatically disappear with animation."
  s.description  = <<-DESC
                   A simple NoticeBar that can automatically disappear with animation.
                   DESC

  s.homepage     = "https://github.com/Mervin1024/MERNoticeBar"
  s.license      = "MIT"
  s.author             = { "马遥" => "mervin1024@163.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/Mervin1024/MERNoticeBar.git" }

  s.source_files  = "MERNoticeBar", "MERNoticeBar/NoticeBar/*.{h,m}"
  s.resources = "MERNoticeBar/NoticeBar/*.bundle"

  s.framework  = "UIKit"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
