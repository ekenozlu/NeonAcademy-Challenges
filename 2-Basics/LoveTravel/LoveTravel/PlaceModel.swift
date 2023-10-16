//
//  PlaceModel.swift
//  LoveTravel
//
//  Created by Eken Özlü on 2.10.2023.
//

import Foundation

struct Place : Codable {
    var placeName : String
    var isVisited : Bool
    var visitCount : String?
    
    init(placeName: String, isVisited: Bool, visitCount: String? = nil) {
        self.placeName = placeName
        self.isVisited = isVisited
        self.visitCount = visitCount
    }
}

var placesArray : [Place] = []


