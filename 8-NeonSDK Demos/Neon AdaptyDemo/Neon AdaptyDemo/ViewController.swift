//
//  ViewController.swift
//  Neon AdaptyDemo
//
//  Created by Eken Özlü on 18.10.2023.
//

import UIKit
import NeonSDK
import Adapty

class ViewController: UIViewController, AdaptyManagerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        
        AdaptyManager.delegate = self
        packageFetched()
    }
    
    func createUI() {
        view.backgroundColor = .green
        
        AdaptyManager.selectedPaywall = AdaptyManager.getPaywall(placementID: "placement1")
        if let paywall = AdaptyManager.selectedPaywall{
            Adapty.logShowPaywall(paywall)
        }
    }
    
    func packageFetched() {
        let price = AdaptyManager.getPackagePrice(id: "pro_monthly")
        print("price: \(price)")
        
        
        //if let monthlyPackage = AdaptyManager.getPackage(id: "MONTHLY_PRODUCT_ID"){
        //    let price = monthlyPackage.localizedPrice
        //}
        
    }
}

