//
//  Category.swift
//  Vmoksha Assignment
//
//  Created by Arun Rathore on 16/02/22.
//

import Foundation

struct Categories : Decodable {
    let id : Int
    let parent_id : Int
    let shop_id : Int
    let name : String
    let description : String
    let position : Int
    let status : String
    let products : [Products]
    let images : [Images]
}

