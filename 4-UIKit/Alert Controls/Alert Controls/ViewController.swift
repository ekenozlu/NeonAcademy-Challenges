//
//  ViewController.swift
//  Alert Controls
//
//  Created by Eken Özlü on 4.10.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var label : UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI(){
        view.backgroundColor = .black
        
        label = UILabel()
        label?.text = ""
        label?.textColor = .white
        label?.textAlignment = .center
        label?.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        view.addSubview(label!)
        label?.snp.makeConstraints({ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(30)
        })
        
        let button1 = UIButton(type: .system)
        button1.setTitle("AC with Nothing", for: .normal)
        button1.setTitleColor(UIColor.white, for: .normal)
        button1.backgroundColor = .red
        button1.tintColor = .lightGray
        button1.layer.cornerRadius = 8
        button1.layer.borderColor = UIColor.white.cgColor
        button1.layer.borderWidth = 2
        button1.addTarget(self, action: #selector(button1Func(_:)), for: .touchUpInside)
        view.addSubview(button1)
        button1.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(label!.snp.bottom).offset(16)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalTo(45)
        }
        
        let button2 = UIButton(type: .system)
        button2.setTitle("AC with 1 Button", for: .normal)
        button2.setTitleColor(UIColor.white, for: .normal)
        button2.backgroundColor = .green
        button2.tintColor = .lightGray
        button2.layer.cornerRadius = 8
        button2.layer.borderColor = UIColor.white.cgColor
        button2.layer.borderWidth = 2
        button2.addTarget(self, action: #selector(button2Func(_:)), for: .touchUpInside)
        view.addSubview(button2)
        button2.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(button1.snp.bottom).offset(16)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalTo(45)
        }
        
        let button3 = UIButton(type: .system)
        button3.setTitle("AC with 2 Button", for: .normal)
        button3.setTitleColor(UIColor.white, for: .normal)
        button3.backgroundColor = .purple
        button3.tintColor = .lightGray
        button3.layer.cornerRadius = 8
        button3.layer.borderColor = UIColor.white.cgColor
        button3.layer.borderWidth = 2
        button3.addTarget(self, action: #selector(button3Func(_:)), for: .touchUpInside)
        view.addSubview(button3)
        button3.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(button2.snp.bottom).offset(16)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalTo(45)
        }
        
        let button4 = UIButton(type: .system)
        button4.setTitle("AC with TextField", for: .normal)
        button4.setTitleColor(UIColor.white, for: .normal)
        button4.backgroundColor = .brown
        button4.tintColor = .lightGray
        button4.layer.cornerRadius = 8
        button4.layer.borderColor = UIColor.white.cgColor
        button4.layer.borderWidth = 2
        button4.addTarget(self, action: #selector(button4Func(_:)), for: .touchUpInside)
        view.addSubview(button4)
        button4.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(button3.snp.bottom).offset(16)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalTo(45)
        }
        
        let button5 = UIButton(type: .system)
        button5.setTitle("AC with Action Sheet", for: .normal)
        button5.setTitleColor(UIColor.white, for: .normal)
        button5.backgroundColor = .blue
        button5.tintColor = .lightGray
        button5.layer.cornerRadius = 8
        button5.layer.borderColor = UIColor.white.cgColor
        button5.layer.borderWidth = 2
        button5.addTarget(self, action: #selector(button5Func(_:)), for: .touchUpInside)
        view.addSubview(button5)
        button5.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(button4.snp.bottom).offset(16)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalTo(45)
        }
        
        let button6 = UIButton(type: .system)
        button6.setTitle("AC with Activity Controller", for: .normal)
        button6.setTitleColor(UIColor.white, for: .normal)
        button6.backgroundColor = .orange
        button6.tintColor = .lightGray
        button6.layer.cornerRadius = 8
        button6.layer.borderColor = UIColor.white.cgColor
        button6.layer.borderWidth = 2
        button6.addTarget(self, action: #selector(button6Func(_:)), for: .touchUpInside)
        view.addSubview(button6)
        button6.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(button5.snp.bottom).offset(16)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalTo(45)
        }
    }
    
    @objc func button1Func(_ sender : UIButton){
        let ac = UIAlertController(title: "Alert",
                                   message: "Alert without any action",
                                   preferredStyle: .alert)
        present(ac, animated: true)
    }
    
    @objc func button2Func(_ sender : UIButton){
        let ac = UIAlertController(title: "Alert",
                                   message: "Alert with a button",
                                   preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Print 'Hello'", style: .default,handler: { _ in
            self.label?.text = "Hello"
        }))
        present(ac, animated: true)
    }
    
    @objc func button3Func(_ sender : UIButton){
        let ac = UIAlertController(title: "Alert",
                                   message: "Alert with 2 buttons",
                                   preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Button 1", style: .default,handler: { _ in
            self.label?.text = "Button 1 Clicked"
        }))
        ac.addAction(UIAlertAction(title: "Button 2", style: .default,handler: { _ in
            self.label?.text = "Button 2 Clicked"
        }))
        present(ac, animated: true)
    }
    
    @objc func button4Func(_ sender : UIButton){
        let ac = UIAlertController(title: "Alert",
                                   message: "Alert with TextField",
                                   preferredStyle: .alert)
        ac.addTextField { textfield in
            textfield.placeholder = "Enter Text"
            textfield.borderStyle = .roundedRect
        }
        
        ac.addAction(UIAlertAction(title: "Print Text", style: .default, handler: { _ in
            self.label?.text = ac.textFields?.first?.text
        }))
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        present(ac, animated: true)
    }
    
    @objc func button5Func(_ sender : UIButton){
        let ac = UIAlertController(title: "Alert",
                                   message: "Alert with TextField",
                                   preferredStyle: .actionSheet)
        
        ac.addAction(UIAlertAction(title: "Button 1", style: .default))
        ac.addAction(UIAlertAction(title: "Button 2", style: .default))
        ac.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        present(ac, animated: true)
    }
    
    @objc func button6Func(_ sender : UIButton){
        let shareText = "Check out this awesome app!"
        let shareURL = URL(string: "https://www.example.com")
        let activityItems: [Any] = [shareText, shareURL as Any]
                
        let activityController = UIActivityViewController(activityItems: activityItems,
                                                          applicationActivities: nil)
        self.present(activityController, animated: true)
    }


}

