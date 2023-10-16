//
//  MemberMolde.swift
//  Table View
//
//  Created by Eken Özlü on 5.10.2023.
//

import Foundation

enum Team : String {
    case ios = "iOS Developer"
    case android = "Android Developer"
    case ui_ux = "UI/UX Developer"
}

struct MemberModel {
    var name : String!
    var surname : String!
    var team : Team!
    var hometown : String!
    var email : String!
    
    init(name: String!, surname: String!, team: Team!, hometown: String!, email: String!) {
        self.name = name
        self.surname = surname
        self.team = team
        self.hometown = hometown
        self.email = email
    }
}

let member1 = MemberModel(name: "Eken", surname: "Özlü", team: .ios,
                          hometown: "Adana", email: "eken@gamil.com")
let member2 = MemberModel(name: "Ayşe", surname: "Koç", team: .android,
                          hometown: "Ankara", email: "ayse@gmail.com")
let member3 = MemberModel(name: "Mehmet", surname: "Şahin", team: .ui_ux,
                          hometown: "Istanbul", email: "mehmet@gmail.com")
let member4 = MemberModel(name: "Fatma", surname: "Yılmaz", team: .ios,
                          hometown: "Izmir", email: "fatma@gmail.com")
let member5 = MemberModel(name: "Emre", surname: "Turan", team: .android,
                          hometown: "Bursa", email: "emre@gmail.com")
let member6 = MemberModel(name: "Berkay", surname: "Güneş", team: .ui_ux,
                          hometown: "Antalya", email: "berkay@gmail.com")
let member7 = MemberModel(name: "Elif", surname: "Kara", team: .ios,
                          hometown: "Konya", email: "elif@gmail.com")
let member8 = MemberModel(name: "Cem", surname: "Kurt", team: .android,
                          hometown: "Trabzon", email: "cem@gmail.com")
let member9 = MemberModel(name: "Sevgi", surname: "Doğan", team: .ui_ux,
                          hometown: "Eskişehir", email: "sevgi@gmail.com")
let member10 = MemberModel(name: "Barış", surname: "Erdem", team: .ios,
                           hometown: "Diyarbakır", email: "baris@gmail.com")
let member11 = MemberModel(name: "Zeynep", surname: "Karadağ", team: .android,
                           hometown: "Samsun", email: "zeynep@gmail.com")
let member12 = MemberModel(name: "Ahmet", surname: "Çelik", team: .ui_ux,
                           hometown: "Gaziantep", email: "ahmet@gmail.com")
let member13 = MemberModel(name: "Merve", surname: "Arslan", team: .ios,
                           hometown: "Isparta", email: "merve@gmail.com")
let member14 = MemberModel(name: "Tolga", surname: "Yıldırım", team: .android,
                           hometown: "Kahramanmaraş", email: "tolga@gmail.com")
let member15 = MemberModel(name: "Yasemin", surname: "Demir", team: .ui_ux,
                           hometown: "Adıyaman", email: "yasemin@gmail.com")

var memberArray : [MemberModel] = [member1,member2,member3,member4,member5,
                                   member6,member7,member8,member9,member10,
                                   member11,member12,member13,member14,member15]
