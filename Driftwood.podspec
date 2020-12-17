Pod::Spec.new do |s|
  s.name                    = 'Driftwood'
  s.version                 = '5.3.1'
  s.summary                 = 'A lightweight, Swift library for AutoLayout.'
  s.homepage                = 'https://github.com/wlgemini/Driftwood'
  s.license                 = { :type => 'MIT', :file => 'LICENSE' }
  s.author                  = { 'wlgemini' => 'wangluguang@live.com' }
  s.source                  = { :git => 'https://github.com/wlgemini/Driftwood.git', :tag => s.version.to_s }
  
  s.swift_version           = ['5.3']

  s.ios.deployment_target   = '8.0'
  s.osx.deployment_target   = '10.11'
  s.tvos.deployment_target  = '9.0'
  
  s.source_files            = 'Driftwood/*.swift'
end
