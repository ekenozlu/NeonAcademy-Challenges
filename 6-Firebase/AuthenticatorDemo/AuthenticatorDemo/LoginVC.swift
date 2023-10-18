//
//  LoginVC.swift
//  AuthenticatorDemo
//
//  Created by Eken Özlü on 10.10.2023.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {
    
    var emailTF : UITextField?
    var passTF : UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        
    }
    
    func createUI() {
        view.backgroundColor = .white
        
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
        
        let loginButton = UIButton(type: .system)
        loginButton.setTitle("LOG IN", for: .normal)
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.backgroundColor = .red
        loginButton.layer.borderColor = UIColor.black.cgColor
        loginButton.layer.borderWidth = 2
        loginButton.layer.cornerRadius = 8
        loginButton.addTarget(self, action: #selector(loginTapped(_:)), for: .touchUpInside)
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passTF!.snp.bottom).offset(16)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(45)
        }
        
        let forgotPassButton = UIButton(type: .system)
        forgotPassButton.setTitle("Forgot Your Password?", for: .normal)
        forgotPassButton.addTarget(self, action: #selector(forgotPassTapped(_:)), for: .touchUpInside)
        view.addSubview(forgotPassButton)
        forgotPassButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginButton.snp.bottom).offset(16)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(45)
        }
    }
    
    @objc func loginTapped(_ sender : UIButton) {
        //LOGIN AUTH
        if emailTF!.text!.isValidEmail() && !(passTF!.text!.isEmpty) {
            Auth.auth().signIn(withEmail: emailTF!.text!, password: passTF!.text!) { result, error in
                if error != nil {
                    print(error!.localizedDescription)
                }
                if Auth.auth().currentUser!.isEmailVerified {
                    let mainVC = MainVC()
                    mainVC.modalPresentationStyle = .fullScreen
                    self.present(mainVC, animated: true)
                } else {
                    let verificationVC = VerificationVC()
                    verificationVC.modalPresentationStyle = .fullScreen
                    self.present(verificationVC, animated: true)
                }
            }
        }
        
    }
    
    @objc func forgotPassTapped(_ sender : UIButton) {
        //FORGOT PASS SCREEN
        if emailTF!.text!.isValidEmail() {
            Auth.auth().sendPasswordReset(withEmail: emailTF!.text!) { error in
                if error != nil {
                    print(error!.localizedDescription)
                } else {
                    let resetPassVC = ResetPassVC()
                    resetPassVC.modalPresentationStyle = .fullScreen
                    self.present(resetPassVC, animated: true)
                }
            }
        }
    }
    
}
