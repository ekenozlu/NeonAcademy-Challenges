//
//  ViewController.swift
//  Neon Lottie
//
//  Created by Eken Özlü on 13.10.2023.
//

import UIKit
import NeonSDK
import SnapKit

class ViewController: UIViewController, NeonBasePageControlDelegate {
    
    let cardView = UIView()
    let pageControl  = NeonPageControlV1()
    let colorArray : [UIColor] = [.red,.yellow,.green,.black]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .white
        
        cardView.backgroundColor = colorArray.first
        view.addSubview(cardView)
        cardView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.width.height.equalTo(300)
        }
        
        pageControl.numberOfPages = colorArray.count
        pageControl.radius = 0
        pageControl.padding = 25
        pageControl.elementWidth = 30
              pageControl.currentPageTintColor = .brown
        pageControl.tintColors = colorArray
        pageControl.progress = 0
        pageControl.enableTouchEvents = true
        pageControl.delegate = self
        
        view.addSubview(pageControl)
        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.top.equalTo(cardView.snp.bottom).offset(32)
        }
        
    }
    
    func didTouch(pager: NeonSDK.NeonBasePageControl, index: Int) {
        pageControl.progress = Double(index)
        cardView.backgroundColor = colorArray[index]
    }
    
    
}


#Preview{
    ViewController()
}
