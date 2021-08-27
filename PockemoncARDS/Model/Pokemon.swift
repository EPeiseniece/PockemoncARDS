//
//  Pokemon.swift
//  PockemoncARDS
//
//  Created by elina.peiseniece on 27/08/2021.
//

import Foundation

struct Pokemon: Decodable {
    let id: String
    let name: String
    let image: String
    let number: String
    let supertype: String?
    let subtype: String?
    
    
    enum CodingKeys: String, CodingKey{
        case name, id, number, supertype, subtype
        case image = "imageUrl"
    }
}

struct Cards: Decodable {
    let cards: [Pokemon]
}
