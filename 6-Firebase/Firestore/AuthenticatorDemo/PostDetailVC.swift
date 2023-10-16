//
//  PostDetailVC.swift
//  AuthenticatorDemo
//
//  Created by Eken Özlü on 11.10.2023.
//

import UIKit
import SDWebImage
import SnapKit
import FirebaseStorage
import FirebaseFirestore

class PostDetailVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var post : [String : Any]?
    var commentTV : UITableView?
    var commentTF : UITextField?
    var commentArray : [[String : Any]]?
    
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
        imageView.contentMode = .scaleAspectFill
        let imageRef = Storage.storage().reference(withPath: "posts/\(post?["photoID"] ?? "").png")
        imageRef.downloadURL { url, error in
            imageView.sd_setImage(with: url)
        }
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(backButton.snp.bottom).offset(4)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalTo(imageView.snp.width)
        }
        
        let caption = UILabel()
        caption.text = post!["caption"] as? String
        caption.font = .systemFont(ofSize: 20, weight: .black)
        caption.textAlignment = .left
        caption.textColor = .black
        caption.numberOfLines = 3
        view.addSubview(caption)
        caption.snp.makeConstraints({ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(4)
            make.width.equalTo(imageView.snp.width)
            make.height.equalTo(70)
        })
        
        commentTV = UITableView()
        commentTV?.dataSource = self
        commentTV?.delegate = self
        commentTV?.register(CommentCell.self, forCellReuseIdentifier: "commentCell")
        view.addSubview(commentTV!)
        commentTV?.snp.makeConstraints({ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(caption.snp.bottom).offset(4)
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.3)
        })
        
        commentTF = UITextField()
        commentTF?.placeholder = "Enter Comment"
        commentTF?.borderStyle = .roundedRect
        commentTF?.backgroundColor = .lightGray
        view.addSubview(commentTF!)
        commentTF?.snp.makeConstraints({ make in
            make.leading.equalToSuperview().offset(8)
            make.top.equalTo(commentTV!.snp.bottom).offset(4)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(40)
        })
        
        let sendButton = UIButton(type: .system)
        sendButton.setTitle("Send", for: .normal)
        view.addSubview(sendButton)
        sendButton.addTarget(self, action: #selector(sendTapped(_:)), for: .touchUpInside)
        sendButton.snp.makeConstraints { make in
            make.top.equalTo(commentTF!.snp.top)
            make.leading.equalTo(commentTF!.snp.trailing).offset(4)
            make.trailing.equalToSuperview().inset(4)
            make.bottom.equalTo(commentTF!.snp.bottom)
        }
        
        fetchComments()
    }
    
    func fetchComments() {
        let db = Firestore.firestore()
        db.collection("posts").document(post!["photoID"] as! String).addSnapshotListener { docSnapshot, error in
            if error == nil {
                self.commentArray = docSnapshot!["commentArray"] as? [[String : Any]]
                //self.commentArray.sort { com1, com2 in
                //    (((com1["commentDate"] as? Timestamp)?.dateValue())!) > ((com2["commentDate"] as? //Timestamp)?.dateValue())!
                //}
                self.commentTV?.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as! CommentCell
        let comment = commentArray?[indexPath.row]
        cell.commentLabel?.text = comment?["commentText"] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    @objc func sendTapped(_ sender : UIButton) {
        if commentTF?.text != "" {
            let comment : [String : Any] = ["commentText" : commentTF?.text ?? "",
                                            "commentDate" : Date()]
            commentArray?.append(comment)
            //HANDLE FIREBASE
            let doc = Firestore.firestore().collection("posts").document(post?["photoID"] as! String)
            doc.updateData(["commentArray" : commentArray ?? [[:]]]) { error in
                if error == nil {
                    self.fetchComments()
                    self.commentTF?.text = ""
                }
            }
        }
    }
    
    @objc func backTapped(_ sender : UIButton) {
        dismiss(animated: true)
    }
    
}
