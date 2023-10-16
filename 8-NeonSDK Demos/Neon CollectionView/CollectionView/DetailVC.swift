//
//  DetailVC.swift
//  CollectionView
//
//  Created by Eken Özlü on 6.10.2023.
//

import UIKit
import SnapKit

class DetailVC: UIViewController {
    
    var selectedApp : AppModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .white
        title = selectedApp?.appName
        
        let appImageView = UIImageView()
        appImageView.image = selectedApp?.appIcon
        appImageView.layer.cornerRadius = 30
        view.addSubview(appImageView)
        appImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(200)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalTo(appImageView.snp.width)
        }
        
        let nameLabel = UILabel()
        nameLabel.text = selectedApp?.appName
        nameLabel.font = .systemFont(ofSize: 36, weight: .bold)
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 2
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(appImageView.snp.bottom).offset(16)
            make.width.equalTo(appImageView.snp.width)
            make.height.equalTo(75)
        }
        
        let categoryLabel = UILabel()
        categoryLabel.text = selectedApp?.appCategory.rawValue
        categoryLabel.font = .systemFont(ofSize: 22, weight: .regular)
        categoryLabel.textColor = .darkGray
        categoryLabel.textAlignment = .center
        categoryLabel.numberOfLines = 1
        view.addSubview(categoryLabel)
        categoryLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom).offset(16)
            make.width.equalTo(nameLabel.snp.width)
            make.height.equalTo(25)
        }
        
        let dateLabel = UILabel()
        dateLabel.text = selectedApp?.releaseDate
        dateLabel.font = .systemFont(ofSize: 20, weight: .regular)
        dateLabel.textColor = .darkGray
        dateLabel.textAlignment = .center
        dateLabel.numberOfLines = 1
        view.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(categoryLabel.snp.bottom).offset(8)
            make.width.equalTo(categoryLabel.snp.width)
            make.height.equalTo(25)
        }
        
        let button = UIButton(type: .system)
        button.setTitle("Download from App Store", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(dateLabel.snp.bottom).offset(64)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(45)
        }
    }
    
    @objc func buttonTapped(_ sender : UIButton) {
        if let appStoreURL = URL(string: selectedApp!.appStoreURL) {
         UIApplication.shared.open(appStoreURL)
        }
    }

}
