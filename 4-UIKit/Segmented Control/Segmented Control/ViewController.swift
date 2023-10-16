//
//  ViewController.swift
//  Segmented Control
//
//  Created by Eken Özlü on 4.10.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var segView : UIView?
    var segmntedControl : UISegmentedControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .white
        
        segView = UIView()
        segView?.backgroundColor = .white
        view.addSubview(segView!)
        segView?.snp.makeConstraints({ make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.6)
            make.height.equalTo(40)
        })
        
        let items = ["Neon Apps 2023", "Neon", "Apps"]
        segmntedControl = UISegmentedControl(items: items)
        segmntedControl?.selectedSegmentIndex = 1
        segmntedControl?.backgroundColor = .lightGray
        segmntedControl?.selectedSegmentTintColor = UIColor(red: 116/255,
                                                            green: 238/255,
                                                            blue: 21/255,
                                                            alpha: 1)
        segmntedControl?.addTarget(self,
                                   action: #selector(segmentedControlValueChanged(_:)),
                                   for: .valueChanged)
        segView?.addSubview(segmntedControl!)
        segmntedControl?.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
    
    
    
    
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            UIView.animate(withDuration: 0.8) {
                self.segView?.snp.remakeConstraints({ make in
                    make.centerX.equalToSuperview()
                    make.centerY.equalToSuperview()
                    make.width.equalToSuperview().multipliedBy(0.9)
                    make.height.equalTo(40)
                })
                self.segmntedControl?.selectedSegmentTintColor = UIColor(red: 77/255,
                                                                         green: 238/255,
                                                                         blue: 234/255,
                                                                         alpha: 1)
            }
        case 1:
            UIView.animate(withDuration: 0.8) {
                self.segView?.snp.remakeConstraints({ make in
                    make.centerX.equalToSuperview()
                    make.centerY.equalToSuperview()
                    make.width.equalToSuperview().multipliedBy(0.6)
                    make.height.equalTo(40)
                })
                self.segmntedControl?.selectedSegmentTintColor = UIColor(red: 116/255,
                                                                         green: 238/255,
                                                                         blue: 21/255,
                                                                         alpha: 1)
            }
        case 2:
            UIView.animate(withDuration: 0.8) {
                self.segView?.snp.remakeConstraints({ make in
                    make.centerX.equalToSuperview()
                    make.centerY.equalToSuperview()
                    make.width.equalToSuperview().multipliedBy(0.3)
                    make.height.equalTo(40)
                })
                self.segmntedControl?.selectedSegmentTintColor = UIColor(red: 255/255,
                                                                         green: 231/255,
                                                                         blue: 0/255,
                                                                         alpha: 1)
            }
        default:
            break
        }
    }
    
}
