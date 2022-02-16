//
//  Product.swift
//  Vmoksha Assignment
//
//  Created by Arun Rathore on 16/02/22.
//

import Foundation

struct Products : Decodable {
    let id : Int
    let shop_id : Int
    let name : String
    let description : String
    let position : Int
    let food_type : String
    let avalability : Int
    let max_quantity : Int
    let featured : Int
    let featured_position : Int
    let addon_status : Int
    let cuisine_id : String?
    let out_of_stock : String
    let status : String
    let foodtype : String
    let get_favour : String?
    let apicart : String?
    let productsingleratings : [ProductSingleRatings]?
    let orderratings: OrderRating?
    let prices : Prices
    let images : [Images]
    let carts: [String]?
    let addons: [String]
    let categorycart: [String]?
    let cart : [Cart]
}
