//
//  Price.swift
//  Vmoksha Assignment
//
//  Created by Arun Rathore on 16/02/22.
//

import Foundation

struct Prices : Decodable {
    let id : Int
    let price : Int
    let orignal_price : Int
    let currency : String
    let discount : Int
    let discount_type : String
}
