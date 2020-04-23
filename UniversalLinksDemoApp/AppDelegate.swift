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
    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        true
    }

    // MARK: UISceneSession Lifecycle

    func application(_: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options _: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_: UIApplication, didDiscardSceneSessions _: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    func application(
        _ application: UIApplication,
        continue userActivity: NSUserActivity,
        restorationHandler _: @escaping ([UIUserActivityRestoring]?
        ) -> Void
    ) -> Bool {
        // 1
        if userActivity.activityType == NSUserActivityTypeBrowsingWeb {
            if let url = userActivity.webpageURL,
                let components = URLComponents(url: url, resolvingAgainstBaseURL: true) {
                
                // TODO check path for vc
                let redViewController = RedViewController(text: components.path)
                
                guard let sceneDelegate = application.connectedScenes.first?.delegate as? UIWindowSceneDelegate else {
                    fatalError("Expected scene delegate")
                }
                
                guard let navigationController = sceneDelegate.window??.rootViewController as? UINavigationController else {
                    fatalError("Expected navigation controller")
                }
                navigationController.pushViewController(redViewController, animated: true)
                return true
            }
        }
        
//        if let webpageUrl = URL(string: "https://universal-links-demo.com") {
//            application.open(webpageUrl)
//
//        }
        return false
    }
}
