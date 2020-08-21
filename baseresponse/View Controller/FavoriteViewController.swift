////
////  FavoriteViewController.swift
////  baseresponse
////
////  Created by Le Dat on 8/14/20.
////  Copyright © 2020 Le Dat. All rights reserved.
////
//
//import UIKit
//import RealmSwift
//import SDWebImage
//
//class FavoriteViewController: UIViewController {
//
//    //MARK : -ite- Variables
////    var items: [Detail] = []
//    let realm = try! Realm() // [1]
//    var detailItem: Results<Item> { // [2]
//        get {
//            return realm.objects(Item.self) 
//        }
//    }
//    private let sectionInsets = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
//    private let itemsPerRow: CGFloat = 3
//    
//    //MARK : -- IBOutlet
//    @IBOutlet var favoriteCollectionView: UICollectionView!
//    
//    //MARK : --View Lifecycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        favoriteCollectionView.delegate = self
//        favoriteCollectionView.dataSource = self
//        favoriteCollectionView.reloadData()
//       
//    }
//    
//    private func showItemView(withItem item: Item){
//        let itemVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "DetailView") as! DetailItemViewController
//        itemVC.dataSource = Items(id: item.id, title: item.title, price: item.price, url: item.url, isFavorite: item.isFavorite)
//        self.navigationController?.pushViewController(itemVC, animated: true)
//    }
//
//}
//
//extension FavoriteViewController: UICollectionViewDelegate, UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let item = detailItem[indexPath.row]
//              try! self.realm.write({
//                  if (item.isFavorite == false){
//                      item.isFavorite = true
//                  }else{
//                      item.isFavorite = false
//                  }
//              })
//        collectionView.reloadItems(at: [indexPath])
//        showItemView(withItem: item)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return detailItem.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! FavoriteCollectionViewCell
//        
//        let item = detailItem[indexPath.row]
//        cell.labelTitleFavorite.text = item.title
//        cell.labelPriceFavorite.text = item.price
//        cell.imgViewFavorite.sd_setImage(with: URL(string: item.url), placeholderImage: UIImage(named: "heart"))
//        return cell
//        }
////
////        let item = Settings.wishList
////        cell.labelTitleFavorite.text = item[indexPath.row].title
////        cell.labelPriceFavorite.text = item[indexPath.row].price
////               let queue = DispatchQueue(label: "loadImg2")
////               queue.async {
////                let image = item[indexPath.row].url
////                   do{
////                    if let url = URL(string: image) {
////                            let data = try Data(contentsOf: url)
////                               DispatchQueue.main.async {
////                                   cell.imgViewFavorite.image = UIImage(data: data)
////                               }
////                       }
////                   }catch{
////
////                   }
////               }
//
//}
//
//extension FavoriteViewController: UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
//        let availableWidth = view.frame.width - paddingSpace
//        let withPerItem = availableWidth / itemsPerRow
//        
//        return CGSize(width: withPerItem, height: withPerItem)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return sectionInsets
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return sectionInsets.left
//        
//    }
//
//}
//
//
