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
        
        let legalView = NeonLegalView()
        legalView.termsURL = "[https://www.neonapps.co/terms-of-use](https://www.neonapps.co/terms-of-use)"
        legalView.privacyURL = "[https://www.neonapps.co/privacy-policy](https://www.neonapps.co/privacy-policy)"
        legalView.textColor = .black
        
        view.addSubview(legalView)
        legalView.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
            make.height.equalTo(50)
        }
    }
    
    
}


#Preview{
    ViewController()
}
