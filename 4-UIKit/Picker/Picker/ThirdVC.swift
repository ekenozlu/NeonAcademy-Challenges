//
//  ThirdVC.swift
//  Picker
//
//  Created by Eken Özlü on 6.10.2023.
//

import UIKit
import SnapKit

class ThirdVC: UIViewController {
    
    var nextButton : UIButton?
    var selectedDate : Date = Date() {
        didSet {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .white
        self.title = "Choose your Date of Birth"
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.locale = .current
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        view.addSubview(datePicker)
        datePicker.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        nextButton = UIButton(type: .system)
        nextButton?.setTitle("Next", for: .normal)
        nextButton?.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .black)
        nextButton?.setTitleColor(.white, for: .normal)
        nextButton?.backgroundColor = .blue
        nextButton?.layer.cornerRadius = 8
        nextButton?.layer.borderColor = UIColor.black.cgColor
        nextButton?.layer.borderWidth = 2
        nextButton?.isHidden = true
        nextButton?.addTarget(self, action: #selector(nextButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(nextButton!)
        nextButton?.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(64)
            make.width.equalToSuperview().multipliedBy(0.3)
            make.height.equalTo(45)
        }
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        selectedDate = sender.date
        nextButton?.isHidden = false
        //let dateFormatter = DateFormatter()
        //dateFormatter.dateFormat = "dd-MMM-yyyy"
        //let selectedDate = dateFormatter.string(from: sender.date)
    }
    
    @objc func nextButtonTapped(_ sender : UIButton) {
        savedDate = selectedDate
        navigationController?.pushViewController(FourthVC(), animated: true)
    }
    
}
