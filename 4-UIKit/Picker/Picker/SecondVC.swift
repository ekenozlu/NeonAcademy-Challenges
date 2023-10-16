//
//  SecondVC.swift
//  Picker
//
//  Created by Eken Özlü on 5.10.2023.
//

import UIKit
import SnapKit

class SecondVC: UIViewController, UIFontPickerViewControllerDelegate {

    var nameTF : UITextField?
    var fontPickerButton : UIButton?
    var nextButton : UIButton?
    var font : UIFont = UIFont.systemFont(ofSize: 20) {
        didSet {
            nameTF?.font = font
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI(){
        view.backgroundColor = .white
        self.title = "Enter Name & Choose Font"
        
        nameTF = UITextField()
        nameTF?.placeholder = "Enter Name and Surname"
        nameTF?.keyboardType = .default
        nameTF?.borderStyle = .roundedRect
        nameTF?.textColor = .black
        nameTF?.font = font
        view.addSubview(nameTF!)
        nameTF?.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(200)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalTo(25)
        }
        
        fontPickerButton = UIButton(type: .system)
        fontPickerButton?.setTitle("Choose Font", for: .normal)
        fontPickerButton?.setTitleColor(.white, for: .normal)
        fontPickerButton?.backgroundColor = .blue
        fontPickerButton?.layer.cornerRadius = 8
        fontPickerButton?.layer.borderColor = UIColor.black.cgColor
        fontPickerButton?.layer.borderWidth = 2
        fontPickerButton?.addTarget(self, action: #selector(selectButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(fontPickerButton!)
        fontPickerButton?.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameTF!.snp.bottom).offset(64)
            make.width.equalToSuperview().multipliedBy(0.6)
            make.height.equalTo(45)
        }
        
        nextButton = UIButton(type: .system)
        nextButton?.setTitle("Next", for: .normal)
        nextButton?.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .black)
        nextButton?.setTitleColor(.white, for: .normal)
        nextButton?.backgroundColor = .blue
        nextButton?.layer.cornerRadius = 8
        nextButton?.layer.borderColor = UIColor.black.cgColor
        nextButton?.layer.borderWidth = 2
        nextButton?.addTarget(self, action: #selector(nextButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(nextButton!)
        nextButton?.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(64)
            make.width.equalToSuperview().multipliedBy(0.3)
            make.height.equalTo(45)
        }
    }
    
    @objc func selectButtonTapped(_ sender : UIButton) {
        let vc = UIFontPickerViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func fontPickerViewControllerDidPickFont(_ viewController: UIFontPickerViewController) {
        guard let descriptor = viewController.selectedFontDescriptor else { return }
        font = UIFont(descriptor: descriptor, size: 20)
        navigationController?.popViewController(animated: true)
    }
    
    @objc func nextButtonTapped(_ sender : UIButton) {
        if nameTF?.text == nil || nameTF?.text == "" {
            let ac = UIAlertController(title: "ALERT", message: "Please enter your Name and Surname", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            savedName = nameTF?.text
            savedFont = font
            navigationController?.pushViewController(ThirdVC(), animated: true)
        }
        
    }
    
}
