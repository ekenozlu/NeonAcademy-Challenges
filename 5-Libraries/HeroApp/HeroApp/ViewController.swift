//
//  ViewController.swift
//  HeroApp
//
//  Created by Eken Özlü on 9.10.2023.
//

import UIKit
import SnapKit
import Hero

class ViewController: UIViewController {
    
    var topView : UIView?
    var upButton : UIButton?
    var leftButton : UIButton?
    var rightButton : UIButton?
    var downButton : UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .red
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
            make.height.equalTo(50)
        }
        
        
        upButton = UIButton(type: .system)
        upButton?.setImage(UIImage(systemName: "arrowshape.up"), for: .normal)
        upButton?.backgroundColor = .darkGray
        upButton?.tintColor = .white
        upButton?.layer.borderColor = UIColor.white.cgColor
        upButton?.layer.borderWidth = 2
        upButton?.layer.cornerRadius = 8
        upButton?.addTarget(self, action: #selector(upTapped(_:)), for: .touchUpInside)
        upButton?.hero.id = "up"
        view.addSubview(upButton!)
        upButton?.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(topView!.snp.bottom).offset(32)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        leftButton = UIButton(type: .system)
        leftButton?.setImage(UIImage(systemName: "arrowshape.left"), for: .normal)
        leftButton?.backgroundColor = .darkGray
        leftButton?.tintColor = .white
        leftButton?.layer.borderColor = UIColor.white.cgColor
        leftButton?.layer.borderWidth = 2
        leftButton?.layer.cornerRadius = 8
        leftButton?.addTarget(self, action: #selector(leftTapped(_:)), for: .touchUpInside)
        leftButton?.hero.id = "left"
        view.addSubview(leftButton!)
        leftButton?.snp.makeConstraints { make in
            make.right.equalTo(upButton!.snp.left)
            make.top.equalTo(upButton!.snp.bottom).offset(16)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        rightButton = UIButton(type: .system)
        rightButton?.setImage(UIImage(systemName: "arrowshape.right"), for: .normal)
        rightButton?.backgroundColor = .darkGray
        rightButton?.tintColor = .white
        rightButton?.layer.borderColor = UIColor.white.cgColor
        rightButton?.layer.borderWidth = 2
        rightButton?.layer.cornerRadius = 8
        rightButton?.addTarget(self, action: #selector(rightTapped(_:)), for: .touchUpInside)
        rightButton?.hero.id = "right"
        view.addSubview(rightButton!)
        rightButton?.snp.makeConstraints { make in
            make.left.equalTo(upButton!.snp.right)
            make.top.equalTo(upButton!.snp.bottom).offset(16)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        downButton = UIButton(type: .system)
        downButton?.setImage(UIImage(systemName: "arrowshape.down"), for: .normal)
        downButton?.backgroundColor = .darkGray
        downButton?.tintColor = .white
        downButton?.layer.borderColor = UIColor.white.cgColor
        downButton?.layer.borderWidth = 2
        downButton?.layer.cornerRadius = 8
        downButton?.addTarget(self, action: #selector(downTapped(_:)), for: .touchUpInside)
        downButton?.hero.id = "down"
        view.addSubview(downButton!)
        downButton?.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(rightButton!.snp.bottom).offset(16)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
    }
    
    @objc func upTapped(_ sender : UIButton) {
        navigationController?.heroNavigationAnimationType = .selectBy(presenting: .slide(direction: .down),
                                                                      dismissing: .slide(direction: .up))
        navigationController?.pushViewController(SecondVC(), animated: true)
    }
    
    @objc func leftTapped(_ sender : UIButton) {
        navigationController?.heroNavigationAnimationType = .selectBy(presenting: .zoomSlide(direction: .right),
                                                                      dismissing: .zoomSlide(direction: .left))
        navigationController?.pushViewController(ThirdVC(), animated: true)
    }
    
    @objc func rightTapped(_ sender : UIButton) {
        navigationController?.heroNavigationAnimationType = .selectBy(presenting: .pageIn(direction: .left),
                                                                      dismissing: .pageOut(direction: .right))
        navigationController?.pushViewController(FourthVC(), animated: true)
    }
    
    @objc func downTapped(_ sender : UIButton) {
        navigationController?.heroNavigationAnimationType = .selectBy(presenting: .cover(direction: .up),
                                                                      dismissing: .cover(direction: .down))
        navigationController?.pushViewController(FifthVC(), animated: true)
    }
}

