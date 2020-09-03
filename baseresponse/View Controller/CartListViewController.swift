//
//  CartListViewController.swift
//  baseresponse
//
//  Created by Le Dat on 8/26/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import UIKit
import RealmSwift
import SDWebImage

class CartListViewController: UIViewController {
    
    //MARK: --Vars
    private let cellIdentifier = "TableViewCell"
    let dataCart = Cart.getListCart()
    
    //MARK: --IBOutlet
    
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalItemLabel: UILabel!
    @IBOutlet weak var checkOutButton: UIButton!
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    @IBAction func checkOutButtonAction(_ sender: Any) {
    }
    @IBAction func backViewButton(_ sender: Any) {
        
    }
    
    //MARK: --View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setUpUI()
        
    }
    
    //MARK: --Func
    private func setUpUI(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.addSubview(footerView)
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        checkOutButton.layer.cornerRadius = 10
        self.updateTotalLabel(false)
        self.tableView.reloadData()
    }
    
    private func showTotalPrice() -> String{
        var total: Double = 0.0
        
        for i in dataCart{
            total += (Double(i.itemDiscountPrice)! * Double(i.quanlity))
        }
        return "\(total) VNĐ"
    }
    
    private func updateTotalLabel(_ isEmpty: Bool){
        if isEmpty == true {
            totalItemLabel.text = "0"
            totalLabel.text = showTotalPrice()
        } else {
            totalItemLabel.text = "\(Cart.getListCart().count)"
            totalLabel.text = showTotalPrice()
        }
    }
    
    private func deleteAction(at indexPath: IndexPath) -> UIContextualAction {
        
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
            self.deleteItem(at: indexPath)
            completion(true)
        }
        action.image = .remove
        action.backgroundColor = .red
        return action
    }
    
    private func deleteItem(at indexPath: IndexPath) {
        self.dataCart[indexPath.row].remove()
        self.updateTotalLabel(false)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}

extension CartListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = deleteAction(at: indexPath)
        
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataCart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TableViewCell else {fatalError()}
        let dataCell = dataCart[indexPath.row]
        if dataCell.quanlity >= 1 {
            cell.loadData(data: dataCell)
            cell.callbackValue = { (value) in
                dataCell.updateQuanlity(quanlity: value)
                self.updateTotalLabel(false)
            }
            
        }else{
            deleteItem(at: indexPath)
            self.tableView.reloadData()
        }
        
        return cell
    }
    
}
