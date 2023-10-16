//
//  FinalVC.swift
//  Picker
//
//  Created by Eken Özlü on 6.10.2023.
//

import UIKit

class FinalVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = savedColor
        self.title = "Profile"
        
        let imageView = UIImageView()
        imageView.image = savedImage
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .red
        imageView.layer.cornerRadius = 8
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 4
        imageView.clipsToBounds = true
        view.addSubview(imageView)
        imageView.snp.makeConstraints({ make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalTo(imageView.snp.width)
        })
        
        let nameLabel = UILabel()
        nameLabel.text = savedName
        nameLabel.font = savedFont?.withSize(36)
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 1
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(16)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(40)
        }
        
        let ageLabel = UILabel()
        ageLabel.text = savedDate?.ageAsString()
        ageLabel.font = savedFont?.withSize(24)
        ageLabel.textColor = .black
        ageLabel.textAlignment = .center
        ageLabel.numberOfLines = 1
        view.addSubview(ageLabel)
        ageLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom).offset(16)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(30)
        }
    }
}
