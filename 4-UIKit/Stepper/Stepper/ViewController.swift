//
//  ViewController.swift
//  Stepper
//
//  Created by Eken Özlü on 4.10.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var stepperValueLabel : UILabel?
    var dressImage : UIImageView?
    var imageArray : [UIImage] = [UIImage(named: "image0")!,UIImage(named: "image1")!,
                                  UIImage(named: "image2")!,UIImage(named: "image3")!,
                                  UIImage(named: "image4")!,UIImage(named: "image5")!,
                                  UIImage(named: "image6")!,UIImage(named: "image7")!,
                                  UIImage(named: "image8")!,UIImage(named: "image9")!,
                                  UIImage(named: "image10")!]
    
    var stepperValue : String = "0" {
        didSet {
            stepperValueLabel?.text = stepperValue
            dressImage?.image = imageArray[Int(stepperValue)!/5]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .white
        
        stepperValueLabel = UILabel()
        stepperValueLabel?.text = "0"
        stepperValueLabel?.textAlignment = .center
        stepperValueLabel?.textColor = .black
        stepperValueLabel?.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        view.addSubview(stepperValueLabel!)
        stepperValueLabel?.snp.makeConstraints({ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(50)
        })
        
        dressImage = UIImageView()
        dressImage?.image = imageArray[0]
        dressImage?.contentMode = .scaleAspectFit
        view.addSubview(dressImage!)
        dressImage?.snp.makeConstraints({ make in
            make.top.equalTo(stepperValueLabel!.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.6)
            make.height.equalTo(dressImage!.snp.width)
        })
        
        let stepper = UIStepper()
        stepper.value = 0
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        stepper.stepValue = 1
        stepper.backgroundColor = .systemPink
        stepper.layer.cornerRadius = 4
        stepper.tintColor = .white
        stepper.transform = CGAffineTransform(scaleX: 3, y: 3)
        stepper.addTarget(self,
                          action: #selector(stepperValueChanged(_ :)),
                          for: .valueChanged)
        view.addSubview(stepper)
        stepper.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(dressImage!.snp.bottom).offset(128)
        }
    }
    
    @objc func stepperValueChanged(_ sender : UIStepper) {
        stepperValue = "\(Int(sender.value * 5))"
    }
}

