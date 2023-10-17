//
//  ViewController.swift
//  Neon ViewController
//
//  Created by Eken Özlü on 16.10.2023.
//

import UIKit
import NeonSDK
import SnapKit

class ViewController: NeonViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .red
        
        mainStack.spacing = 20
        
        let label = UILabel()
        label.text = "Hello, world!"
        
        mainStack.addArrangedSubview(label)
        label.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(30)
        }
    }


}
