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
    
    let realm = try! Realm()
    var detailForYou: Results<Cart> {
        get {
            return realm.objects(Cart.self)
        }
    }
    
    //MARK: --IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalItemLabel: UILabel!
    @IBOutlet weak var checkOutButton: UIButton!
    
    @IBAction func checkOutButtonAction(_ sender: Any) {
    }
    
    //MARK: --View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = footerView
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        self.updateTotalLabel(false)
        self.tableView.reloadData()
        
    }
    
    //MARK: --Func
    private func showTotalPrice() -> String{
        var total: Double = 0.0
        
        for i in detailForYou{
            total += (Double(i.itemDiscountPrice)! * Double(i.quanlity))
        }
        return "\(total) VNĐ"
    }
    
    private func updateTotalLabel(_ isEmpty: Bool){
            if isEmpty == true {
                      totalItemLabel.text = "0"
                      totalLabel.text = showTotalPrice()
                  } else {
                      totalItemLabel.text = "\(detailForYou.count)"
                      totalLabel.text = showTotalPrice()
                  }
    }
    
   private func deleteAction(at indexPath: IndexPath) -> UIContextualAction {
         
         let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
             self.detailForYou[indexPath.row].remove()
             self.tableView.deleteRows(at: [indexPath], with: .automatic)
             completion(true)
         }
         action.image = .remove
         action.backgroundColor = .red
         return action
     } 
}

extension CartListViewController: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = deleteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailForYou.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TableViewCell else {fatalError()}
        
        let data = detailForYou[indexPath.row]
       
        cell.loadData(data: data)
        
        cell.callbackValue = { (value) in
            data.updateQuanlity(quanlity: value)
            self.updateTotalLabel(false)    
        }
        return cell
    }

}
