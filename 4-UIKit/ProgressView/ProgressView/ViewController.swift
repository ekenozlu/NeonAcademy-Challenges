//
//  ViewController.swift
//  ProgressView
//
//  Created by Eken Özlü on 4.10.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var progressView : UIProgressView?
    
    var progress : Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .darkGray
        
        progressView = UIProgressView(progressViewStyle: .bar)
        progressView?.progress = 0
        progressView?.trackTintColor = .black
        progressView?.progressTintColor = .blue
        view.addSubview(progressView!)
        progressView?.snp.makeConstraints({ make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(10)
        })
        progressView?.transform = (progressView?.transform.scaledBy(x: 1.0, y: 3.0))!
        
        let progressButton = UIButton(type: .system)
        progressButton.setTitle("Learned Something", for: .normal)
        progressButton.setTitleColor(.white, for: .normal)
        progressButton.backgroundColor = .blue
        progressButton.layer.cornerRadius = 8
        progressButton.layer.borderColor = UIColor.white.cgColor
        progressButton.layer.borderWidth = 2
        progressButton.addTarget(self, action: #selector(buttonFunc(_:)), for: .touchUpInside)
        view.addSubview(progressButton)
        progressButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(progressView!.snp.bottom).offset(32)
            make.width.equalToSuperview().multipliedBy(0.6)
            make.height.equalTo(70)
        }
        
    }
    
    @objc func buttonFunc(_ sender : UIButton) {
        progress += 0.1
        print("\(progress)")
        if Int(progress) == 1 {
            progress = 0.0
        }
        progressView?.setProgress(progress, animated: true)
    }

}

