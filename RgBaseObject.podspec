Pod::Spec.new do |s|

  s.name         = "RgBaseObject"
  s.version      = "0.0.21"
  s.summary      = "基础组件"
  s.description  = <<-DESC
                    基础组件，初始化等等
                   DESC

  s.homepage     = "https://dazhongge.com"
  s.license      = "MIT"
  s.author       = { "Rogue" => "619455850@qq.com" }
  s.platform     = :ios, "9.0"
  s.ios.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/RogueAndy/RgBaseObject.git", :tag => "#{s.version}" }

  s.source_files  = "RgBaseObject/*" 
  s.public_header_files = "RgBaseObject/*.h"

  s.frameworks = "UIKit", "Foundation"
  s.requires_arc = true

  s.subspec 'Category' do |ss|
    ss.source_files = "RgBaseObject/Category/*"
    ss.public_header_files = "RgBaseObject/Category/*.h"
    ss.ios.frameworks = 'UIKit', 'Foundation'
    ss.dependency 'RgBaseObject/Tool'
  end

  s.subspec 'Tool' do |ss|
    ss.source_files = "RgBaseObject/Tool/*"
    ss.public_header_files = "RgBaseObject/Tool/*.h"
    ss.ios.frameworks = 'UIKit', 'Foundation'
  end
end
