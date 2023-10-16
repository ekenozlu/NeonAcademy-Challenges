//
//  CommentCell.swift
//  AuthenticatorDemo
//
//  Created by Eken Özlü on 11.10.2023.
//

import UIKit

class CommentCell: UITableViewCell {

    var commentLabel : UILabel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func createUI() {
        commentLabel = UILabel()
        commentLabel?.text = "Comment"
        commentLabel?.textColor = .black
        commentLabel?.textAlignment = .left
        commentLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        self.contentView.addSubview(commentLabel!)
        commentLabel?.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.centerY.equalTo(contentView.snp.centerY)
            make.height.equalTo(contentView.snp.height).multipliedBy(0.4)
            make.width.equalTo(contentView.snp.width).multipliedBy(0.8)
        }
    }

}
