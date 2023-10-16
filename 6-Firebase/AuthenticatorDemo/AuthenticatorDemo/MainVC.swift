//
//  MainVC.swift
//  AuthenticatorDemo
//
//  Created by Eken Özlü on 10.10.2023.
//

import UIKit
import FirebaseAuth

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .white
        
        let signOutButton = UIButton(type: .system)
        signOutButton.setTitle("SIGN OUT", for: .normal)
        view.addSubview(signOutButton)
        signOutButton.addTarget(self, action: #selector(signOutTapped(_:)), for: .touchUpInside)
        signOutButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview().offset(8)
            make.width.equalTo(80)
            make.height.equalTo(30)
        }
        
        let label = UILabel()
        label.text = "YOU HAVE LOGGED IN"
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = .black
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.3)
        }
    }
    
    @objc func signOutTapped(_ sender : UIButton) {
        do {
            try Auth.auth().signOut()
            let registerVC = ViewController()
            registerVC.modalPresentationStyle = .fullScreen
            self.present(registerVC, animated: true)
        }
        catch {}
    }
}
