//
//  AppDelegate.swift
//  BinanceExplorer
//
//  Created by Oh june Kwon on 2021/09/13.
//

import UIKit
import RIBs

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    private var appCoverWindow: UIWindow?
    private var appCoverVC: UIViewController?
    private var launchRouter: LaunchRouting?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        window.backgroundColor = .white
        if #available(iOS 13.0, *) {
          window.overrideUserInterfaceStyle = .light
        }
        
        let result = RootBuilder(dependency: AppComponent()).build()
        let launchRouter = result
        self.launchRouter = launchRouter
        launchRouter.launch(from: window)
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        if appCoverWindow != nil {
          appCoverWindow!.isHidden = true
          appCoverWindow!.rootViewController = nil
          appCoverWindow = nil
          appCoverVC = nil
        }
    }

    func applicationWillResignActive(_ application: UIApplication) {
      appCoverVC = AppCoverViewController()
      appCoverWindow = UIWindow(frame: UIScreen.main.bounds)
      let existingTopWindow = UIApplication.shared.windows.last
      appCoverWindow!.windowLevel = existingTopWindow!.windowLevel + 1
      appCoverVC!.view.frame = appCoverWindow!.bounds
      appCoverWindow!.rootViewController = appCoverVC!
      appCoverWindow!.makeKeyAndVisible()
    }

}

