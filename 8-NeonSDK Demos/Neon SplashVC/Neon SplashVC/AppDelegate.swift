//
//  AppDelegate.swift
//  Neon SplashVC
//
//  Created by Eken Özlü on 17.10.2023.
//

import UIKit
import NeonSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Font.configureFonts(font: .Inter)
        let splashVC = NeonSplashVC(appIcon: UIImage(systemName: "square.and.arrow.up.circle.fill")!, appName: "Deneme", progressBarColors: [UIColor.black, UIColor.green],animationDuration: 3)
        
        Neon.configure(window: &window, onboardingVC: OnboardingVC(), paywallVC: PaywallVC(), homeVC: ViewController(),splashVC: splashVC)
        return true
    }

}

