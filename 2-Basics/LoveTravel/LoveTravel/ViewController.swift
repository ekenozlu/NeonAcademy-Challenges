//
//  ViewController.swift
//  LoveTravel
//
//  Created by Eken Özlü on 2.10.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var placesTableView: UITableView!
    
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataFromDefaults()
        
        placesTableView.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(refreshTable(_:)), for: .valueChanged)
    }
    
    func fetchDataFromDefaults() {
        if let encodedData = UserDefaults.standard.object(forKey: "placesArray") as? Data {
            if let decodedData = try? JSONDecoder().decode([Place].self, from: encodedData) {
                placesArray = decodedData
                placesTableView.reloadData()
            } else {
                print("hata")
            }
        }
    }
    
    @objc private func refreshTable(_ sender: Any) {

        fetchDataFromDefaults()
        refreshControl.endRefreshing()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell", for: indexPath) as? PlaceCell else {
            return UITableViewCell()
        }
        let place = placesArray[indexPath.row]
        cell.placeNameLabel.text = place.placeName
        if place.isVisited == true {
            cell.visitStatusLabel.text = "Visited \(place.visitCount ?? "0") times"
        } else {
            cell.visitStatusLabel.text = "Not Visited Yet"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 14
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "editPlace", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addPlace", let destination = segue.destination as? PlaceDetailVC {
            destination.isEditVC = false
        }
        else if segue.identifier == "editPlace",
                let destination = segue.destination as? PlaceDetailVC,
                let rowIndex = placesTableView.indexPathForSelectedRow?.row {
            destination.isEditVC = true
            destination.placeIndex = rowIndex
        }
    }
    
    
}

