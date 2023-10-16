//
//  ViewController.swift
//  Crashlytics Demo
//
//  Created by Eken Özlü on 11.10.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .white
        
        let button = UIButton(type: .roundedRect)
        button.setTitle("Test Crash", for: [])
        button.addTarget(self, action: #selector(crashButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(45)
        }
        
    }
    
    @objc func crashButtonTapped(_ sender: UIButton) {
        let numbers = [0]
        let _ = numbers[1]
    }
}

