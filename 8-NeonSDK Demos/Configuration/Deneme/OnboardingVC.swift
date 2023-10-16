//
//  OnboardingVC.swift
//  Deneme
//
//  Created by Eken Özlü on 12.10.2023.
//

import UIKit
import NeonSDK
import SnapKit

class OnboardingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .blue
        
        let button = NeonButton(type: .system)
        button.setTitle("GO TO PAYWALL", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(45)
        }
    }
    
    @objc func buttonTapped(_ sender : NeonButton) {
        let paywallVC = PaywallVC()
        paywallVC.modalPresentationStyle = .fullScreen
        self.present(paywallVC, animated: true)
    }
}
