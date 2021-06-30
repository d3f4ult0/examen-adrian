//
//  AppDelegate.swift
//  examen
//
//  Created by BE-006 on 29/06/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var  window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
        let first_vc = SearchProductsRouter.createModule()
        let nav = UINavigationController(rootViewController: first_vc)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
        return true
    }
}

