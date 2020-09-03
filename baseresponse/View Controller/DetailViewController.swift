//
//  DetailViewController.swift
//  baseresponse
//
//  Created by Le Dat on 8/24/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import UIKit
import JGProgressHUD
import RealmSwift

class DetailViewController: UIViewController {
    
    //MARK: --Vars
    var dataForYou: ForYou?
    var hud = JGProgressHUD()
    let cellIdentifier = "DetailItemTableViewCell"
    
    
    //MARK: --IBOutlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var buyNowButton: UIButton!
    
    //MARK: --View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupUI()       
    }
    
    //MARK: --IBAction
    @IBAction func addToCart(_ sender: Any) {
        if let dataCart = Cart.getCartById(id: dataForYou?.id ?? "") {
            hud.indicatorView = JGProgressHUDSuccessIndicatorView()
            hud.show(in: self.view)
            hud.dismiss(afterDelay: 2.0)
            hud.textLabel.text = "Update Quanlity Item"
            dataCart.updateQuanlity(quanlity: dataCart.quanlity + 1)
        }
        else {
            hud.indicatorView = JGProgressHUDSuccessIndicatorView()
            hud.show(in: self.view)
            hud.dismiss(afterDelay: 2.0)
            hud.textLabel.text = "Add Cart list"
            let dataCart = Cart()
            dataCart.id = dataForYou?.id ?? ""
            dataCart.itemTitle = dataForYou?.itemTitle ?? ""
            dataCart.itemImg = dataForYou?.itemImg ?? ""
            dataCart.itemPrice = dataForYou?.itemPrice ?? ""
            dataCart.itemDiscountPrice = dataForYou?.itemDiscountPrice ?? ""
            dataCart.currency = dataForYou?.currency ?? ""
            dataCart.itemRatingScore = dataForYou?.itemRatingScore ?? 0
            dataCart.quanlity = 1
            dataCart.save()
        }
    }
    
    //MARK: --Func
    
    @objc func addToFavorite(){
        if let dataFavorite = ForYou.getFavoriteById(id: dataForYou?.id ?? ""){
            hud.indicatorView = JGProgressHUDSuccessIndicatorView()
            hud.show(in: self.view)
            hud.dismiss(afterDelay: 4.0)
            hud.textLabel.text = "Remove favorite list"
            dataFavorite.remove()
            self.navigationController?.popViewController(animated: true)
        }
        else {
            hud.indicatorView = JGProgressHUDSuccessIndicatorView()
            hud.show(in: self.view)
            hud.dismiss(afterDelay: 2.0)
            hud.textLabel.text = "Add favorite list"
            let forYou = ForYou()
            forYou.id = dataForYou?.id ?? ""
            forYou.itemTitle = dataForYou?.itemTitle ?? ""
            forYou.itemImg = dataForYou?.itemImg ?? ""
            forYou.itemPrice = dataForYou?.itemPrice ?? ""
            forYou.itemDiscountPrice = dataForYou?.itemDiscountPrice ?? ""
            forYou.currency = dataForYou?.currency ?? ""
            forYou.itemRatingScore = dataForYou!.itemRatingScore
            forYou.isFavorite = true
            forYou.save()
        }
    }
    
    private func setupUI() {
        self.title = "Detail Item"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        addToCartButton.layer.cornerRadius = 10
        buyNowButton.layer.cornerRadius = 10
        let add = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(self.addToFavorite))
        self.navigationItem.rightBarButtonItems = [add]
    }
}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? DetailItemTableViewCell else {
            fatalError()
        }
        cell.setUpCell(model: dataForYou!)
        return cell
    }
}
