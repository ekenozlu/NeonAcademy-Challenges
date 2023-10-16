//
//  ViewController.swift
//  StorageDemo
//
//  Created by Eken Özlü on 10.10.2023.
//

import UIKit
import SnapKit
import FirebaseStorage

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    var pickButton : UIButton?
    var imageView : UIImageView?
    var uploadButton : UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .white
        
        pickButton = UIButton(type: .system)
        pickButton?.setTitle("Choose Photo", for: .normal)
        pickButton?.addTarget(self, action: #selector(pickTapped(_:)), for: .touchUpInside)
        view.addSubview(pickButton!)
        pickButton?.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(30)
        }
        
        imageView = UIImageView()
        imageView?.contentMode = .scaleAspectFit
        imageView?.isHidden = true
        view.addSubview(imageView!)
        imageView?.snp.makeConstraints({ make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(imageView!.snp.width)
        })
        
        uploadButton = UIButton(type: .system)
        uploadButton?.setTitle("Upload Photo", for: .normal)
        uploadButton?.isHidden = true
        uploadButton?.addTarget(self, action: #selector(uploadTapped(_:)), for: .touchUpInside)
        view.addSubview(uploadButton!)
        uploadButton?.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView!.snp.bottom).offset(32)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(30)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView?.image = pickedImage
            pickButton?.isHidden = true
            imageView?.isHidden = false
            uploadButton?.isHidden = false
        }
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    @objc func pickTapped(_ sender : UIButton){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        present(imagePicker, animated: true)
    }
    
    @objc func uploadTapped(_ sender : UIButton){
        //UPLOAD IMAGE
        let storageRef = Storage.storage().reference().child("selectedImage.png")
        guard let imageData = imageView?.image?.jpegData(compressionQuality: 1) else { return }
        
        storageRef.putData(imageData, metadata: nil) { metadata, error in
            if error != nil {
                print("Error uploading image: \(error!.localizedDescription)")
                return
            }
            else {
                storageRef.downloadURL { url, error in
                    if let downloadURL = url {
                        let downloadVC = DownloadVC()
                        downloadVC.modalPresentationStyle = .fullScreen
                        downloadVC.downloadURL = downloadURL
                        self.present(downloadVC, animated: true)
                    } else {
                        print("Error getting image download URL: \(error?.localizedDescription ?? "Unknown error")")
                    }
                }
            }
            
        }
    }
}



