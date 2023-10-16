//
//  ViewController.swift
//  RevenueCatApp
//
//  Created by Eken Özlü on 9.10.2023.
//

import UIKit
import RevenueCat
import SnapKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .white
        
        Purchases.shared.getCustomerInfo { info, error in
            guard let info = info, error == nil else { return }
            
            if info.entitlements.all["Premium Entitlement"]?.isActive == true {
                //PRESENT SECOND VC
                let secondVC = SecondVC()
                secondVC.modalPresentationStyle = .fullScreen
                self.present(secondVC, animated: true)
            }
            else {
                let subscribeButton = UIButton(type: .system)
                subscribeButton.setTitle("Subscribe", for: .normal)
                subscribeButton.setTitleColor(.black, for: .normal)
                subscribeButton.backgroundColor = .systemBlue
                subscribeButton.layer.borderColor = UIColor.black.cgColor
                subscribeButton.layer.borderWidth = 2
                subscribeButton.layer.cornerRadius = 8
                subscribeButton.addTarget(self, action: #selector(self.subscriptionTapped(_:)), for: .touchUpInside)
                self.view.addSubview(subscribeButton)
                subscribeButton.snp.makeConstraints { make in
                    make.centerX.equalToSuperview()
                    make.centerY.equalToSuperview()
                    make.width.equalToSuperview().multipliedBy(0.5)
                    make.height.equalTo(45)
                }
                
                let restorePurchaseButton = UIButton(type: .system)
                restorePurchaseButton.setTitle("Restore Purchase", for: .normal)
                restorePurchaseButton.setTitleColor(.black, for: .normal)
                restorePurchaseButton.backgroundColor = .lightGray
                restorePurchaseButton.layer.borderColor = UIColor.black.cgColor
                restorePurchaseButton.layer.borderWidth = 2
                restorePurchaseButton.layer.cornerRadius = 8
                restorePurchaseButton.addTarget(self, action: #selector(self.restoreTapped(_:)), for: .touchUpInside)
                self.view.addSubview(restorePurchaseButton)
                restorePurchaseButton.snp.makeConstraints { make in
                    make.centerX.equalToSuperview()
                    make.top.equalTo(subscribeButton.snp.bottom).offset(100)
                    make.width.equalToSuperview().multipliedBy(0.5)
                    make.height.equalTo(30)
                }
            }
        }
    }
    
    func fetchPackage(completion : @escaping (Package) -> Void) {
        Purchases.shared.getOfferings { offerings, error in
            guard let offerings = offerings, error == nil else { return }
            
            guard let package = offerings.all.first?.value.availablePackages.first else { return }
            completion(package)
        }
    }
    
    func purchase(package : Package) {
        Purchases.shared.purchase(package: package) { transaction, info, error, userCancelled in
            guard let transaction = transaction, let info = info, error == nil, !userCancelled else { return }
            //PRESENT SECOND VC
            let secondVC = SecondVC()
            secondVC.modalPresentationStyle = .fullScreen
            self.present(secondVC, animated: true)
        }
    }
    
    func restorePurchases() {
        Purchases.shared.restorePurchases { info, error in
            guard let info = info, error == nil else { return }
            if info.entitlements.all["Premium Entitlement"]?.isActive == true {
                //PRESENT SECOND VC
                let secondVC = SecondVC()
                secondVC.modalPresentationStyle = .fullScreen
                self.present(secondVC, animated: true)
            }
        }
    }
    
    @objc func subscriptionTapped(_ sender : UIButton) {
        //Purchase
        fetchPackage { package in
            self.purchase(package: package)
        }
    }
    
    @objc func restoreTapped(_ sender : UIButton) {
        //Restore
        restorePurchases()
    }
    
}
