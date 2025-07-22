source 'https://github.com/CocoaPods/Specs.git'

use_frameworks! :linkage => :static

project 'test-yandex-sdk.xcodeproj'

platform :ios, :deployment_target => '13.0'

install! 'cocoapods',
         :integrate_targets => false


target 'default' do
    pod 'YandexMobileAds'
    pod 'YandexMobileAdsInstream'
end



post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
      config.build_settings['BUILD_DIR'] = '$(PODS_ROOT)/prebuild/'
    end
  end
end