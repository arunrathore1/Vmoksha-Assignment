//
//  ProductSingleRating.swift
//  Vmoksha Assignment
//
//  Created by Arun Rathore on 16/02/22.
//

import Foundation

struct ProductSingleRatings : Decodable {
    let id : Int
    let order_id : Int
    let shop_id : Int
    let user_id : Int
    let product_id : Int
    let product_comment : String?
    let product_rating : Int
    let status : String
}
