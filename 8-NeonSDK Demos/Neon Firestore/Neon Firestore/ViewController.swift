//
//  ViewController.swift
//  Neon Firestore
//
//  Created by Eken Özlü on 17.10.2023.
//

import UIKit
import SnapKit
import FirebaseFirestore
import NeonSDK
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .white
        
        RemoteConfigManager.configureRemoteConfig(defaultValues: ["button1Text" : "ADD DATA WITH FIELDS" as NSObject,
                                                                  "button2Text" : "ADD DATA WITH OBJECT" as NSObject,
                                                                  "button3Text" : "UPDATE DATA WITH FIELD" as NSObject,
                                                                  "button4Text" : "DELETE DOCUMENT" as NSObject,])
        
        let button1 = UIButton(type: .system)
        button1.setTitle(RemoteConfigManager.getString(key: "button1Text"), for: .normal)
        button1.addTarget(self, action: #selector(addDataWithField), for: .touchUpInside)
        view.addSubview(button1)
        button1.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.width.equalTo(250)
            make.height.equalTo(45)
        }
        
        let button2 = UIButton(type: .system)
        button2.setTitle(RemoteConfigManager.getString(key: "button2Text"), for: .normal)
        button2.addTarget(self, action: #selector(addDataWithObject), for: .touchUpInside)
        view.addSubview(button2)
        button2.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(button1.snp.bottom).offset(50)
            make.width.equalTo(250)
            make.height.equalTo(45)
        }
        
        let button3 = UIButton(type: .system)
        button3.setTitle(RemoteConfigManager.getString(key: "button3Text"), for: .normal)
        button3.addTarget(self, action: #selector(updateDataWithField), for: .touchUpInside)
        view.addSubview(button3)
        button3.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(button2.snp.bottom).offset(50)
            make.width.equalTo(250)
            make.height.equalTo(45)
        }
        
        let button4 = UIButton(type: .system)
        button4.setTitle(RemoteConfigManager.getString(key: "button4Text"), for: .normal)
        button4.addTarget(self, action: #selector(deleteDocument), for: .touchUpInside)
        view.addSubview(button4)
        button4.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(button3.snp.bottom).offset(50)
            make.width.equalTo(250)
            make.height.equalTo(45)
        }
    }
    
    @objc func addDataWithField() {
        FirestoreManager.setDocument(path: [.collection(name: "posts"), .document(name: "Document With Field")],
                                     fields: ["field1" : "String",
                                              "field2" : 15,
                                              "bool" : true])
    }
    
    @objc func addDataWithObject() {
        FirestoreManager.setDocument(path: [.collection(name: "posts"), .document(name: "Document With Object")],
                                     object: PostToUpload)
    }
    
    @objc func updateDataWithField() {
        FirestoreManager.updateDocument(path: [.collection(name: "posts"), .document(name: "Document With Field")],
                                        fields: ["field1" : "Updated String",
                                                 "field2" : 99,
                                                 "bool" : false])
    }
    
    @objc func deleteDocument() {
        FirestoreManager.deleteDocument(path: [.collection(name: "posts"), .document(name: "Document With Field")])
    }
    
}

