//
//  CartCell.swift
//  Vmoksha Assignment
//
//  Created by Arun Rathore on 16/02/22.
//

import UIKit

class ProductCell: UITableViewCell {
    
    @IBOutlet weak var foodLbl: UILabel!
    @IBOutlet weak var orderBtn: UIButton!
    @IBOutlet weak var categoryImage: CustomImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        orderBtnCornerRadius()
        imageCornerRadius()
    }
    
    private func orderBtnCornerRadius() {
        self.orderBtn.layer.cornerRadius = 8
        self.orderBtn.layer.masksToBounds = true
    }
    
    private func imageCornerRadius() {
        self.categoryImage.layer.cornerRadius = 20
        self.categoryImage.clipsToBounds = true
    }
    
    func configureCellData(product: Products) {
        if let imageUrl = product.images.first {
            self.categoryImage.loadImageUsingUrlString(urlString: imageUrl.url)
        }
        self.priceLbl.text = "\(product.prices.currency) \(product.prices.price)"
        if let rating = product.orderratings?.rating {
            self.ratingLbl.text = "\(rating) Rating"
        } else {
            self.ratingLbl.text = "No Rating!!"
        }
        self.nameLbl.text = product.name
        self.foodLbl.text = product.food_type
    }
    
}

