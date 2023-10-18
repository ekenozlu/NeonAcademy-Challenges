//
//  AppDelegate.swift
//  Neon AdaptyDemo
//
//  Created by Eken Özlü on 18.10.2023.
//

import UIKit
import NeonSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        AdaptyManager.configure(withAPIKey: "public_live_xvLQzSKk.GFCJiHAn39fpDVxzbKFn",
                                placementIDs: ["placement1"])
        return true
    }
}

