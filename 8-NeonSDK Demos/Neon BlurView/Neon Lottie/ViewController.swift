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
        
        let blurView  = NeonBlurView()
        blurView.colorTint = .black
        blurView.colorTintAlpha = 0.2
        blurView.blurRadius = 30
        blurView.scale = 1
        view.addSubview(blurView)
        blurView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalTo(200)
        }
        
    }
    
    
}

