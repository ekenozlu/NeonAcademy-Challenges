//
//  SecondVC.swift
//  RevenueCatApp
//
//  Created by Eken Özlü on 10.10.2023.
//

import UIKit
import SnapKit

class SecondVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    func createUI() {
        view.backgroundColor = .red
        
        let label = UILabel()
        label.text = "YOU ARE PREMIUM"
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 24, weight: .bold)
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalTo(40)
        }
    }

}
