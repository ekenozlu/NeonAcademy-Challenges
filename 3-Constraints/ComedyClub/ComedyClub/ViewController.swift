//
//  ViewController.swift
//  ComedyClub
//
//  Created by Eken Özlü on 3.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var screenWidth : CGFloat?
    var screenHeight : CGFloat?

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI(){
        view.backgroundColor = .cyan
        
        let safeAreaFrame = view.safeAreaLayoutGuide.layoutFrame
        screenWidth = safeAreaFrame.width
        screenHeight = safeAreaFrame.height
        
        let topView = UIView()
        topView.frame = CGRect(x: safeAreaFrame.minX + 16, y: safeAreaFrame.minY + 80,
                               width: safeAreaFrame.width-32, height: safeAreaFrame.height / 14)
        view.addSubview(topView)
        
        let titleLabel = UILabel()
        titleLabel.text = "Comedy Club"
        titleLabel.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        titleLabel.textColor = .label
        titleLabel.textAlignment = .center
        titleLabel.frame = CGRect(x: 4, y: 4,
                                  width: topView.frame.width-8, height: topView.frame.height-8)
        topView.addSubview(titleLabel)
        
        let midView = UIView()
        midView.backgroundColor = .white
        midView.layer.cornerRadius = 8
        midView.frame = CGRect(x: topView.frame.minX, y: topView.frame.maxY + 8,
                               width: safeAreaFrame.width-32, height: safeAreaFrame.height / 3)
        view.addSubview(midView)
        
        let mainImage = UIImageView()
        mainImage.image = UIImage(named: "comedyClub")
        mainImage.layer.cornerRadius = 8
        mainImage.layer.masksToBounds = true
        mainImage.frame = CGRect(x: 8, y: 8,
                                 width: midView.frame.width-16, height: (midView.frame.width-16)/2)
        midView.addSubview(mainImage)
        
        let mainLabel = UILabel()
        mainLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        mainLabel.textColor = .black
        mainLabel.numberOfLines = 1
        mainLabel.textAlignment = .left
        mainLabel.text = "Welcome to Comedy Club"
        mainLabel.frame = CGRect(x: 8, y: mainImage.frame.maxY + 4,
                                 width: midView.frame.width-16, height: 22)
        midView.addSubview(mainLabel)
        
        let secLabel = UILabel()
        secLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        secLabel.textColor = .black
        secLabel.numberOfLines = 0
        secLabel.textAlignment = .justified
        secLabel.text = "Here, we specialize in the art of hilariously unreal humor. Our talented comedians create fictional worlds, absurd scenarios, and imaginary characters that will leave you in stitches. Join us for a night of make-believe mirth and experience comedy that's so fake, it's fantastically funny. Get ready to suspend reality and dive into a world where the only thing real is the laughter!"
        secLabel.frame = CGRect(x: 8, y: mainLabel.frame.maxY + 4,
                                width: midView.frame.width-16, height: midView.frame.height - mainLabel.frame.maxY - 8)
        midView.addSubview(secLabel)
        
        let bottomView = UIView()
        bottomView.frame = CGRect(x: midView.frame.minX, y: midView.frame.maxY + 8,
                                  width: safeAreaFrame.width-32, height: safeAreaFrame.height / 18)
        view.addSubview(bottomView)
        
        let titleLabel2 = UILabel()
        titleLabel2.text = "Next Events"
        titleLabel2.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        titleLabel2.textColor = .label
        titleLabel2.textAlignment = .left
        titleLabel2.frame = CGRect(x: 4, y: 4,
                                   width: bottomView.frame.width-8, height: bottomView.frame.height-8)
        bottomView.addSubview(titleLabel2)
        
        let cellWidth = safeAreaFrame.width-32
        let cellHeight = safeAreaFrame.height / 9
        for index in 0...2 {
            let posY = bottomView.frame.maxY + CGFloat(cellHeight * CGFloat(index)) + CGFloat(8 * index) + 8
            let cell = UIView(frame: CGRect(x: bottomView.frame.minX, y: posY,
                                            width: cellWidth, height: cellHeight))
            cell.backgroundColor = .white
            cell.layer.cornerRadius = 8
            view.addSubview(cell)
            
            let photoImage = UIImageView(image: UIImage(systemName: "theatermasks"))
            photoImage.frame = CGRect(x: 24, y: 12, width: cellHeight-24, height: cellHeight-24)
            photoImage.tintColor = .black
            photoImage.contentMode = .scaleAspectFill
            cell.addSubview(photoImage)
            
            let eventTitle = UILabel()
            eventTitle.frame = CGRect(x: photoImage.frame.maxX + 32, y: photoImage.frame.minY,
                                      width: cellWidth/2, height: cellHeight/3)
            eventTitle.font  = UIFont.systemFont(ofSize: 22,weight: .bold)
            eventTitle.textColor = .black
            eventTitle.text = "Stand-Up No:\(index+1)"
            cell.addSubview(eventTitle)
            
            let priceTitle = UILabel()
            priceTitle.frame = CGRect(x: eventTitle.frame.minX, y: eventTitle.frame.maxY + 8,
                                      width: eventTitle.frame.width, height: cellHeight/3)
            priceTitle.font  = UIFont.systemFont(ofSize: 22,weight: .light)
            priceTitle.textColor = .black
            priceTitle.text = "$5"
            cell.addSubview(priceTitle)
        }
    }

}
