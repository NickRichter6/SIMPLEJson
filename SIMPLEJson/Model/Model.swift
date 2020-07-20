//
//  Models.swift
//  SIMPLEJson
//
//  Created by Nick Ivanov on 19.07.2020.
//  Copyright © 2020 Nick Ivanov. All rights reserved.
//

import Foundation

struct Models: Decodable {
    var data : [Model]
    let view: [String]
}

struct Model: Decodable {
    let name: String?
    let data: Data?
}

struct Data: Decodable {
    let text: String?
    let url: String?
    let variants: [Variants]?
    let selectedId: Int?
}

struct Variants: Decodable {
    let id : Int
    var text : String
}
