//
//  PostCell.swift
//  AuthenticatorDemo
//
//  Created by Eken Özlü on 11.10.2023.
//

import UIKit

class PostCell: UICollectionViewCell {
    
    var postImageView : UIImageView?
    var caption : UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupCell() {
        contentView.backgroundColor = .lightGray
        contentView.layer.cornerRadius = 16
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 2
        
        postImageView = UIImageView()
        postImageView?.image = UIImage()
        postImageView?.backgroundColor = .clear
        postImageView?.clipsToBounds = true
        postImageView?.contentMode = .scaleAspectFill
        self.contentView.addSubview(postImageView!)
        postImageView?.snp.makeConstraints { make in
            make.centerX.equalTo(contentView.snp.centerX)
            make.top.equalTo(contentView.snp.top).offset(16)
            make.width.equalTo(contentView.snp.width).multipliedBy(0.9)
            make.height.equalTo(postImageView!.snp.width)
        }
        
        caption = UILabel()
        caption?.text = ""
        caption?.font = .systemFont(ofSize: 20, weight: .black)
        caption?.textAlignment = .left
        caption?.textColor = .black
        caption?.numberOfLines = 3
        contentView.addSubview(caption!)
        caption?.snp.makeConstraints({ make in
            make.centerX.equalTo(contentView.snp.centerX)
            make.top.equalTo(postImageView!.snp.bottom).offset(4)
            make.width.equalTo(postImageView!.snp.width)
            make.height.equalTo(70)
        })
    }
}
