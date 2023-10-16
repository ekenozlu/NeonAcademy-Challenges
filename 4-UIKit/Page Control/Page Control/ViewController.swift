//
//  ViewController.swift
//  Page Control
//
//  Created by Eken Özlü on 4.10.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var newsImageView : UIImageView?
    var newsTitle : UILabel?
    var newsText : UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        
    }
    
    func createUI() {
        view.backgroundColor = .white
        let mainTitle = UILabel()
        mainTitle.text = "Kingdom News"
        mainTitle.textColor = .black
        mainTitle.font = UIFont.systemFont(ofSize: 48, weight: .bold)
        mainTitle.textAlignment = .center
        view.addSubview(mainTitle)
        mainTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(50)
        }
        
        let newsView = UIView()
        newsView.backgroundColor = .lightGray
        newsView.layer.cornerRadius = 8
        view.addSubview(newsView)
        newsView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalToSuperview().multipliedBy(0.6)
        }
        
        newsImageView = UIImageView()
        newsImageView?.contentMode = .scaleAspectFill
        newsImageView?.backgroundColor = .darkGray
        newsImageView?.layer.cornerRadius = 8
        newsImageView?.clipsToBounds = true
        newsImageView?.image = newsArray[0].image
        newsView.addSubview(newsImageView!)
        newsImageView?.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(8)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(newsImageView!.snp.width).multipliedBy(0.6)
        }
        
        newsTitle = UILabel()
        newsTitle?.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        newsTitle?.textAlignment = .left
        newsTitle?.numberOfLines = 2
        newsTitle?.textColor = .black
        newsTitle?.text = newsArray[0].title
        newsView.addSubview(newsTitle!)
        newsTitle?.snp.makeConstraints { make in
            make.leading.equalTo(newsImageView!.snp.leading)
            make.trailing.equalTo(newsImageView!.snp.trailing)
            make.top.equalTo(newsImageView!.snp.bottom).offset(4)
            make.height.equalTo(60)
        }
        
        newsText = UILabel()
        newsText?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        newsText?.textAlignment = .left
        newsText?.numberOfLines = 0
        newsText?.textColor = .black
        newsText?.text = newsArray[0].text
        newsView.addSubview(newsText!)
        newsText?.snp.makeConstraints { make in
            make.leading.equalTo(newsImageView!.snp.leading)
            make.trailing.equalTo(newsImageView!.snp.trailing)
            make.top.equalTo(newsTitle!.snp.bottom).offset(4)
            make.bottom.equalTo(newsView.snp.bottom).offset(4)
        }
        
        let pageController = UIPageControl()
        pageController.currentPage = 0
        pageController.numberOfPages = newsArray.count
        pageController.currentPageIndicatorTintColor = .green
        pageController.pageIndicatorTintColor = .red
        pageController.backgroundColor = .darkGray
        pageController.backgroundStyle = .minimal
        pageController.clipsToBounds = true
        pageController.addTarget(self, action: #selector(changePage(_:)), for: .valueChanged)
        view.addSubview(pageController)
        pageController.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(newsView.snp.bottom).offset(8)
            make.width.equalTo(newsView.snp.width)
            make.height.equalTo(20)
        }
        pageController.layer.cornerRadius = pageController.frame.height / 2
    
    }
    
    @objc func changePage(_ sender : UIPageControl) {
        newsImageView!.image = newsArray[sender.currentPage].image
        newsTitle!.text = newsArray[sender.currentPage].title
        newsText!.text = newsArray[sender.currentPage].text
    }
}

