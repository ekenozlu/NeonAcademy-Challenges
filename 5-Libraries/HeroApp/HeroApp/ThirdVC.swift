//
//  ThirdVC.swift
//  HeroApp
//
//  Created by Eken Özlü on 9.10.2023.
//

import UIKit

class ThirdVC: UIViewController {

    var topView : UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .purple
        self.hero.isEnabled = true
        
        topView = UIView()
        topView?.backgroundColor = .white
        topView?.layer.cornerRadius = 16
        topView?.hero.id = "whiteview"
        view.addSubview(topView!)
        topView?.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(250)
        }
    }

}
