//
//  FourthVC.swift
//  Picker
//
//  Created by Eken Özlü on 6.10.2023.
//

import UIKit
import SnapKit

class FourthVC: UIViewController, UIColorPickerViewControllerDelegate {
    
    var nextButton : UIButton?
    var selectedColorView : UIView?
    var selectedColor : UIColor = .black {
        didSet {
            selectedColorView?.backgroundColor = selectedColor
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .white
        
        selectedColorView = UIView()
        selectedColorView?.backgroundColor = selectedColor
        selectedColorView?.layer.borderColor = UIColor.black.cgColor
        selectedColorView?.layer.borderWidth = 2
        selectedColorView?.clipsToBounds = true
        view.addSubview(selectedColorView!)
        selectedColorView?.snp.makeConstraints({ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(200)
            make.width.equalToSuperview().multipliedBy(0.3)
            make.height.equalTo(selectedColorView!.snp.width)
        })
        
        
        let colorPickerButton = UIButton(type: .system)
        colorPickerButton.setTitle("Choose Color", for: .normal)
        colorPickerButton.setTitleColor(.white, for: .normal)
        colorPickerButton.backgroundColor = .blue
        colorPickerButton.layer.cornerRadius = 8
        colorPickerButton.layer.borderColor = UIColor.black.cgColor
        colorPickerButton.layer.borderWidth = 2
        colorPickerButton.addTarget(self, action: #selector(selectButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(colorPickerButton)
        colorPickerButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(selectedColorView!.snp.bottom).offset(64)
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
        nextButton?.isHidden = true
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
        let colorPicker = UIColorPickerViewController()
        colorPicker.modalPresentationStyle = .overFullScreen
        colorPicker.modalTransitionStyle = .crossDissolve
        colorPicker.selectedColor = .red
        colorPicker.delegate = self
        self.present(colorPicker, animated: true, completion: nil)
    }
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        selectedColor = viewController.selectedColor
        nextButton?.isHidden = false
    }
    
    @objc func nextButtonTapped(_ sender : UIButton) {
        savedColor = selectedColor
        navigationController?.pushViewController(FinalVC(), animated: true)
    }
}
