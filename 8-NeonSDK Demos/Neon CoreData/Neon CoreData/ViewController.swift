//
//  ViewController.swift
//  Neon CoreData
//
//  Created by Eken Özlü on 17.10.2023.
//

import UIKit
import NeonSDK
import SnapKit

class ViewController: UIViewController {
    
    var nameLabel = UILabel()
    var ageLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .white
        
        nameLabel.text = ""
        nameLabel.textColor = .black
        nameLabel.font = .systemFont(ofSize: 24)
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(30)
        }
        
        ageLabel.text = ""
        ageLabel.textColor = .black
        nameLabel.textAlignment = .center
        ageLabel.font = .systemFont(ofSize: 20)
        view.addSubview(ageLabel)
        ageLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(30)
        }
        
        let button1 = UIButton(type: .system)
        button1.setTitle("ADD DATA TO CORE DATA", for: .normal)
        button1.addTarget(self, action: #selector(addDataToCoreData), for: .touchUpInside)
        view.addSubview(button1)
        button1.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(ageLabel.snp.bottom).offset(10)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        
        let button2 = UIButton(type: .system)
        button2.setTitle("UPDATE DATA IN CORE DATA", for: .normal)
        button2.addTarget(self, action: #selector(updateDataToCoreData), for: .touchUpInside)
        view.addSubview(button2)
        button2.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(button1.snp.bottom).offset(10)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        
        let button3 = UIButton(type: .system)
        button3.setTitle("FETCH DATA FROM CORE DATA", for: .normal)
        button3.addTarget(self, action: #selector(fetchDataToCoreData), for: .touchUpInside)
        view.addSubview(button3)
        button3.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(button2.snp.bottom).offset(10)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        
        let button4 = UIButton(type: .system)
        button4.setTitle("DELETE DATA FROM CORE DATA", for: .normal)
        button4.addTarget(self, action: #selector(deleteDataToCoreData), for: .touchUpInside)
        view.addSubview(button4)
        button4.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(button3.snp.bottom).offset(10)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        
    }
    
    @objc func addDataToCoreData() {
        CoreDataManager.saveData(container: "Neon_CoreData", entity: "Person",
                                 attributeDict: ["name" : "Eken Özlü",
                                                 "age" : 22
                                                ])
    }
    
    @objc func updateDataToCoreData() {
        CoreDataManager.updateData(container: "Neon_CoreData", entity: "Person",
                                   searchKey: "name", searchValue: "Eken Özlü",
                                   newAttributeDict: ["name" : "Eken Özlü Updated",
                                                      "age" : 22
                                                     ])
    }
    
    @objc func fetchDataToCoreData() {
        CoreDataManager.fetchDatas(container: "Neon_CoreData", entity: "Person") { data in
            if let nameData = data.value(forKey: "name") as? String {
                self.nameLabel.text = nameData
            }
            if let ageData = data.value(forKey: "age") as? Int {
                self.ageLabel.text = "\(ageData)"
            }
        }
    }
    
    @objc func deleteDataToCoreData() {
        CoreDataManager.deleteData(container: "Neon_CoreData", entity: "Person",
                                   searchKey: "age", searchValue: "22")
    }
    
}

