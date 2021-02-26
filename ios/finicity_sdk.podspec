#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint finicity_sdk.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'finicity_sdk'
  s.version          = '0.0.2'
  s.summary          = 'Flutter SDK for Finicity'
  s.description      = <<-DESC
Flutter SDK for Finicity
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'FinicityConnect'
  s.dependency 'Flutter'

  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
    s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
    s.swift_version = '5.0'
end
