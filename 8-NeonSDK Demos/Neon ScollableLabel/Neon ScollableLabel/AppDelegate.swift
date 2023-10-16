//
//  AppDelegate.swift
//  Neon ScollableLabel
//
//  Created by Eken Özlü on 16.10.2023.
//

import UIKit
import NeonSDK
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Font.configureFonts(font: .Inter)
        window = UIWindow()
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        return true
    }


}

