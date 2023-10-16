//
//  ViewController.swift
//  Table View
//
//  Created by Eken Özlü on 5.10.2023.
//

import UIKit
import SnapKit
import NeonSDK

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .white
        
        let tableView = NeonTableView<MemberModel,MemberCell>(objects: memberArray, heightForRows: 60)
        tableView.isEditing = true
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }

        tableView.didSelect = { object, indexPath in
            let detailVC = DetailVC()
            detailVC.modalPresentationStyle = .fullScreen
            detailVC.selectedMember = object
            self.present(detailVC, animated: true)
        }
        
        tableView.trailingSwipeActions = [SwipeAction(title: "Trailing Action", color: .red, action: { object, indexPath in
            let ac = UIAlertController(title: "ALERT", message: "Trailing Swipe", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(ac, animated: true)
        })]
        
        tableView.leadingSwipeActions = [SwipeAction(title: "Leading Action", color: .green, action: { object, indexPath in
            let ac = UIAlertController(title: "ALERT", message: "Leading Swipe", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(ac, animated: true)
        })]
        
    }
    
}

