#
#  Be sure to run `pod spec lint Square.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name                  = "Square"
  s.version               = "0.6.2"
  s.summary               = "Square's purpose is that easily use UIAlertController."

  s.homepage              = "https://github.com/devmjun/Square"
  s.license               = { :type => "MIT", :file => "LICENSE" }
  s.author                = { "Minjun Ju" => "dev.mjun@gmail.com" }

  s.source                = { :git => "https://github.com/devmjun/Square.git", 
                              :tag => s.version.to_s }
  s.source_files          = "Sources/**/*"
  s.exclude_files         = "Sources/**/*.plist"

  s.ios.deployment_target = "8.0"
  s.swift_version         = "5.0"
end
