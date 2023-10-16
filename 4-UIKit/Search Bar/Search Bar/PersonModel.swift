//
//  PersonModel.swift
//  Search Bar
//
//  Created by Eken Özlü on 6.10.2023.
//

import Foundation

struct Person {
    var name : String!
    var surname : String!
    
    init(name: String!, surname: String!) {
        self.name = name
        self.surname = surname
    }
    
}

let person1 = Person(name: "Eken", surname: "Özlü")
let person2 = Person(name: "Ayşe", surname: "Koç")
let person3 = Person(name: "Mehmet", surname: "Demir")
let person4 = Person(name: "Fatma", surname: "Çelik")
let person5 = Person(name: "Mustafa", surname: "Öztürk")
let person6 = Person(name: "Emine", surname: "Kara")
let person7 = Person(name: "İbrahim", surname: "Turan")
let person8 = Person(name: "Zeynep", surname: "Altın")
let person9 = Person(name: "Cemal", surname: "Güneş")
let person10 = Person(name: "Sibel", surname: "Arslan")
let person11 = Person(name: "Murat", surname: "Kaya")
let person12 = Person(name: "Nur", surname: "Aktaş")
let person13 = Person(name: "Hüseyin", surname: "Erdem")
let person14 = Person(name: "Sevgi", surname: "Aydın")
let person15 = Person(name: "Cengiz", surname: "Sarı")

var peopleArray = [person1, person2, person3, person4, person5,
                   person6, person7, person8, person9, person10,
                   person11, person12, person13, person14, person15]

