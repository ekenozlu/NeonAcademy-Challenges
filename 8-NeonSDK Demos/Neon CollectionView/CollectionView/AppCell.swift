//
//  AppCell.swift
//  CollectionView
//
//  Created by Eken Özlü on 6.10.2023.
//

import UIKit
import SnapKit
import NeonSDK

class AppCell: NeonCollectionViewCell<AppModel> {
    
    var appIconView : UIImageView?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupCell() {
        appIconView = UIImageView()
        appIconView?.image = UIImage()
        appIconView?.backgroundColor = .blue
        appIconView?.layer.cornerRadius = 32
        appIconView?.clipsToBounds = true
        self.contentView.addSubview(appIconView!)
        appIconView?.snp.makeConstraints { make in
            make.centerX.equalTo(contentView.snp.centerX)
            make.centerY.equalTo(contentView.snp.centerY)
            make.width.equalTo(contentView.snp.width)
            make.height.equalTo(contentView.snp.height)
        }
    }
    
    override func configure(with object: AppModel) {
        super.configure(with: object)
        appIconView?.image = object.appIcon
    }
    
}
