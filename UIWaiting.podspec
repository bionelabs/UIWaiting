Pod::Spec.new do |spec|

  spec.name         = "UIWaiting"
  spec.version      = "1.0"
  spec.summary      = "A CocoaPods library written in Swift"

  spec.description  = <<-DESC
This CocoaPods library helps you perform calculation.
                   DESC

  spec.homepage     = "https://github.com/onebuffer/UIWaiting"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Cao Phuoc Thanh" => "caophuocthanh@gmail.com" }

  spec.ios.deployment_target = "9.0"
  spec.swift_version = "4.2"

  spec.source        = { :git => "https://github.com/onebuffer/UIWaiting.git", :tag => "#{spec.version}" }
  spec.source_files  = "UIWaiting/**/*.{h,m,swift}"

end
