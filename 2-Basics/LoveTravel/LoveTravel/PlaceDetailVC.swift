//
//  PlaceDetailVC.swift
//  LoveTravel
//
//  Created by Eken Özlü on 2.10.2023.
//

import UIKit

class PlaceDetailVC: UIViewController {

    @IBOutlet weak var placeNameTF: UITextField!
    @IBOutlet weak var isVisitedSwitch: UISwitch!
    @IBOutlet weak var visitCountTF: UITextField!
    @IBOutlet weak var deleteButton: UIButton!
    
    var isEditVC : Bool?
    var placeIndex : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if isEditVC! {
            placeNameTF.text = placesArray[placeIndex!].placeName
            isVisitedSwitch.isOn = placesArray[placeIndex!].isVisited
            visitCountTF.text = placesArray[placeIndex!].visitCount ?? ""
            deleteButton.isEnabled = true
        } else {
            placeNameTF.text = ""
            isVisitedSwitch.isOn = false
            visitCountTF.isEnabled = false
            deleteButton.isEnabled = false
        }
    }
    
    @IBAction func switchChanged(_ sender: Any) {
        if isVisitedSwitch.isOn {
            visitCountTF.isEnabled = true
        } else {
            visitCountTF.isEnabled = false
        }
    }
    
    @IBAction func actionButtonTapped(_ sender: Any) {
        if isEditVC! {
            //UPDATE THE USERDEFAULTS
            if let name = placeNameTF.text {
                if isVisitedSwitch.isOn {
                    if let count = visitCountTF.text {
                        placesArray[placeIndex!] = Place(placeName: name, isVisited: true, visitCount: count)
                    }
                } else {
                    placesArray[placeIndex!] = Place(placeName: name, isVisited: false)
                }
            }
        } else {
            //ADD ELEMENT TO USER DEFAULTS
            if let name = placeNameTF.text {
                if isVisitedSwitch.isOn {
                    if let count = visitCountTF.text {
                        placesArray.append(Place(placeName: name, isVisited: true, visitCount: count))
                    }
                } else {
                    placesArray.append(Place(placeName: name, isVisited: false))
                }
            }
        }
        if let encodedData = try? JSONEncoder().encode(placesArray) {
            UserDefaults.standard.set(encodedData, forKey: "placesArray")
            self.dismiss(animated: true)
        } else {
            print("error on saving data")
        }
    }

    @IBAction func deleteTapped(_ sender: Any) {
        placesArray.remove(at: placeIndex!)
        if let encodedData = try? JSONEncoder().encode(placesArray) {
            UserDefaults.standard.set(encodedData, forKey: "placesArray")
            self.dismiss(animated: true)
        } else {
            print("error on saving data")
        }
    }
    
    
}
