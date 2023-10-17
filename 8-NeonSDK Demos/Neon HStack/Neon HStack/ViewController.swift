//
//  ViewController.swift
//  Neon HStack
//
//  Created by Eken Özlü on 17.10.2023.
//

import UIKit
import NeonSDK
import SnapKit

class ViewController: NeonViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .red
        
        let hstack = NeonHStack(height: 250) { hstack in
            let subView = UIView()
            subView.backgroundColor = .yellow
            hstack.addArrangedSubview(subView)
            subView.snp.makeConstraints { make in
                make.width.equalTo(150)
                make.height.equalTo(100)
            }
            
            let subView2 = UIView()
            subView2.backgroundColor = .green
            hstack.addArrangedSubview(subView2)
            subView.snp.makeConstraints { make in
                make.width.equalTo(150)
                make.height.equalTo(100)
            }
            
            let vstack = NeonVStack(width: 150) { vstack in
                let subView3 = UIView()
                subView3.backgroundColor = .blue
                vstack.addArrangedSubview(subView3)
                subView3.snp.makeConstraints { make in
                    make.width.equalTo(150)
                    make.height.equalTo(100)
                }
            }
            subView2.addSubview(vstack)
            
            
        }
        
        mainStack.addArrangedSubview(hstack)
    }


}

