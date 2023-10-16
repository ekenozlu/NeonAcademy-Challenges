//
//  ViewController.swift
//  Switches
//
//  Created by Eken Özlü on 4.10.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var backColorName : String? {
        didSet {
            view.backgroundColor = UIColor(named: backColorName!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        backColorName = "Deep Red"
        
        let uiswitch = UISwitch()
        uiswitch.isOn = false
        uiswitch.thumbTintColor = .black
        uiswitch.onTintColor = .darkGray
        uiswitch.backgroundColor = .lightGray
        uiswitch.layer.cornerRadius = uiswitch.frame.height / 2.0
        uiswitch.transform = CGAffineTransform(scaleX: 2, y: 2)
        uiswitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        view.addSubview(uiswitch)
        uiswitch.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    @objc func switchValueChanged(_ sender: UISwitch) {
        if sender.isOn {
            backColorName = "Vibrant Green"
        } else {
            backColorName = "Deep Red"
        }
    }
    
}

