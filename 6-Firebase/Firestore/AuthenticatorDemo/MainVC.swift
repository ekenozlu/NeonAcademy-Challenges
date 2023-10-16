//
//  MainVC.swift
//  AuthenticatorDemo
//
//  Created by Eken Özlü on 10.10.2023.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage
import SnapKit
import SDWebImage

class MainVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate, UICollectionViewDelegateFlowLayout {
    
    var feedCollectionView : UICollectionView?
    var postArray : [[String : Any]] = [[:]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .white
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 50, left: 10, bottom: 50, right: 10)
        feedCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        feedCollectionView?.register(PostCell.self, forCellWithReuseIdentifier: "postCell")
        feedCollectionView?.backgroundColor = .white
        feedCollectionView?.dataSource = self
        feedCollectionView?.delegate = self
        view.addSubview(feedCollectionView!)
        feedCollectionView?.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        let signOutButton = UIButton(type: .system)
        signOutButton.setTitle("SIGN OUT", for: .normal)
        view.addSubview(signOutButton)
        signOutButton.addTarget(self, action: #selector(signOutTapped(_:)), for: .touchUpInside)
        signOutButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.leading.equalToSuperview().offset(8)
            make.width.equalTo(80)
            make.height.equalTo(30)
        }
        
        let uploadButton = UIButton(type: .system)
        uploadButton.setTitle("+", for: .normal)
        uploadButton.setTitleColor(.white, for: .normal)
        uploadButton.titleLabel?.font = .systemFont(ofSize: 32, weight: .bold)
        uploadButton.backgroundColor = .blue
        uploadButton.layer.borderColor = UIColor.black.cgColor
        uploadButton.layer.borderWidth = 2
        uploadButton.layer.cornerRadius = 40
        
        uploadButton.layer.shadowColor = UIColor.black.cgColor
        uploadButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        uploadButton.layer.shadowRadius = 20
        uploadButton.layer.shadowOpacity = 0.5
        
        view.addSubview(uploadButton)
        uploadButton.addTarget(self, action: #selector(uploadTapped(_:)), for: .touchUpInside)
        uploadButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(60)
            make.trailing.equalToSuperview().inset(16)
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        
        fetchPosts()
    }
    
    func fetchPosts() {
        let db = Firestore.firestore()
        db.collection("posts").addSnapshotListener { querySnapshot, error in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                self.postArray.removeAll(keepingCapacity: false)
                for document in querySnapshot!.documents {
                    let post = document.data()
                    self.postArray.append(post)
                }
                self.postArray.sort { post1, post2 in
                    ((post1["date"] as? Timestamp)?.dateValue())! > ((post2["date"] as? Timestamp)?.dateValue())!
                }
                self.feedCollectionView?.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return postArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "postCell", for: indexPath) as! PostCell
        let post = postArray[indexPath.row]
        
        let imageRef = Storage.storage().reference(withPath: "posts/\(post["photoID"] ?? "").png")
        imageRef.downloadURL { url, error in
            cell.postImageView?.sd_setImage(with: url)
        }
        //cell.postImageView?.image = UIImage(systemName: "square.and.arrow.up")
        cell.caption?.text = post["caption"] as? String
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let postWidth : Double = view.frame.width - 20.0
        return CGSize(width: postWidth, height: postWidth * 1.3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            let uploadVC = UploadVC()
            uploadVC.selectedImage = pickedImage
            uploadVC.modalPresentationStyle = .fullScreen
            picker.dismiss(animated: true, completion: nil)
            present(uploadVC, animated: true)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = PostDetailVC()
        detailVC.post = postArray[indexPath.row]
        detailVC.modalPresentationStyle = .fullScreen
        present(detailVC, animated: true)
    }
    
    @objc func uploadTapped(_ sender : UIButton) {
        //OPEN IMAGE PICKER THAN UPLOAD PAGE
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func signOutTapped(_ sender : UIButton) {
        do {
            try Auth.auth().signOut()
            let registerVC = ViewController()
            registerVC.modalPresentationStyle = .fullScreen
            self.present(registerVC, animated: true)
        }
        catch {}
    }
}
