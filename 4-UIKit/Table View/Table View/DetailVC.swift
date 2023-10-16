//
//  DetailVC.swift
//  Table View
//
//  Created by Eken Özlü on 6.10.2023.
//

import UIKit
import SnapKit

class DetailVC: UIViewController {

    var selectedMember : MemberModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .white
        title = "\(selectedMember?.name ?? "") \(selectedMember?.surname ?? "")"
        
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
    
}
