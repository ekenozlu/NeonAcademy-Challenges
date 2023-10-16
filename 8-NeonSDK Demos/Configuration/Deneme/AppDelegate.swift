//
//  AppDelegate.swift
//  Deneme
//
//  Created by Eken Özlü on 12.10.2023.
//

import UIKit
import NeonSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Neon.isUserPremium = true
        Neon.activatePremiumTest()
        Neon.configure(window: &window, onboardingVC: OnboardingVC(), paywallVC: PaywallVC(), homeVC: HomeVC())
        
        return true
    }
    
}

