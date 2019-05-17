#
# Be sure to run `pod lib lint DFAPIFramework.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DFAPIFramework'
  s.version          = '1.0'
  s.summary          = 'This SDK provides a set of methods for iOS applications to authenticate user, capture, save and retrieve data.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "Sole purpose of this SDK is to authenticate user, get captured asset data, save assets to the server and retrieve data from server.
"

  s.homepage         = 'https://github.com/anandramdeo-df/df-api-framework'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'rahulpanchal173' => 'rahul.panchal@ranosys.com' }
  s.source           = { :http => 'https://github.com/anandramdeo-df/df-documents/releases/download/1.0/DFAPIFramework.zip' }
  # s.social_media_url = 'https://twitter.com'

  s.ios.deployment_target = '10.0'
  s.ios.vendored_frameworks = 'DFAPIFramework.framework'
  s.swift_version = '4.0'

  # s.source_files = 'DFAPIFramework/Classes/**/*'
  
  # s.resource_bundles = {
  #   'DFAPIFramework' => ['DFAPIFramework/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Alamofire'
  s.dependency 'SwiftyJWT'
  s.dependency 'CryptoSwift', '~> 0.9.0'
  s.dependency 'BCryptSwift'

end
