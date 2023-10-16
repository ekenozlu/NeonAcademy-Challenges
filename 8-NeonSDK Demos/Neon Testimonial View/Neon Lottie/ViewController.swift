//
//  ViewController.swift
//  Neon Lottie
//
//  Created by Eken Özlü on 13.10.2023.
//

import UIKit
import NeonSDK
import SnapKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .white
        
        let testimonialView = NeonTestimonialView()
        testimonialView.testimonialTextColor = .black
        testimonialView.testimonialbackgroundColor = .lightGray
        testimonialView.currentTestimonialPageTintColor = .lightGray
        testimonialView.testimonialPageTintColor = .lightGray
        testimonialView.testimonialbackgroundCornerRadious = 12
        testimonialView.pageControlType = .V1
        view.addSubview(testimonialView)
        testimonialView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.height.equalTo(220)
        }
        
        testimonialView.addTestimonial(title: "PhoneCleaner",
                                       testimonial: "So, I decided to clean my phone with this app. I was able to get rid of so many useless photos and videos so easily! This app is amazing.",
                                       author: "Tuna Öztürk")
        testimonialView.addTestimonial(title: "PhoneCleaner",
                                       testimonial: "So, I decided to clean my phone with this app. I was able to get rid of so many useless photos and videos so easily! This app is amazing.",
                                       author: "Tuna Öztürk")
        testimonialView.addTestimonial(title: "PhoneCleaner",
                                       testimonial: "So, I decided to clean my phone with this app. I was able to get rid of so many useless photos and videos so easily! This app is amazing.",
                                       author: "Tuna Öztürk")
        
        
    }
    
    
}


#Preview{
    ViewController()
}
