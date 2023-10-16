//
//  ViewController.swift
//  StackView
//
//  Created by Eken Özlü on 4.10.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var stackview : UIStackView?
    
    var spellArray : [String] = ["Expelliarmus","Sectumsempra","Patronus","Riddikulus"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .white
        
        stackview = UIStackView()
        stackview?.axis = .vertical
        stackview?.alignment = .fill
        stackview?.distribution = .fillEqually
        stackview?.spacing = 4
        stackview?.layoutMargins = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        stackview?.isLayoutMarginsRelativeArrangement = true
        stackview?.backgroundColor = .gray
        stackview?.translatesAutoresizingMaskIntoConstraints = false
        
        for index in 0...spellArray.count-1 {
            let label = UILabel()
            label.text = spellArray[index]
            label.textAlignment = .center
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 22, weight: .regular)
            label.numberOfLines = 1
            label.backgroundColor = .white
            stackview?.addArrangedSubview(label)
        }
        
        view.addSubview(stackview!)
        stackview?.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalTo(stackview!.snp.width)
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            stackview?.snp.remakeConstraints { make in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview()
                make.height.equalToSuperview().multipliedBy(0.7)
                make.width.equalTo(stackview!.snp.height)
            }
        } else {
            stackview?.snp.remakeConstraints { make in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview()
                make.width.equalToSuperview().multipliedBy(0.7)
                make.height.equalTo(stackview!.snp.width)
            }
        }
    }
    
}

