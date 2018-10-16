#
# Be sure to run `pod lib lint LSCategory.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LSCategory'
  s.version          = '0.1.0'
  s.summary          = '工作中常用的工具类整理(Category)'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
此工具类包含Foundation框架下的NSString,NSDate,NSData,NSArry,NSDictionary等，UIKit框架下的UIImage,UIView,UIColor,UITextView,UIAlertView等类别，方便以后开发。
                       DESC

  s.homepage         = 'https://github.com/bobtaocool/LSCategory'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '陶冬波' => '785429438@qq.com' }
  s.source           = { :git => 'https://github.com/bobtaocool/LSCategory.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'LSCategory/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LSCategory' => ['LSCategory/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
  # s.dependency 'AFNetworking', '~> 2.3'
end
