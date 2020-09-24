#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_plugin_2.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_plugin_2'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter plugin 2.'
  s.description      = <<-DESC
A new Flutter plugin.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Tuan' => 'tuanhwing2014@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '10.0'

   s.preserve_paths = 'frameworks/VNPTframework2.framework'
   s.xcconfig = { 'OTHER_LDFLAGS' => '-framework VNPTframework2' }
   s.vendored_frameworks = 'frameworks/VNPTframework2.framework'

  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
  s.swift_version = '5.0'
end
