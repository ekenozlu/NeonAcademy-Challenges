//
//  OnboardingVC.swift
//  Neon SplashVC
//
//  Created by Eken Özlü on 17.10.2023.
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
        view.backgroundColor = .green
        
        let progressBar = NeonGradientProgressBar()
        progressBar.gradientColors = [.black,.blue,.red]
        progressBar.setProgress(1, animated: true)
        progressBar.layer.cornerRadius = 3
        progressBar.clipsToBounds = true
        progressBar.animationDuration = 3
        view.addSubview(progressBar)
        progressBar.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(120)
            make.height.equalTo(6)
        }
    }
}
