//
//  ViewController.swift
//  FutureTech
//
//  Created by Eken Özlü on 3.10.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var timeLabel : UILabel?
    var device1Image : UIImageView?
    var device1Sublabel : UILabel?
    var device2Image : UIImageView?
    var device2Sublabel : UILabel?
    var device3Image : UIImageView?
    var device3Sublabel : UILabel?
    var device4Image : UIImageView?
    var device4Sublabel : UILabel?
    
    var device1Status : Bool = false
    var device2Status : Bool = false
    var device3Status : Bool = false
    var device4Status : Bool = false
    
    var timer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimeLabel), userInfo: nil, repeats: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer?.invalidate()
    }
    
    func createUI(){
        view.backgroundColor = .darkGray
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 64, weight: .bold)
        titleLabel.text = "FutureTech"
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(64)
            make.centerX.equalToSuperview()
        }
        
        let upperInfoView = UIView()
        upperInfoView.translatesAutoresizingMaskIntoConstraints = false
        upperInfoView.backgroundColor = .gray
        upperInfoView.layer.cornerRadius = 8
        view.addSubview(upperInfoView)
        upperInfoView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.height.equalTo(100)
            make.width.equalTo(view.bounds.width * 0.9)
        }
        
        timeLabel = UILabel()
        timeLabel!.translatesAutoresizingMaskIntoConstraints = false
        timeLabel!.font = UIFont.systemFont(ofSize: 72)
        timeLabel!.textColor = .white
        timeLabel!.textAlignment = .left
        upperInfoView.addSubview(timeLabel!)
        timeLabel!.text = getCurrentTime()
        timeLabel!.snp.makeConstraints { make in
            make.bottom.equalTo(upperInfoView.snp.bottom).inset(4)
            make.leading.equalTo(upperInfoView.snp.leading).inset(16)
            make.width.equalToSuperview().dividedBy(2)
        }
        
        let dateLabel = UILabel()
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = UIFont.systemFont(ofSize: 22)
        dateLabel.textColor = .white
        dateLabel.textAlignment = .right
        upperInfoView.addSubview(dateLabel)
        dateLabel.text = getCurrentFormattedDate()
        dateLabel.snp.makeConstraints { make in
            make.bottom.equalTo(timeLabel!.snp.bottom)
            make.trailing.equalToSuperview().inset(16)
            make.width.equalToSuperview().dividedBy(2)
            make.height.equalTo(timeLabel!.snp.height).dividedBy(2)
        }
        
        let middleInfoView = UIView()
        middleInfoView.translatesAutoresizingMaskIntoConstraints = false
        middleInfoView.backgroundColor = .gray
        middleInfoView.layer.cornerRadius = 8
        view.addSubview(middleInfoView)
        middleInfoView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(upperInfoView.snp.bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(middleInfoView.snp.width)
        }
        
        let device1View = UIView()
        device1View.translatesAutoresizingMaskIntoConstraints = false
        device1View.backgroundColor = .white
        device1View.alpha = 0.5
        device1View.layer.cornerRadius = 8
        device1View.accessibilityIdentifier = "device1"
        middleInfoView.addSubview(device1View)
        let tapG1 = UITapGestureRecognizer(target: self, action: #selector(device1Tapped(_:)))
        device1View.addGestureRecognizer(tapG1)
        device1View.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(16)
            make.width.equalTo(middleInfoView.snp.width).multipliedBy(0.4)
            make.height.equalTo(middleInfoView.snp.width).multipliedBy(0.4)
        }
        
        device1Image = UIImageView()
        device1Image!.translatesAutoresizingMaskIntoConstraints = false
        device1Image!.image = UIImage(systemName: "lamp.desk")
        device1Image!.contentMode = .scaleAspectFit
        device1Image!.tintColor = .blue
        device1View.addSubview(device1Image!)
        device1Image!.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(8)
            make.top.equalToSuperview().inset(8)
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalToSuperview().multipliedBy(0.4)
        }
        
        let device1Label = UILabel()
        device1Label.translatesAutoresizingMaskIntoConstraints = false
        device1Label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        device1Label.text = "Desk Lamp"
        device1Label.textColor = .blue
        device1Label.textAlignment = .left
        device1Label.numberOfLines = 2
        device1View.addSubview(device1Label)
        device1Label.snp.makeConstraints { make in
            make.leading.equalTo(device1Image!)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.top.equalTo(device1Image!.snp.bottom).offset(4)
        }
        
        device1Sublabel = UILabel()
        device1Sublabel!.translatesAutoresizingMaskIntoConstraints = false
        device1Sublabel!.font = UIFont.systemFont(ofSize: 14, weight: .light)
        device1Sublabel!.text = "Off"
        device1Sublabel!.textColor = .blue
        device1Sublabel!.textAlignment = .left
        device1View.addSubview(device1Sublabel!)
        device1Sublabel!.snp.makeConstraints { make in
            make.leading.equalTo(device1Label)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.top.equalTo(device1Label.snp.bottom).offset(4)
        }
        
        let device2View = UIView()
        device2View.translatesAutoresizingMaskIntoConstraints = false
        device2View.backgroundColor = .white
        device2View.alpha = 0.5
        device2View.layer.cornerRadius = 8
        middleInfoView.addSubview(device2View)
        let tapG2 = UITapGestureRecognizer(target: self, action: #selector(device2Tapped(_:)))
        device2View.addGestureRecognizer(tapG2)
        device2View.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(16)
            make.width.equalTo(middleInfoView.snp.width).multipliedBy(0.4)
            make.height.equalTo(middleInfoView.snp.width).multipliedBy(0.4)
        }
        
        device2Image = UIImageView()
        device2Image!.translatesAutoresizingMaskIntoConstraints = false
        device2Image!.image = UIImage(systemName: "spigot")
        device2Image!.contentMode = .scaleAspectFit
        device2Image!.tintColor = .blue
        device2View.addSubview(device2Image!)
        device2Image!.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(8)
            make.top.equalToSuperview().inset(8)
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalToSuperview().multipliedBy(0.4)
        }
        
        let device2Label = UILabel()
        device2Label.translatesAutoresizingMaskIntoConstraints = false
        device2Label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        device2Label.text = "Kitchen Faucet"
        device2Label.textColor = .blue
        device2Label.textAlignment = .left
        device2Label.numberOfLines = 2
        device2View.addSubview(device2Label)
        device2Label.snp.makeConstraints { make in
            make.leading.equalTo(device2Image!)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.top.equalTo(device2Image!.snp.bottom).offset(4)
        }
        
        device2Sublabel = UILabel()
        device2Sublabel!.translatesAutoresizingMaskIntoConstraints = false
        device2Sublabel!.font = UIFont.systemFont(ofSize: 14, weight: .light)
        device2Sublabel!.text = "Not Running"
        device2Sublabel!.textColor = .blue
        device2Sublabel!.textAlignment = .left
        device2View.addSubview(device2Sublabel!)
        device2Sublabel!.snp.makeConstraints { make in
            make.leading.equalTo(device2Label)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.top.equalTo(device2Label.snp.bottom).offset(4)
        }
        
        let device3View = UIView()
        device3View.translatesAutoresizingMaskIntoConstraints = false
        device3View.backgroundColor = .white
        device3View.alpha = 0.5
        device3View.layer.cornerRadius = 8
        middleInfoView.addSubview(device3View)
        let tapG3 = UITapGestureRecognizer(target: self, action: #selector(device3Tapped(_:)))
        device3View.addGestureRecognizer(tapG3)
        device3View.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.top.equalTo(device1View.snp.bottom).offset(16)
            make.width.equalTo(middleInfoView.snp.width).multipliedBy(0.4)
            make.height.equalTo(middleInfoView.snp.width).multipliedBy(0.4)
        }
        
        device3Image = UIImageView()
        device3Image!.translatesAutoresizingMaskIntoConstraints = false
        device3Image!.image = UIImage(systemName: "door.left.hand.closed")
        device3Image!.contentMode = .scaleAspectFit
        device3Image!.tintColor = .blue
        device3View.addSubview(device3Image!)
        device3Image!.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(8)
            make.top.equalToSuperview().inset(8)
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalToSuperview().multipliedBy(0.4)
        }
        
        let device3Label = UILabel()
        device3Label.translatesAutoresizingMaskIntoConstraints = false
        device3Label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        device3Label.text = "Front Door"
        device3Label.textColor = .blue
        device3Label.textAlignment = .left
        device3Label.numberOfLines = 2
        device3View.addSubview(device3Label)
        device3Label.snp.makeConstraints { make in
            make.leading.equalTo(device3Image!)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.top.equalTo(device3Image!.snp.bottom).offset(4)
        }
        
        device3Sublabel = UILabel()
        device3Sublabel!.translatesAutoresizingMaskIntoConstraints = false
        device3Sublabel!.font = UIFont.systemFont(ofSize: 14, weight: .light)
        device3Sublabel!.text = "Closed"
        device3Sublabel!.textColor = .blue
        device3Sublabel!.textAlignment = .left
        device3View.addSubview(device3Sublabel!)
        device3Sublabel!.snp.makeConstraints { make in
            make.leading.equalTo(device3Label)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.top.equalTo(device3Label.snp.bottom).offset(4)
        }
        
        let device4View = UIView()
        device4View.translatesAutoresizingMaskIntoConstraints = false
        device4View.backgroundColor = .white
        device4View.alpha = 0.5
        device4View.layer.cornerRadius = 8
        middleInfoView.addSubview(device4View)
        let tapG4 = UITapGestureRecognizer(target: self, action: #selector(device4Tapped(_:)))
        device4View.addGestureRecognizer(tapG4)
        device4View.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.top.equalTo(device2View.snp.bottom).offset(16)
            make.width.equalTo(middleInfoView.snp.width).multipliedBy(0.4)
            make.height.equalTo(middleInfoView.snp.width).multipliedBy(0.4)
        }
        
        device4Image = UIImageView()
        device4Image!.translatesAutoresizingMaskIntoConstraints = false
        device4Image!.image = UIImage(systemName: "lamp.ceiling")
        device4Image!.contentMode = .scaleAspectFit
        device4Image!.tintColor = .blue
        device4View.addSubview(device4Image!)
        device4Image!.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(8)
            make.top.equalToSuperview().inset(8)
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalToSuperview().multipliedBy(0.4)
        }
        
        let device4Label = UILabel()
        device4Label.translatesAutoresizingMaskIntoConstraints = false
        device4Label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        device4Label.text = "Living Room Lamp"
        device4Label.textColor = .blue
        device4Label.textAlignment = .left
        device4Label.numberOfLines = 2
        device4View.addSubview(device4Label)
        device4Label.snp.makeConstraints { make in
            make.leading.equalTo(device4Image!)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.top.equalTo(device4Image!.snp.bottom).offset(4)
        }
        
        device4Sublabel = UILabel()
        device4Sublabel!.translatesAutoresizingMaskIntoConstraints = false
        device4Sublabel!.font = UIFont.systemFont(ofSize: 14, weight: .light)
        device4Sublabel!.text = "Off"
        device4Sublabel!.textColor = .blue
        device4Sublabel!.textAlignment = .left
        device4View.addSubview(device4Sublabel!)
        device4Sublabel!.snp.makeConstraints { make in
            make.leading.equalTo(device4Label)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.top.equalTo(device4Label.snp.bottom).offset(4)
        }
    }
    
    @objc func updateTimeLabel() {
        timeLabel!.text = getCurrentTime()
    }
    
    func getCurrentTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: Date())
    }
    
    func getCurrentFormattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM yyyy"
        return dateFormatter.string(from: Date())
    }
    
    @objc func device1Tapped(_ sender: UITapGestureRecognizer) {
        if device1Status {
            device1Image?.image = UIImage(systemName: "lamp.desk")
            device1Sublabel?.text = "Off"
        } else {
            device1Image?.image = UIImage(systemName: "lamp.desk.fill")
            device1Sublabel?.text = "On"
        }
        device1Status.toggle()
    }
    
    @objc func device2Tapped(_ sender: UITapGestureRecognizer) {
        if device2Status {
            device2Image?.image = UIImage(systemName: "spigot")
            device2Sublabel?.text = "Not Running"
        } else {
            device2Image?.image = UIImage(systemName: "spigot.fill")
            device2Sublabel?.text = "Running"
        }
        device2Status.toggle()
    }
    
    @objc func device3Tapped(_ sender: UITapGestureRecognizer) {
        if device3Status {
            device3Image?.image = UIImage(systemName: "door.left.hand.closed")
            device3Sublabel?.text = "Closed"
        } else {
            device3Image?.image = UIImage(systemName: "door.left.hand.open")
            device3Sublabel?.text = "Open"
        }
        device3Status.toggle()
    }
    
    @objc func device4Tapped(_ sender: UITapGestureRecognizer) {
        if device4Status {
            device4Image?.image = UIImage(systemName: "lamp.ceiling")
            device4Sublabel?.text = "Closed"
        } else {
            device4Image?.image = UIImage(systemName: "lamp.ceiling.fill")
            device4Sublabel?.text = "Open"
        }
        device4Status.toggle()
    }
}



