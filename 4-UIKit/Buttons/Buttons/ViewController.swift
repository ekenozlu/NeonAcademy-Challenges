//
//  ViewController.swift
//  Buttons
//
//  Created by Eken Özlü on 3.10.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var overlayView: UIView?
    var button5 : UIButton?
    var button6 : UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .white
        
        let button1 = UIButton(type: .system)
        button1.setTitle("Dropdown Menu Button", for: .normal)
        button1.setTitleColor(.white, for: .normal)
        button1.backgroundColor = UIColor.blue
        button1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button1.layer.cornerRadius = 10
        button1.layer.masksToBounds = true
        button1.showsMenuAsPrimaryAction = true
        
        lazy var opt1 = UIAction(title: "First Option",image: UIImage(systemName: "square.and.arrow.up"),
                                 attributes: [], state: .off) { _ in
            print("First")
        }
        lazy var opt2 = UIAction(title: "Second Option",image: UIImage(systemName: "square.and.arrow.down.fill"),
                                 attributes: [], state: .off) { _ in
            print("Second")
        }
        
        lazy var elements : [UIAction] = [opt1,opt2]
        button1.menu = UIMenu(title: "Options", children: elements)
        view.addSubview(button1)
        button1.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(128)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.6)
            make.height.equalTo(button1.snp.width).multipliedBy(0.3)
        }
        
        let button2 = UIButton(type: .system)
        button2.setTitle("Show Daily Specials", for: .normal)
        button2.setTitleColor(.white, for: .normal)
        button2.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button2.titleLabel?.textAlignment = .center
        button2.layer.cornerRadius = 10
        button2.layer.masksToBounds = true
        button2.layer.borderColor = UIColor.blue.cgColor
        button2.layer.borderWidth = 2
        button2.backgroundColor = .red
        button2.alpha = 0.5
        button2.layer.shadowColor = UIColor.black.cgColor
        button2.layer.shadowOffset = CGSize(width: 0, height: 2)
        button2.layer.shadowRadius = 4
        button2.layer.shadowOpacity = 0.5
        if let buttonImage = UIImage(named: "buttonImage") {
            button2.setBackgroundImage(buttonImage, for: .normal)
            button2.imageView?.contentMode = .scaleAspectFill
        }
        button2.addTarget(self, action: #selector(button2Func), for: .touchUpInside)
        view.addSubview(button2)
        button2.snp.makeConstraints { make in
            make.top.equalTo(button1.snp.bottom).offset(32)
            make.leading.equalTo(button1.snp.leading)
            make.trailing.equalTo(button1.snp.trailing)
            make.height.equalTo(button1.snp.height)
        }
        
        let button3 = UIButton(type: .system)
        button3.setTitle("Vigilant Button", for: .normal)
        button3.setTitleColor(.white, for: .normal)
        button3.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button3.titleLabel?.textAlignment = .center
        button3.layer.cornerRadius = 10
        button3.layer.masksToBounds = true
        button3.backgroundColor = .purple
        button3.addTarget(self, action: #selector(button3Tapped), for: .touchDown)
        button3.addTarget(self, action: #selector(button3Released), for: .touchUpInside)
        button3.addTarget(self, action: #selector(button3Released), for: .touchUpOutside)
        view.addSubview(button3)
        button3.snp.makeConstraints { make in
            make.top.equalTo(button2.snp.bottom).offset(32)
            make.leading.equalTo(button2.snp.leading)
            make.trailing.equalTo(button2.snp.trailing)
            make.height.equalTo(button2.snp.height)
        }
        
        let button4 = UIButton(type: .system)
        button4.setTitle("Blacksmith Button", for: .normal)
        button4.setTitleColor(.white, for: .normal)
        button4.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button4.titleLabel?.textAlignment = .center
        button4.layer.cornerRadius = 10
        button4.layer.masksToBounds = true
        button4.backgroundColor = .green
        button4.addTarget(self, action: #selector(button4Func), for: .touchUpInside)
        view.addSubview(button4)
        button4.snp.makeConstraints { make in
            make.top.equalTo(button3.snp.bottom).offset(32)
            make.leading.equalTo(button3.snp.leading)
            make.trailing.equalTo(button3.snp.trailing)
            make.height.equalTo(button3.snp.height)
        }
        
        button5 = UIButton(type: .system)
        button5?.setTitle("Blacksmith Sub-Button", for: .normal)
        button5?.isEnabled = true
        button5?.setTitleColor(.white, for: .normal)
        button5?.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button5?.titleLabel?.textAlignment = .center
        button5?.layer.cornerRadius = 10
        button5?.layer.masksToBounds = true
        button5?.backgroundColor = .systemBlue
        view.addSubview(button5!)
        button5?.snp.makeConstraints { make in
            make.top.equalTo(button4.snp.bottom).offset(32)
            make.leading.equalTo(button4.snp.leading)
            make.trailing.equalTo(button4.snp.trailing)
            make.height.equalTo(button4.snp.height)
        }
        
        button6 = UIButton(type: .system)
        button6?.setTitle("Robbery Button", for: .normal)
        button6?.setTitleColor(.white, for: .normal)
        button6?.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button6?.titleLabel?.textAlignment = .center
        button6?.layer.cornerRadius = 10
        button6?.layer.masksToBounds = true
        button6?.backgroundColor = .darkGray
        button6?.setImage(UIImage(named: "robberyImage"), for: .highlighted)
        button6?.addTarget(self, action: #selector(button6Func), for: .touchUpInside)
        view.addSubview(button6!)
        button6?.snp.makeConstraints { make in
            make.top.equalTo((button5?.snp.bottom)!).offset(32)
            make.leading.equalTo((button5?.snp.leading)!)
            make.trailing.equalTo((button5?.snp.trailing)!)
            make.height.equalTo((button5?.snp.height)!)
        }
    }

    @objc func button2Func() {
        let overlay = UIView(frame: UIScreen.main.bounds)
        overlay.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        let customView = UIView(frame: CGRect(x: 50, y: 200, width: overlay.frame.width-100, height: overlay.frame.height-400))
        customView.backgroundColor = .white
        
        let closeButton = UIButton(type: .system)
        closeButton.setTitle("Close", for: .normal)
        closeButton.addTarget(self, action: #selector(closeView), for: .touchUpInside)
        closeButton.frame = CGRect(x: 10, y: 10, width: 60, height: 40)
        
        let dailySpecialLabel = UILabel()
        dailySpecialLabel.frame = CGRect(x: 10, y: 30, width: customView.frame.width-20, height: customView.frame.height-60)
        dailySpecialLabel.textAlignment = .justified
        dailySpecialLabel.text = "Daily Specials, Daily Specials, Daily Specials, Daily Specials, Daily Specials, Daily Specials,                       Daily Specials, Daily Specials, Daily Specials, Daily Specials, Daily Specials, Daily Specials,                       Daily Specials"
        dailySpecialLabel.numberOfLines = 0
        
        customView.addSubview(closeButton)
        customView.addSubview(dailySpecialLabel)
        overlay.addSubview(customView)
        view.addSubview(overlay)
        self.overlayView = overlay
    }
    
    @objc func closeView() {
        overlayView?.removeFromSuperview()
    }
    
    @objc func button3Tapped() {
        view.backgroundColor = .yellow
    }
    
    @objc func button3Released() {
        view.backgroundColor = .white
    }
    
    @objc func button4Func() {
        if button5!.isEnabled {
            button5?.isEnabled = false
            button5?.setTitle("Call Blacksmith to Enable", for: .normal)
        } else {
            button5?.isEnabled = true
            button5?.setTitle("Blacksmith Sub-Button", for: .normal)
        }
    }
    
    @objc func button6Func() {
        shakeButton()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Simulate 2 seconds of progress
            self.button6?.setImage(UIImage(named: "robberyImage"), for: .highlighted)
        }
    }
    
    func shakeButton() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.08
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: view.center.x - 10, y: view.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: view.center.x + 10, y: view.center.y))
        view.layer.add(animation, forKey: "position")
    }
    
}

