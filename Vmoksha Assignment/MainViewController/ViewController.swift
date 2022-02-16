//
//  ViewController.swift
//  Vmoksha Assignment
//
//  Created by Arun Rathore on 15/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nonVegSwitch: UISwitch!
    @IBOutlet weak var vegSwitch: UISwitch!
    @IBOutlet weak var productTableView: UITableView!
    
    private var viewModel = ViewControllerVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.delegate = self
        
        self.configureViews()
        self.viewModel.loadProducts()
    }
    
    private func configureViews() {
        self.nonVegSwitch.addTarget(self, action: #selector(self.onSwitchChange(_:)), for: .valueChanged)
        self.vegSwitch.addTarget(self, action: #selector(self.onSwitchChange(_:)), for: .valueChanged)
        self.configureTableView()
    }
    
    @objc func onSwitchChange(_ uIswitch: UISwitch) {
        self.viewModel.filterdProducts(veg: self.vegSwitch.isOn, nonVeg: self.nonVegSwitch.isOn)
        self.productTableView.reloadData()
    }
    
    private func configureTableView() {
        self.productTableView.dataSource = self
        self.productTableView.allowsSelection = false
        self.productTableView.separatorStyle = .none
        
        let nib = UINib(nibName: String(describing: ProductCell.self), bundle: nil)
        self.productTableView.register(nib, forCellReuseIdentifier: String(describing: ProductCell.self))
    }
}

extension ViewController: ViewControllerVMDelegate {
    func didLoadProduct() {
        self.productTableView.reloadData()
    }
    
    func onError(error: Error) {
        print(error.localizedDescription)
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.getProductsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductCell.self), for: indexPath) as! ProductCell
        cell.configureCellData(product: self.viewModel.getProduct(at: indexPath.row))
        return cell
    }
}

