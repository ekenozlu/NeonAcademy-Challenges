//
//  ViewController.swift
//  Sliders
//
//  Created by Eken Özlü on 3.10.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var dragonImage : UIImageView?
    var dragonColor : UIColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1) {
        didSet {
            dragonImage?.tintColor = dragonColor
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .white
        dragonImage = UIImageView()
        dragonImage?.image = UIImage(named: "dragon")?.withRenderingMode(.alwaysTemplate)
        dragonImage?.tintColor = dragonColor
        dragonImage?.contentMode = .scaleAspectFill
        view.addSubview(dragonImage!)
        dragonImage?.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.6)
            make.height.equalTo(dragonImage!.snp.width)
        }
        
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 50
        slider.minimumTrackTintColor = .black
        slider.thumbTintColor = UIColor.blue
        slider.addTarget(self, action: #selector(valueChanged(_:)), for: .valueChanged)
        view.addSubview(slider)
        slider.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(dragonImage!.snp.bottom).offset(32)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(30)
        }
    }
    
    @objc func valueChanged(_ sender : UISlider) {
        sender.value = roundf(sender.value)
        let redValue : CGFloat = CGFloat((sender.value * 5.1))/255
        let greenValue : CGFloat = CGFloat(255-(sender.value * 5.1))/255
        dragonColor = UIColor(red: redValue, green: greenValue, blue: 0, alpha: 1)
    }
}

