//
//  Cart.swift
//  Vmoksha Assignment
//
//  Created by Arun Rathore on 16/02/22.
//

import Foundation

struct Cart : Decodable {
    let id : Int
    let user_id : Int
    let shop_id : Int?
    let product_id : Int
    let promocode_id : String?
    let order_id : String?
    let quantity : Int
    let note : String?
    let savedforlater : Int
    let cart_addons : [String]
}
