//
//  ViewController.swift
//  Neon RevenueCat
//
//  Created by Eken Özlü on 17.10.2023.
//

import UIKit
import NeonSDK

class ViewController: UIViewController, RevenueCatManagerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RevenueCatManager.delegate = self
        packageFetched()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .red
    }
    
    func packageFetched() {
        if let price = RevenueCatManager.getPackagePrice(id: "proMonthly"){
            print("Price: \(price)")
        } else {
            print("hata")
            
        }
        
        if let monthlyPackage = RevenueCatManager.getPackage(id: "proMonthly"){
            print(monthlyPackage.localizedPriceString)
        }
        
    }
    
}

