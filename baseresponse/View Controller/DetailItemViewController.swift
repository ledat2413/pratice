////
////  DetailItemViewController.swift
////  baseresponse
////
////  Created by Le Dat on 8/14/20.
////  Copyright © 2020 Le Dat. All rights reserved.
////
//
//import UIKit
//import JGProgressHUD
//import RealmSwift
//
//class DetailItemViewController: UIViewController {
//    
//    //MARK: -- IBOutlet
//    @IBOutlet weak var imgViewUrl: UIImageView!
//    @IBOutlet weak var labelDetailTitle: UILabel!
//    @IBOutlet weak var labelDetailPrice: UILabel!
//    @IBOutlet weak var labelTitle: UILabel!
//    @IBOutlet weak var btnFavorite: UIButton!
//    
//    //MARK: --IBAction
//    @IBAction func bntAddFavorite(_ sender: Any) {
//        btnPress()
//    }
//    
//    @IBAction func bntBack(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil)
//    }
//    
//    //MARK: -- Variables
//    let realm = try! Realm()
//    var dataSource: Items?
//    var detailItem: Results<Item> {
//        get {
//            return realm.objects(Item.self).filter("isFavorite = true")
//        }
//
//    }
////    var detail: Detail?
//    var hud = JGProgressHUD()
////    var DetailList: [Detail] = []
//
//    //MARK: -- View Lifecycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        setupUI()
//
//    }
//    
//    //MARK: --Function
//
//    @objc func btnPress(){
//        
//        hud.textLabel.text = "Add favorite list"
//        btnFavorite.setImage(UIImage(systemName: "suit.heart.fill"), for: .normal)
//        hud.indicatorView = JGProgressHUDSuccessIndicatorView()
//        hud.show(in: self.view)
//        hud.dismiss(afterDelay: 2.0)
//        let detailItem = Item()
//        if detailItem.isFavorite == false {
//            detailItem.id = dataSource?.id ?? 0// [1]
//                   detailItem.title = dataSource?.title ?? ""
//                   detailItem.price = dataSource?.price ?? ""
//                   detailItem.url = dataSource?.url ?? ""
//                   detailItem.isFavorite = true
//                   detailItem.save()
//        }
//        else{
//            detailItem.isFavorite = false
//                   detailItem.save()
//        }
//  
//    }
//    
//    private func setupUI(){
//        if dataSource != nil {
//                    labelTitle.text = dataSource!.title
//                    labelDetailTitle.text = dataSource!.title
//                    labelDetailPrice.text = dataSource!.price
//            let queue = DispatchQueue(label: "loadImgDetail")
//            queue.async {
//                if let url = NSURL(string: self.dataSource!.url) {
//                    if let data = NSData(contentsOf: url as URL) {
//                        DispatchQueue.main.async {
//                                self.imgViewUrl.image = UIImage(data: data as Data)
//                        }
//                    }
//                }
//            }
//        }
//        if dataSource?.isFavorite == true {
//            self.btnFavorite.setImage(UIImage(systemName: "suit.heart.fill"), for: .normal)
//        }else{
//            self.btnFavorite.setImage(UIImage(systemName: "suit.heart"), for: .normal)
//        }
//    }
//}
//
//
//
//
//
