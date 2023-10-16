//
//  MemberCell.swift
//  Table View
//
//  Created by Eken Özlü on 5.10.2023.
//

import UIKit
import SnapKit
import NeonSDK

class MemberCell: NeonTableViewCell<MemberModel> {
    
    var nameLabel : UILabel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func createUI() {
        nameLabel = UILabel()
        nameLabel?.text = "Member Name and Surname"
        nameLabel?.textColor = .black
        nameLabel?.textAlignment = .left
        nameLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.contentView.addSubview(nameLabel!)
        nameLabel?.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.centerY.equalTo(contentView.snp.centerY)
            make.height.equalTo(contentView.snp.height).multipliedBy(0.4)
            make.width.equalTo(contentView.snp.width).multipliedBy(0.8)
        }
    }
    
    override func configure(with object: MemberModel) {
        super.configure(with: object)
        nameLabel?.text = "\(object.name ?? "") \(object.surname ?? "")"
    }
    
}
