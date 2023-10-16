//
//  UploadVC.swift
//  AuthenticatorDemo
//
//  Created by Eken Özlü on 11.10.2023.
//

import UIKit
import SnapKit
import FirebaseFirestore
import FirebaseStorage

class UploadVC: UIViewController {
    
    var selectedImage : UIImage?
    var captionTV : UITextView?

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .white
        
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
        
        let imageView = UIImageView()
        imageView.image = selectedImage
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(imageView.snp.width)
        }
        
        captionTV = UITextView()
        captionTV?.text = "Enter Caption"
        captionTV?.font = UIFont.systemFont(ofSize: 16)
        captionTV?.backgroundColor = UIColor.lightGray
        view.addSubview(captionTV!)
        captionTV?.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.width.equalTo(imageView.snp.width)
            make.height.equalTo(100)
        }
        
        let shareButton = UIButton(type: .system)
        shareButton.setTitle("SHARE", for: .normal)
        view.addSubview(shareButton)
        shareButton.addTarget(self, action: #selector(shareTapped(_:)), for: .touchUpInside)
        shareButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(captionTV!.snp.bottom).offset(8)
            make.width.equalTo(80)
            make.height.equalTo(30)
        }
    }
    
    @objc func shareTapped(_ sender : UIButton) {
        //CREATE UUID
        let postUUID = UUID().uuidString
        
        //UPLOAD PHOTO TO STORAGE
        let storageRef = Storage.storage().reference().child("posts/\(postUUID).png")
        guard let imageData = selectedImage?.jpegData(compressionQuality: 0.5) else { return }
        
        storageRef.putData(imageData, metadata: nil) { metadata, error in
            if error != nil {
                print("Error uploading image: \(error!.localizedDescription)")
            } else {
                //HANDLE FIRE STORE
                let postObject : [String : Any] = ["photoID" : postUUID,
                                                   "caption" : self.captionTV?.text ?? "",
                                                   "commentArray" : [String](),
                                                   "date" : Date()]
                let db = Firestore.firestore()
                db.collection("posts").document(postUUID).setData(postObject) { error in
                    if error != nil {
                        print(error!.localizedDescription)
                    } else {
                        self.dismiss(animated: true)
                    }
                }
            }
        }
    }
    
    @objc func backTapped(_ sender : UIButton) {
        dismiss(animated: true)
    }

}
