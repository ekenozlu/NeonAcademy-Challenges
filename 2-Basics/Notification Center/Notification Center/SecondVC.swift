//
//  SecondVC.swift
//  Notification Center
//
//  Created by Eken Özlü on 3.10.2023.
//

import UIKit

extension NSNotification.Name {
    static let timerNotification = Notification.Name("TimerNotification")
    static let timerEnd = Notification.Name("TimerEnd")
    static let codeReceived = Notification.Name("CodeReceived")
}

class SecondVC: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    
    var timerValue : Int = 0 {
        didSet {
            timerLabel.text = "\(timerValue)"
            if timerValue == 0 {
                NotificationCenter.default.post(name: .timerEnd, object: nil)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(timerLabelFunc(_:)), name: .timerNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showCode(_:)), name: .codeReceived, object: nil)
    }
    
    @objc func timerLabelFunc(_ notification : Notification){
        if let tV = notification.object as? Int {
            timerValue = tV
        }
        
    }
    
    @objc func showCode(_ notification : Notification){
        if let receivedCode = notification.object as? String {
            codeLabel.text = receivedCode
            Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
                self.codeLabel.text = ""
            }
        }
    }
    
}
