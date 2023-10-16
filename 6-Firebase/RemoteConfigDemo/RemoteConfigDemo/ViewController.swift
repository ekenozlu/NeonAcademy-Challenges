//
//  ViewController.swift
//  RemoteConfigDemo
//
//  Created by Eken Özlü on 10.10.2023.
//

import UIKit
import SnapKit
import FirebaseRemoteConfig

class ViewController: UIViewController {

    var imageView : UIImageView?
    var nameLabel : UILabel?
    var yearLabel : UILabel?
    
    var contestName : String?
    var contestYear : Int?
    var imageIsHidden : Bool?
    
    var remoteConfig : RemoteConfig?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .white
        
        imageView = UIImageView()
        imageView?.image = UIImage(named: "contestImage")
        imageView?.contentMode = .scaleAspectFit
        imageView?.isHidden = true
        view.addSubview(imageView!)
        imageView?.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(imageView!.snp.width).multipliedBy(0.7)
        }
        
        nameLabel = UILabel()
        nameLabel?.text = ""
        nameLabel?.font = .systemFont(ofSize: 24, weight: .bold)
        nameLabel?.textAlignment = .center
        nameLabel?.textColor = .black
        nameLabel?.numberOfLines = 2
        view.addSubview(nameLabel!)
        nameLabel?.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView!.snp.bottom).offset(16)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(50)
        }
        
        yearLabel = UILabel()
        yearLabel?.text = ""
        yearLabel?.font = .systemFont(ofSize: 20, weight: .regular)
        yearLabel?.textAlignment = .center
        yearLabel?.textColor = .black
        yearLabel?.numberOfLines = 2
        view.addSubview(yearLabel!)
        yearLabel?.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameLabel!.snp.bottom).offset(16)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(50)
        }
        
        fetchValues()
    }
    
    func fetchValues() {
        remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig?.configSettings = settings
        let defaults : [String : NSObject] = ["contestName" : "" as NSObject]
        remoteConfig?.setDefaults(defaults)
        
        remoteConfig?.fetch(withExpirationDuration: 0, completionHandler: { status, error in
            if status == .success, error == nil {
                self.remoteConfig?.activate(completion: { _, error in
                    guard error == nil else { return }
                    let cN = self.remoteConfig?.configValue(forKey: "contestName").stringValue
                    let cY = self.remoteConfig?.configValue(forKey: "contestYear").numberValue as! Int
                    let iH = self.remoteConfig?.configValue(forKey: "imageIsHidden").boolValue
                    
                    DispatchQueue.main.async {
                        self.updateUI(contestName: cN ?? "", contestYear: cY, imageIsHidden: iH ?? false)
                    }
                })
            } else {
                print(error!.localizedDescription)
            }
        })
    }
    
    func updateUI(contestName : String, contestYear : Int, imageIsHidden : Bool) {
        nameLabel?.text = contestName
        yearLabel?.text = "\(contestYear)"
        imageView?.isHidden = imageIsHidden
    }
    
}

