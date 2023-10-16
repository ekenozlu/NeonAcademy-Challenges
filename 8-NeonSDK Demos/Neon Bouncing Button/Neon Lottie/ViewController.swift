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
        
        Font.configureFonts(font: .Inter)
        
        let button = NeonBouncingButton()
        button.setTitle("BOUNCE", for: .normal)
        button.backgroundColor = .red
        button.bouncingDuration = 1.0
        button.bouncingScale = 4
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
    }
    
    
}


#Preview{
    ViewController()
}
