//
//  PostModel.swift
//  Neon Firestore
//
//  Created by Eken Özlü on 17.10.2023.
//

import Foundation

class PostModel : Codable {
    internal init(field1: String, field2: Int, bool: Bool) {
        self.field1 = field1
        self.field2 = field2
        self.bool = bool
    }
    
    let field1 : String
    let field2 : Int
    let bool : Bool
    
}

let PostToUpload = PostModel(field1: "string", field2: 15, bool: true)
