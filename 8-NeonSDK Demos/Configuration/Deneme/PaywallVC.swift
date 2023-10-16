//
//  PaywallVC.swift
//  Deneme
//
//  Created by Eken Özlü on 12.10.2023.
//

import UIKit
import NeonSDK
import SnapKit

class PaywallVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .red
        
        let button = NeonButton(type: .system)
        button.setTitle("PAY PREMIUM", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(45)
        }
    }
    
    @objc func buttonTapped(_ sender : NeonButton) {
        let homeVC = HomeVC()
        homeVC.modalPresentationStyle = .fullScreen
        self.present(homeVC, animated: true)
        Neon.onboardingCompleted()
        
    }

}
