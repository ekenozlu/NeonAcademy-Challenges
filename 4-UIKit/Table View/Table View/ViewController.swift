//
//  ViewController.swift
//  Table View
//
//  Created by Eken Özlü on 5.10.2023.
//

import UIKit
import SnapKit

class ViewController: UITableViewController {
    
    var memberDict : [Int : [MemberModel]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .white
        title = "Members List"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sort", style: .plain,
                                                                target: self, action: #selector(didTapSort(_:)))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MemberCell.self, forCellReuseIdentifier: "memberCell")
        //MemberArray to MemberDict
        for member in memberArray {
            switch member.team {
            case .ios:
                if memberDict[0] == nil {
                    memberDict[0] = [member]
                } else {
                    memberDict[0]?.append(member)
                }
            case .android:
                if memberDict[1] == nil {
                    memberDict[1] = [member]
                } else {
                    memberDict[1]?.append(member)
                }
            case .ui_ux:
                if memberDict[2] == nil {
                    memberDict[2] = [member]
                } else {
                    memberDict[2]?.append(member)
                }
            default:
                break
            }
        }
        tableView.reloadData()
    }
    
    //MARK: TABLE VIEW CONFIGURATION
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberDict[section]!.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return Team.ios.rawValue
        case 1:
            return Team.android.rawValue
        case 2:
            return Team.ui_ux.rawValue
        default:
            return ""
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memberCell", for: indexPath) as! MemberCell
        let member = memberDict[indexPath.section]![indexPath.row]
        
        cell.nameLabel?.text = "\(member.name!) \(member.surname!)"
        return cell
    }
    
    //MARK: HEIGHT OF THE ROW
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    //MARK: DIDSELECT
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailVC()
        detailVC.selectedMember = memberDict[indexPath.section]?[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    //MARK: MOVE ROW
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        if destinationIndexPath.section == sourceIndexPath.section {
            memberDict[sourceIndexPath.section]?.swapAt(sourceIndexPath.row, destinationIndexPath.row)
            //let tempMember = (memberDict[sourceIndexPath.section]?[sourceIndexPath.row])!
            //memberDict[sourceIndexPath.section]?.remove(at: sourceIndexPath.row)
            //memberDict[sourceIndexPath.section]?.insert(tempMember, at: destinationIndexPath.row)
        }
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    @objc func didTapSort(_ sender : UIBarButtonItem) {
        if tableView.isEditing {
            tableView.isEditing = false
        } else {
            tableView.isEditing = true
        }
        
    }
    
    //MARK: SWIPE ACTIONS
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let leadAct = UIContextualAction(style: .normal, title: "Leading") { _, _, completion in
            let ac = UIAlertController(title: "ALERT", message: "Leading Swipe", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(ac, animated: true)
            completion(true)
        }
        leadAct.backgroundColor = .green
        leadAct.image = UIImage(systemName: "arrowshape.left")
        return UISwipeActionsConfiguration(actions: [leadAct])
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let trailAct = UIContextualAction(style: .normal, title: "Trailing") { _, _, completion in
            let ac = UIAlertController(title: "ALERT", message: "Trailing Swipe", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(ac, animated: true)
            completion(true)
        }
        trailAct.backgroundColor = .red
        trailAct.image = UIImage(systemName: "arrowshape.right")
        return UISwipeActionsConfiguration(actions: [trailAct])
    }
    
}

