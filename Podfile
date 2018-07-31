# Uncomment the next line to define a global platform for your project
source 'https://github.com/CocoaPods/Specs'

inhibit_all_warnings!

platform :ios, '10.0'

use_frameworks!

target 'MyRefah' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for iTik

  pod 'CryptoSwift','~> 0.7.0'

  pod 'SWXMLHash','~> 4.0.0'

  pod 'DCKit'

  pod 'CHIPageControl/Aji'

  pod 'MapKitGoogleStyler'
  
  pod 'Toast-Swift'
  
  pod 'IQKeyboardManagerSwift'
  
  pod 'AlamofireNetworkActivityLogger', '~> 2.3'
  
  pod 'CodableAlamofire'
  
  pod 'UIColor_Hex_Swift', '~> 4.0.1'
  
  pod 'Gallery'
  
  pod 'IGRPhotoTweaks', '~> 1.0.0'
  
  pod 'Kingfisher', '~> 4.0'
  
  pod 'BvMapCluster'
  
  pod 'ObjectMapper', '~> 3.1'
  
  pod 'OneSignal'

  pod 'AFDateHelper', '~> 4.2.2'
  
  pod 'UICheckbox.Swift'
  
  pod 'PagingTableView'
  
  pod 'SACodedTextField'
  
  pod 'NVActivityIndicatorView'
  
  pod 'Spring', :git => 'https://github.com/MengTo/Spring.git'
  
end


post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings.delete('CODE_SIGNING_ALLOWED')
            config.build_settings.delete('CODE_SIGNING_REQUIRED')
        end
    end
    installer.pods_project.build_configurations.each do |config|
        config.build_settings.delete('CODE_SIGNING_ALLOWED')
        config.build_settings.delete('CODE_SIGNING_REQUIRED')
    end
end
