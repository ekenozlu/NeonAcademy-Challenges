//
//  DownloadVC.swift
//  StorageDemo
//
//  Created by Eken Özlü on 10.10.2023.
//

import UIKit
import SnapKit
import FirebaseStorage
import Photos

class DownloadVC: UIViewController {
    
    var downloadURL : URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .white
        
        let label = UILabel()
        label.text = downloadURL?.absoluteString
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .black
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(80)
        }
        
        let downloadButton = UIButton(type: .system)
        downloadButton.setTitle("Download Image", for: .normal)
        downloadButton.addTarget(self, action: #selector(downloadTapped(_:)), for: .touchUpInside)
        view.addSubview(downloadButton)
        downloadButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(label.snp.bottom).offset(16)
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalTo(30)
        }
    }
    
    @objc func downloadTapped(_ sender : UIButton) {
        let storageRef = Storage.storage().reference().child("selectedImage.png")
        storageRef.getData(maxSize: 1 * 1024 * 1024 * 1024) { data, error in
            if let error = error {
                print("Error downloading image: \(error.localizedDescription)")
                return
            }
            
            if let data = data, let image = UIImage(data: data) {
                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                let alert = UIAlertController(title: "Image Saved", message: "Check your photos app", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true)
            } else {
                print("Could not convert data to image")
            }
        }
        
    }
    
}
