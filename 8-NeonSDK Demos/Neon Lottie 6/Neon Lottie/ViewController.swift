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
        
        let featuresView = NeonPaywallFeaturesView()
        featuresView.featureTextColor = .black
        featuresView.featureIconBackgroundColor = .lightGray
        featuresView.featureIconTintColor = .black
        view.addSubview(featuresView)
        featuresView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(100)
            make.height.equalTo(100)
        }
        
        featuresView.addFeature(title: "Detect & Remove Similar Photos",
                                icon: UIImage(systemName: "star.fill")!)
        
        featuresView.addFeature(title: "Free Up Storage & Save Time",
                                icon: UIImage(systemName: "trash.fill")!)
        featuresView.addFeature(title: "Compress Large Videos & Photos",
                                icon: UIImage(systemName: "video.bubble.fill")!)
        
    }
    
    
}


#Preview{
    ViewController()
}
