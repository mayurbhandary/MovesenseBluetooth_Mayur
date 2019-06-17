# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

target 'MovesenseBluetooth_Mayur' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for MovesenseBluetooth_Mayur

  pod 'Movesense', :git => 'ssh://git@altssh.bitbucket.org:443/suunto/movesense-mobile-lib.git', :branch => 'master'
  pod 'PromiseKit', '~> 6.8'
  pod 'SwiftyJSON', '~> 4.0'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '4.2'
    end
  end
end