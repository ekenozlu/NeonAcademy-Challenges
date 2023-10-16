//
//  ViewController.swift
//  UIView Animation
//
//  Created by Eken Özlü on 12.10.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var cardView : UIView?
    var button3Bool : Bool = false
    var button4Bool : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .white
        
        cardView = UIView()
        cardView?.backgroundColor = .red
        cardView?.layer.cornerRadius = 8
        view.addSubview(cardView!)
        cardView?.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalTo(cardView!.snp.width)
        }
        
        let button1 = UIButton(type: .system)
        button1.setTitle("INVISIBILTY", for: .normal)
        button1.setTitleColor(.white, for: .normal)
        button1.backgroundColor = .systemBlue
        button1.layer.borderColor = UIColor.black.cgColor
        button1.layer.borderWidth = 2
        button1.layer.cornerRadius = 8
        button1.addTarget(self, action: #selector(button1Tapped(_:)), for: .touchUpInside)
        view.addSubview(button1)
        button1.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(cardView!.snp.bottom).offset(32)
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalTo(45)
        }
        
        let button2 = UIButton(type: .system)
        button2.setTitle("ROTATION", for: .normal)
        button2.setTitleColor(.white, for: .normal)
        button2.backgroundColor = .systemBlue
        button2.layer.borderColor = UIColor.black.cgColor
        button2.layer.borderWidth = 2
        button2.layer.cornerRadius = 8
        button2.addTarget(self, action: #selector(button2Tapped(_:)), for: .touchUpInside)
        view.addSubview(button2)
        button2.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(button1.snp.bottom).offset(16)
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalTo(45)
        }
        
        let button3 = UIButton(type: .system)
        button3.setTitle("MOVE", for: .normal)
        button3.setTitleColor(.white, for: .normal)
        button3.backgroundColor = .systemBlue
        button3.layer.borderColor = UIColor.black.cgColor
        button3.layer.borderWidth = 2
        button3.layer.cornerRadius = 8
        button3.addTarget(self, action: #selector(button3Tapped(_:)), for: .touchUpInside)
        view.addSubview(button3)
        button3.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(button2.snp.bottom).offset(16)
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalTo(45)
        }
        
        let button4 = UIButton(type: .system)
        button4.setTitle("RESIZE", for: .normal)
        button4.setTitleColor(.white, for: .normal)
        button4.backgroundColor = .systemBlue
        button4.layer.borderColor = UIColor.black.cgColor
        button4.layer.borderWidth = 2
        button4.layer.cornerRadius = 8
        button4.addTarget(self, action: #selector(button4Tapped(_:)), for: .touchUpInside)
        view.addSubview(button4)
        button4.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(button3.snp.bottom).offset(16)
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalTo(45)
        }
        
    }
    
    @objc func button1Tapped(_ sender : UIButton) {
        //INVISIBILITY
        if cardView?.alpha == 1 {
            UIView.animate(withDuration: 0.7) {
                self.cardView?.alpha = 0
            }
        }
        else if cardView?.alpha == 0 {
            UIView.animate(withDuration: 0.7) {
                self.cardView?.alpha = 1
            }
        }
    }
    
    @objc func button2Tapped(_ sender : UIButton) {
        //ROTATION
        UIView.animate(withDuration: 0.7) {
            self.cardView?.transform = (self.cardView?.transform.rotated(by: .pi))!
        }
    }

    @objc func button3Tapped(_ sender : UIButton) {
        //ROTATION
        if button3Bool {
            UIView.animate(withDuration: 0.7) {
                self.cardView?.snp.remakeConstraints({ make in
                    make.centerX.equalToSuperview()
                    make.top.equalToSuperview().offset(100)
                    make.width.equalToSuperview().multipliedBy(0.7)
                    make.height.equalTo(self.cardView!.snp.width)
                })
            }
        } else {
            UIView.animate(withDuration: 0.7) {
                self.cardView?.snp.remakeConstraints({ make in
                    make.centerX.equalToSuperview().offset(100)
                    make.top.equalToSuperview().offset(100)
                    make.width.equalToSuperview().multipliedBy(0.7)
                    make.height.equalTo(self.cardView!.snp.width)
                })
            }
        }
        button3Bool.toggle()
    }
    
    @objc func button4Tapped(_ sender : UIButton) {
        //ROTATION
        if button4Bool {
            UIView.animate(withDuration: 0.7) {
                self.cardView?.snp.remakeConstraints({ make in
                    make.centerX.equalToSuperview()
                    make.top.equalToSuperview().offset(100)
                    make.width.equalToSuperview().multipliedBy(0.7)
                    make.height.equalTo(self.cardView!.snp.width)
                })
            }
        } else {
            UIView.animate(withDuration: 0.7) {
                self.cardView?.snp.remakeConstraints({ make in
                    make.centerX.equalToSuperview()
                    make.top.equalToSuperview().offset(100)
                    make.width.equalToSuperview().multipliedBy(0.9)
                    make.height.equalTo(self.cardView!.snp.width)
                })
            }
        }
        button4Bool.toggle()
    }

}

