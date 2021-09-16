platform :ios, '10.0'
use_frameworks!
inhibit_all_warnings!

post_install do |pi|
  pi.pods_project.targets.each do |t|
    t.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '10.0'
    end
  end
end

def common_pods_for_target
  # Rx
  pod 'RxSwift', '~> 5.1'
  pod 'RxCocoa', '~> 5.1'
  pod 'RxAppState'
  pod 'RxGesture'
  pod 'RxDataSources'

  # Architecture
  pod 'RIBs', :git => "https://github.com/uber/RIBs/", :tag => 'v0.10.1'
  pod 'ReactorKit'
  
  # Dependency Injection
  pod 'Swinject', '2.7.1'
  pod 'SwinjectAutoregistration', '2.7.0'
  
  # UI
  pod 'SnapKit', '5.0.1'
  
  # Utils
  pod 'R.swift', '5.2.2'
  pod 'SDWebImage', '5.9.4'
  
  # Network
  pod 'Alamofire', '5.4.3'
  
end

target 'BinanceExplorer' do
  common_pods_for_target
end

