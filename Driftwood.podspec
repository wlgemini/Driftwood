#
# Be sure to run `pod lib lint Driftwood.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name                    = 'Driftwood'
  s.version                 = '0.1.0'
  s.summary                 = 'A lightweight, pure-Swift library for AutoLayout.'
  s.homepage                = 'https://github.com/wangluguang@live.com/Driftwood'
  s.license                 = { :type => 'MIT', :file => 'LICENSE' }
  s.author                  = { 'wlgemini' => 'wangluguang@live.com' }
  s.source                  = { :git => 'https://github.com/wangluguang@live.com/Driftwood.git', :tag => s.version.to_s }
  s.ios.deployment_target   = '8.0'
  s.source_files            = 'Driftwood/Classes/**/*'
  s.swift_version           = '4.0'
  # s.resource_bundles = {
  #   'Driftwood' => ['Driftwood/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
end
