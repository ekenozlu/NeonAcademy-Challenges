//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Eken Özlü on 12.10.2023.
//

import UIKit
import SnapKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var namesArray : [String]? = []
    var namesTV : UITableView?
    var nameTF :UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .white
        
        namesTV = UITableView()
        namesTV?.delegate = self
        namesTV?.dataSource = self
        namesTV?.rowHeight = 45
        namesTV?.register(NameCell.self, forCellReuseIdentifier: "nameCell")
        view.addSubview(namesTV!)
        namesTV?.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.7)
        }
        
        nameTF = UITextField()
        nameTF?.placeholder = "Enter Name and Surname"
        nameTF?.borderStyle = .roundedRect
        nameTF?.backgroundColor = .lightGray
        view.addSubview(nameTF!)
        nameTF?.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(8)
            make.top.equalTo(namesTV!.snp.bottom).offset(8)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(45)
        }
        
        let addButton = UIButton(type: .system)
        addButton.setTitle("ADD", for: .normal)
        addButton.addTarget(self, action: #selector(addTapped(_:)), for: .touchUpInside)
        view.addSubview(addButton)
        addButton.snp.makeConstraints { make in
            make.leading.equalTo(nameTF!.snp.trailing).offset(4)
            make.top.equalTo(nameTF!.snp.top)
            make.trailing.equalToSuperview().inset(4)
            make.bottom.equalTo(nameTF!.snp.bottom)
        }
        
        fetchListFromCoreData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath) as! NameCell
        cell.nameLabel?.text = namesArray?[indexPath.row]
        return cell
    }
    
    func fetchListFromCoreData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "People")
        
        do {
            let result = try context.fetch(fetchRequest)
            namesArray?.removeAll()
            for data in result as! [NSManagedObject] {
                namesArray?.append(data.value(forKey: "name") as! String)
            }
            //REFRESH TABLEVIEW
            namesTV?.reloadData()
        } catch {
            print("Error on fetch")
        }
    }

    @objc func addTapped(_ sender : UIButton) {
        //HANDLE CORE DATA
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let peopleEntity = NSEntityDescription.entity(forEntityName: "People", in: context)!
        let person = NSManagedObject(entity: peopleEntity, insertInto: context)
        person.setValue(nameTF?.text, forKey: "name")
        
        do {
            try context.save()
            fetchListFromCoreData()
        } catch {
            print("Error on save")
        }
    }

}

