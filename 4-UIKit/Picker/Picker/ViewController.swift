//
//  ViewController.swift
//  Picker
//
//  Created by Eken Özlü on 5.10.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var startButton : UIButton?
    var selectedImageView : UIImageView?
    var nextButton : UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .white
        self.title = "Choose Photo"
        
        startButton = UIButton(type: .system)
        startButton?.setTitle("Choose Profile Picture", for: .normal)
        startButton?.setTitleColor(.white, for: .normal)
        startButton?.backgroundColor = .blue
        startButton?.layer.cornerRadius = 8
        startButton?.layer.borderColor = UIColor.black.cgColor
        startButton?.layer.borderWidth = 2
        startButton?.addTarget(self, action: #selector(selectButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(startButton!)
        startButton?.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.6)
            make.height.equalTo(45)
        }
        
        selectedImageView = UIImageView()
        selectedImageView?.image = UIImage()
        selectedImageView?.contentMode = .scaleAspectFill
        selectedImageView?.layer.cornerRadius = 8
        selectedImageView?.layer.borderColor = UIColor.black.cgColor
        selectedImageView?.layer.borderWidth = 4
        selectedImageView?.clipsToBounds = true
        selectedImageView?.isHidden = true
        view.addSubview(selectedImageView!)
        selectedImageView?.snp.makeConstraints({ make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(selectedImageView!.snp.width)
        })
        
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
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func nextButtonTapped(_ sender : UIButton) {
        let secondVC = SecondVC()
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            startButton?.isHidden = true
            selectedImageView?.image = pickedImage
            selectedImageView?.isHidden = false
            nextButton?.isHidden = false
            savedImage = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    
    
}

