//
//  ViewController.swift
//  Search Bar
//
//  Created by Eken Özlü on 6.10.2023.
//

import UIKit
import SnapKit

class ViewController: UITableViewController, UISearchBarDelegate {
    
    var searchBar : UISearchBar?
    var segCon : UISegmentedControl?
    var tableViewArray = peopleArray {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .white
        
        let customNavigationView = UIView()
        
        searchBar = UISearchBar()
        searchBar?.placeholder = "Search"
        searchBar?.barTintColor = .black
        searchBar?.tintColor = .black
        searchBar?.showsCancelButton = true
        searchBar?.delegate = self
        customNavigationView.addSubview(searchBar!)
        searchBar?.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.9)
            make.width.equalToSuperview().multipliedBy(0.64)
            make.centerY.equalToSuperview()
        }
        
        let items = ["Name", "Surname"]
        segCon = UISegmentedControl(items: items)
        segCon?.selectedSegmentIndex = 0
        segCon?.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        customNavigationView.addSubview(segCon!)
        segCon?.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.9)
            make.width.equalToSuperview().multipliedBy(0.35)
            make.centerY.equalToSuperview()
        }
        
        navigationItem.titleView = customNavigationView
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PersonCell.self, forCellReuseIdentifier: "personCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath) as! PersonCell
        let person = tableViewArray[indexPath.row]
        cell.nameLabel?.text = "\(person.name ?? "") \(person.surname ?? "")"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        tableViewArray = peopleArray.filter({ person in
            switch segCon?.selectedSegmentIndex {
            case 0:
                person.name.localizedCaseInsensitiveContains(searchBar?.text ?? "")
            case 1:
                person.surname.localizedCaseInsensitiveContains(searchBar?.text ?? "")
            default:
                true
            }
        })
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        tableViewArray = peopleArray.filter({ person in
            switch segCon?.selectedSegmentIndex {
            case 0:
                person.name.localizedCaseInsensitiveContains(searchText)
            case 1:
                person.surname.localizedCaseInsensitiveContains(searchText)
            default:
                true
            }
        })
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        tableViewArray = peopleArray
    }
    
}

