//
//  AppDelegate.swift
//  Neon RevenueCat
//
//  Created by Eken Özlü on 17.10.2023.
//

import UIKit
import NeonSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        RevenueCatManager.configure(withAPIKey: "appl_qaPDRawoALxiOSsGPXTkfCFNaYY", products : ["proWeekly",
                                                                                                "proMonthly",
                                                                                                "proAnnually"])
        window = UIWindow()
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        
       
        return true
    }
    
}

