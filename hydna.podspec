#
# Be sure to run `pod spec lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about the attributes see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = "hydna"
  s.version          = "0.1.0"
  s.summary          = "hydna library"
  s.description      = "Library to connect with hydna"
  s.homepage         = "http://hydna.com/"
  s.license          = 'MIT'
  s.author           = { "skaggivara" => "isak.wistrom@gmail.com" }
  s.source           = { :git => "https://github.com/hydna/hydna-pod", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/hydna'

  # s.platform     = :ios, '5.0'
  # s.ios.deployment_target = '5.0'
  # s.osx.deployment_target = '10.7'
  s.requires_arc = false

  s.source_files = 'Classes'
  s.resources = 'Assets'

  # s.ios.exclude_files = 'Classes/osx'
  # s.osx.exclude_files = 'Classes/ios'
  s.public_header_files = 'Classes/*.h'
  s.frameworks = 'CFNetwork'
  # s.dependency 'JSONKit', '~> 1.4'
end
