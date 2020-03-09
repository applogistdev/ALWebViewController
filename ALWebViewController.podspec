#
# Be sure to run `pod lib lint ALWebViewController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ALWebViewController'
  s.version          = '0.2.0'
  s.summary          = 'Simple and Ready to Use WebViewController'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "Loading web url never been easier. Simple and Ready to Use WebViewController"

  s.homepage         = 'https://github.com/applogistdev/ALWebViewController'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Soner Güler' => 'soner.guler@applogist.com', "Ünal Çelik" => "unal.celik@applogist.com" }
  s.source           = { :git => 'https://github.com/applogistdev/ALWebViewController.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/sonifex'

  s.ios.deployment_target = '9.3'

  s.source_files = 'ALWebViewController/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ALWebViewController' => ['ALWebViewController/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'WebKit'
  s.swift_version = "5"
  # s.dependency 'AFNetworking', '~> 2.3'
end
