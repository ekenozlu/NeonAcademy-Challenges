//
//  ViewController.swift
//  Activity Indicator
//
//  Created by Eken Özlü on 4.10.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var label : UILabel?
    
    var actInd : UIActivityIndicatorView?
    
    var countButton : UIButton?
    
    var colorArray : [UIColor] = [.red,.blue,.green,.orange,.brown,
                                  .systemPink,.yellow,.purple,.cyan,.systemMint]
    
    var timer : Timer?
    
    var counter = 0 {
        didSet {
            label?.text = "\(counter)"
            if counter == 100 {
                timer?.invalidate()
                counter = 0
                label?.text = "\(counter)"
                currentColorIndex = 0
                actInd?.stopAnimating()
                countButton?.isEnabled = true
            }
            if counter % 10 == 0 {
                currentColorIndex += 1
            }
        }
    }
    
    var currentColorIndex = 0 {
        didSet {
            label?.textColor = colorArray[currentColorIndex]
            actInd?.color = colorArray[currentColorIndex]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }

    func createUI(){
        view.backgroundColor = .black
        
        label = UILabel()
        label?.text = "0"
        label?.textColor = .red
        label?.textAlignment = .center
        label?.font = UIFont.systemFont(ofSize: 48, weight: .bold)
        view.addSubview(label!)
        label?.snp.makeConstraints({ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(55)
        })
        
        actInd = UIActivityIndicatorView(style: .large)
        actInd?.color = .red
        actInd?.stopAnimating()
        view.addSubview(actInd!)
        actInd?.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(label!.snp.bottom).offset(16)
            make.width.equalTo(label!.snp.width)
            make.height.equalTo(label!.snp.height)
        }
        
        countButton = UIButton(type: .system)
        countButton?.setTitle("Start Counting", for: .normal)
        countButton?.setTitleColor(.white, for: .normal)
        countButton?.backgroundColor = .blue
        countButton?.layer.cornerRadius = 8
        countButton?.layer.borderColor = UIColor.white.cgColor
        countButton?.layer.borderWidth = 3
        countButton?.addTarget(self, action: #selector(countFunc(_:)), for: .touchUpInside)
        view.addSubview(countButton!)
        countButton?.snp.makeConstraints({ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(actInd!.snp.bottom).offset(16)
            make.width.equalToSuperview().multipliedBy(0.6)
            make.height.equalTo(50)
        })
    }
    
    
    @objc func countFunc(_ sender : UIButton) {
        sender.isEnabled = false
        actInd?.startAnimating()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
            self.counter += 1
        }
    }

}

