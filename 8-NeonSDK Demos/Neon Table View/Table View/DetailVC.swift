//
//  DetailVC.swift
//  Table View
//
//  Created by Eken Özlü on 6.10.2023.
//

import UIKit
import SnapKit
import NeonSDK

class DetailVC: UIViewController {

    var selectedMember : MemberModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .white
        
        let backButton = NeonButton(type: .system)
        backButton.setTitle("Back", for: .normal)
        backButton.addTarget(self, action: #selector(backTapped(_:)), for: .touchUpInside)
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.top.equalToSuperview().offset(88)
            make.width.equalTo(60)
            make.height.equalTo(10)
        }
        
        let teamLabel = UILabel()
        teamLabel.text = selectedMember?.team.rawValue
        teamLabel.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        teamLabel.textColor = .black
        teamLabel.textAlignment = .center
        view.addSubview(teamLabel)
        teamLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(200)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(30)
        }
        
        let hometownLabel = UILabel()
        hometownLabel.text = selectedMember?.hometown
        hometownLabel.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        hometownLabel.textColor = .black
        hometownLabel.textAlignment = .center
        view.addSubview(hometownLabel)
        hometownLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(teamLabel.snp.bottom).offset(16)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(30)
        }
        
        let emailLabel = UILabel()
        emailLabel.text = selectedMember?.email
        emailLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        emailLabel.textColor = .black
        emailLabel.textAlignment = .center
        view.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(hometownLabel.snp.bottom).offset(16)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(30)
        }
    }
    
    @objc func backTapped(_ sender : NeonButton) {
        self.dismiss(animated: true)
    }
    
}
