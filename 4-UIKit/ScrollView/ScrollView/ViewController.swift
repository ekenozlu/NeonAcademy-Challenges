//
//  ViewController.swift
//  ScrollView
//
//  Created by Eken Özlü on 4.10.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var scrollview : UIScrollView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .red
        
        scrollview = UIScrollView()
        scrollview?.backgroundColor = .yellow
        scrollview?.bounces = true
        scrollview?.indicatorStyle = .black
        scrollview?.isScrollEnabled = true
        scrollview?.delegate = self
        view.addSubview(scrollview!)
        scrollview?.snp.makeConstraints({ make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        })
        scrollview?.contentSize = CGSize(width: view.frame.width, height: view.frame.height*2)
        
        
        
        for i in 0...7 {
            let label = UILabel()
            label.text = "Label \(i+1)"
            label.textColor = .black
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
            scrollview!.addSubview(label)
            let labelHeight = (scrollview!.frame.height - (20*3)) / 4
            label.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.width.equalToSuperview().multipliedBy(0.8)
                make.height.equalTo(view.frame.height / 4)
                make.top.equalToSuperview().offset((Int(view.frame.height) / 4)*i)
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var ac : UIAlertController?
        if (scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height)) {
            if ac == nil {
                ac = UIAlertController(title: "Attention",
                                       message: "You are at the bottom",
                                       preferredStyle: .alert)
                ac!.addAction(UIAlertAction(title: "OK", style: .cancel))
                present(ac!, animated: true)
            }
        }
    }
    
    
}



