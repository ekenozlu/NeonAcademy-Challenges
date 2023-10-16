//
//  VerificationVC.swift
//  AuthenticatorDemo
//
//  Created by Eken Özlü on 10.10.2023.
//

import UIKit
import SnapKit
import FirebaseAuth

class VerificationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .white
        
        sendVerification()
        
        let backButton = UIButton(type: .system)
        backButton.setTitle("Back", for: .normal)
        view.addSubview(backButton)
        backButton.addTarget(self, action: #selector(backTapped(_:)), for: .touchUpInside)
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview().offset(8)
            make.width.equalTo(40)
            make.height.equalTo(30)
        }
        
        let label = UILabel()
        label.text = "Check your email to verification of your account"
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = .black
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.3)
        }
    }
    
    func sendVerification() {
        Auth.auth().currentUser?.sendEmailVerification()
    }
    
    @objc func backTapped(_ sender : UIButton) {
        dismiss(animated: true)
    }

}
