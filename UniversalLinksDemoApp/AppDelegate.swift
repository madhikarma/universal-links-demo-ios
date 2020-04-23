//
//  AppDelegate.swift
//  UniversalLinksDemoApp
//
//  Created by Shagun Madhikarmi on 23/04/2020.
//  Copyright © 2020 Shagun Madhikarmi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController(rootViewController: ViewController())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }

    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        // 1
        if userActivity.activityType == NSUserActivityTypeBrowsingWeb {
            if let url = userActivity.webpageURL,
                let components = URLComponents(url: url, resolvingAgainstBaseURL: true) {

                // TODO check path for vc
                let redViewController = RedViewController(text: components.path)

                // iOS 13 scene
//                guard let sceneDelegate = application.connectedScenes.first?.delegate as? UIWindowSceneDelegate else {
//                    fatalError("Expected scene delegate")
//                }
//
//                guard let navigationController = sceneDelegate.window??.rootViewController as? UINavigationController else {
//                    fatalError("Expected navigation controller")
//                }
                
                // iOS < 13 app delegate
                guard let navigationController = window?.rootViewController as? UINavigationController else {
                    fatalError("Expected navigation controller")
                }

                navigationController.pushViewController(redViewController, animated: true)
                return true
            }
        }
        
//        if let webpageUrl = URL(string: "https://universal-links-demo.com") {
//            application.open(webpageUrl)
//        }
        return false
    }
}
