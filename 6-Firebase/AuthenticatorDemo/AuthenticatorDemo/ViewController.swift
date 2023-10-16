//
//  ViewController.swift
//  AuthenticatorDemo
//
//  Created by Eken Özlü on 10.10.2023.
//

import UIKit
import SnapKit
import FirebaseAuth

class ViewController: UIViewController {
    
    var emailTF : UITextField?
    var passTF : UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .white
        
        if let user = Auth.auth().currentUser {
            let mainVC = MainVC()
            mainVC.modalPresentationStyle = .fullScreen
            self.present(mainVC, animated: true)
        }
        
        emailTF = UITextField()
        emailTF?.borderStyle = .roundedRect
        emailTF?.placeholder = "Enter E-Mail"
        emailTF?.keyboardType = .emailAddress
        view.addSubview(emailTF!)
        emailTF?.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(50)
        }
        
        passTF = UITextField()
        passTF?.borderStyle = .roundedRect
        passTF?.placeholder = "Enter Pass"
        passTF?.keyboardType = .default
        //passTF?.isSecureTextEntry = true
        view.addSubview(passTF!)
        passTF?.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(emailTF!.snp.bottom).offset(8)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(50)
        }
        
        let registerButton = UIButton(type: .system)
        registerButton.setTitle("REGISTER", for: .normal)
        registerButton.setTitleColor(.black, for: .normal)
        registerButton.backgroundColor = .red
        registerButton.layer.borderColor = UIColor.black.cgColor
        registerButton.layer.borderWidth = 2
        registerButton.layer.cornerRadius = 8
        registerButton.addTarget(self, action: #selector(registerTapped(_:)), for: .touchUpInside)
        view.addSubview(registerButton)
        registerButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passTF!.snp.bottom).offset(16)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(45)
        }
        
        let loginButton = UIButton(type: .system)
        loginButton.setTitle("Have you registered before?", for: .normal)
        loginButton.addTarget(self, action: #selector(loginTapped(_:)), for: .touchUpInside)
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(registerButton.snp.bottom).offset(16)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(45)
        }
    }
    
    @objc func registerTapped(_ sender : UIButton) {
        if emailTF!.text!.isValidEmail() && !(passTF!.text!.isEmpty) {
            //CREATE AUTH
            Auth.auth().createUser(withEmail: emailTF!.text!, password: passTF!.text!) { result, error in
                guard error == nil else { return }
                //PRESENT EMAIL VERIFICATION PAGE
                let verificationVC = VerificationVC()
                verificationVC.modalPresentationStyle = .fullScreen
                self.present(verificationVC, animated: true)
            }
        }
    }
    
    
    @objc func loginTapped(_ sender : UIButton) {
        //PRESENT LOGIN PAGE
        let loginVC = LoginVC()
        loginVC.modalPresentationStyle = .fullScreen
        present(loginVC, animated: true)
    }
}

