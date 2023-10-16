//
//  AppModel.swift
//  CollectionView
//
//  Created by Eken Özlü on 6.10.2023.
//

import UIKit

enum AppCategory : String {
    case design = "Graphics & Design"
    case photo = "Photo & Video"
}


struct AppModel {
    var appIcon : UIImage!
    var appName : String!
    var releaseDate : String!
    var appCategory : AppCategory!
    var appStoreURL : String!
    
    init(appIcon: UIImage!, appName: String!, releaseDate: String!, appCategory: AppCategory!, appStoreURL: String!) {
        self.appIcon = appIcon
        self.appName = appName
        self.releaseDate = releaseDate
        self.appCategory = appCategory
        self.appStoreURL = appStoreURL
    }
}

let app1 = AppModel(appIcon: UIImage(named: "interior"), appName: "Interior Magic AI", releaseDate: "9 Jun 2023",
                    appCategory: .design, appStoreURL: "https://apps.apple.com/tr/app/interior-magic-ai/id6449483097")
let app2 = AppModel(appIcon: UIImage(named: "sakura"), appName: "Sakura - Anime AI Filter", releaseDate: "27 Apr 2023",
                    appCategory: .photo, appStoreURL: "https://apps.apple.com/tr/app/sakura-anime-ai-filter/id6447250609")
let app3 = AppModel(appIcon: UIImage(named: "teleprompter"), appName: "Teleprompter Application", releaseDate: "5 Apr 2023",
                    appCategory: .photo, appStoreURL: "https://apps.apple.com/tr/app/teleprompter-application/id1669501300")

var appArray : [AppModel] = [app1,app2,app3]
