//
//  ViewController.swift
//  API Demo
//
//  Created by Eken Özlü on 12.10.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let apiURL = "https://pokeapi.co/api/v2/pokemon"
    
    var pokeArray : [[String : Any]]?
    
    var pokeTV : UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI(){
        view.backgroundColor = .red
        
        pokeTV = UITableView()
        pokeTV?.delegate = self
        pokeTV?.dataSource = self
        pokeTV?.rowHeight = 50
        pokeTV?.register(PokeCell.self, forCellReuseIdentifier: "pokeCell")
        view.addSubview(pokeTV!)
        pokeTV?.snp.makeConstraints({ make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.8)
        })
        fetchDataFromAPI()
    }
    
    func fetchDataFromAPI() {
        let apiURL = URL(string: apiURL)
        let dataTask = URLSession.shared.dataTask(with: apiURL!) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else {
                print("No Data")
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any]
                self.pokeArray = json!["results"] as? [[String : Any]]
                self.pokeTV?.reloadData()
            } catch {
                print("Error on parsing")
            }
        }
        dataTask.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokeArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokeCell", for: indexPath) as! PokeCell
        let poke = pokeArray?[indexPath.row]
        cell.nameLabel?.text = poke?["name"] as? String
        return cell
    }
    
}

