//
//  ViewController.swift
//  TextField
//
//  Created by Eken Özlü on 3.10.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var nameSurnameTF : UITextField?
    var emailTF : UITextField?
    var phoneTF : UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI(){
        view.backgroundColor = .darkGray
        
        nameSurnameTF = UITextField()
        nameSurnameTF?.placeholder = "Enter Name-Surname"
        nameSurnameTF?.textColor = .red
        nameSurnameTF?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        nameSurnameTF?.borderStyle = .roundedRect
        nameSurnameTF?.backgroundColor = .lightGray
        nameSurnameTF?.delegate = self
        view.addSubview(nameSurnameTF!)
        nameSurnameTF?.snp.makeConstraints({ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(200)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
        })
        
        emailTF = UITextField()
        emailTF?.placeholder = "Enter Email"
        emailTF?.textColor = .blue
        emailTF?.font = UIFont.italicSystemFont(ofSize: 18)
        emailTF?.borderStyle = .roundedRect
        emailTF?.backgroundColor = .lightGray
        emailTF?.keyboardType = .emailAddress
        emailTF?.delegate = self
        view.addSubview(emailTF!)
        emailTF?.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameSurnameTF!.snp.bottom).offset(16)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
        }
        
        phoneTF = UITextField()
        phoneTF?.placeholder = "Enter Phone Number"
        phoneTF?.textColor = .green
        phoneTF?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        phoneTF?.borderStyle = .roundedRect
        phoneTF?.backgroundColor = .lightGray
        phoneTF?.keyboardType = .numberPad
        phoneTF?.delegate = self
        view.addSubview(phoneTF!)
        phoneTF?.snp.makeConstraints({ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(emailTF!.snp.bottom).offset(16)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
        })
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameSurnameTF {
            textField.resignFirstResponder()
            return true
        }
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTF {
            if let email = textField.text, !email.isEmpty {
                if !isValidEmail(email) {
                    showError(message: "Invalid email format")
                }
            }
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func showError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == phoneTF {
            if let currentText = textField.text {
                let updatedText = (currentText as NSString).replacingCharacters(in: range, with: string)
                
                if updatedText.count > 10 {
                    return false
                }
            }
            return true
        }
        return true
    }
    
}

