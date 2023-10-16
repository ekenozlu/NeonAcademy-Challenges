//
//  ViewController.swift
//  Neon Lottie
//
//  Created by Eken Özlü on 13.10.2023.
//

import UIKit
import NeonSDK
import SnapKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .white
        
        let button = NeonButton(type: .system)
        button.setTitle("SHOW FULL SCREEN ANIMATION", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        view.addSubview(button)
        
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(100)
            make.width.equalTo(250)
            make.height.equalTo(50)
        }
        
    }
    
    @objc func buttonTapped(_ sender : NeonButton) {
        LottieManager.showFullScreenLottie(animation: .downloading, color: .red, playOnce: false)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            LottieManager.removeFullScreenLottie()
        }
    }
    
}

