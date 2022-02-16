//
//  ViewControllerVM.swift
//  Vmoksha Assignment
//
//  Created by Arun Rathore on 16/02/22.
//

import Foundation

protocol ViewControllerVMDelegate {
    func didLoadProduct()
    func onError(error: Error)
}

class ViewControllerVM {
    private var products: [Products] = []
    private var originalProducts: [Products] = []
    
    var delegate: ViewControllerVMDelegate? = nil
    func filterdProducts(veg: Bool, nonVeg: Bool) {
        self.products = self.originalProducts.filter {
            (nonVeg && $0.food_type == "non-veg") || (veg && $0.food_type == "veg")
        }
    }
    
    func getProductsCount() -> Int { self.products.count }
    func getProduct(at index: Int) -> Products { self.products[index] }
    
    func loadProducts() {
        NetworkManager.getDataFromApi(completion: { [weak self] result in
            switch result {
                case .success(let data):
                    let products = data.categories.flatMap { $0.products }
                    self?.products = products
                    self?.originalProducts = products
                    self?.delegate?.didLoadProduct()
                    break
                case .failure(let error):
                    self?.delegate?.onError(error: error)
                    break
            }
        })
    }
    
    
}
