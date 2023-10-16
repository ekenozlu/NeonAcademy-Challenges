//
//  ViewController.swift
//  Notification Center
//
//  Created by Eken Özlü on 3.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var codeTF: UITextField!
    @IBOutlet weak var decryptButton: UIButton!
    
    var firstClick : Bool = false
    var seconds : Int = 15
    var timer : Timer?
    var decryptedCode : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(timerEnd), name: .timerEnd, object: nil)
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        if codeTF.text != nil {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
            performSegue(withIdentifier: "toSecondVC", sender: self)
        }
    }
    
    @objc func timerFunc(){
        seconds -= 1
        NotificationCenter.default.post(name: .timerNotification, object: seconds)
    }
    
    @objc func timerEnd(){
        timer?.invalidate()
        seconds = 15
        decryptedCode = String(format: "%04d", arc4random_uniform(10000))
        NotificationCenter.default.post(name: .codeReceived, object: decryptedCode)
    }
}

