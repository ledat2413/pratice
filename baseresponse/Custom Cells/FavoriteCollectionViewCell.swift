//
//  FavoriteCollectionViewCell.swift
//  baseresponse
//
//  Created by Le Dat on 8/14/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import UIKit

class FavoriteCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgViewFavorite: UIImageView!
    @IBOutlet weak var labelTitleFavorite: UILabel!
    @IBOutlet weak var labelPriceFavorite: UILabel!
    
//    private var onToggleCompleted: ((DetailItem) -> Void)?
//    private var item: DetailItem?
//
//    func configureWith(_ item: DetailItem, onToggleCompleted: ((DetailItem) -> Void)? = nil) {
//
//        self.item = item
//        self.onToggleCompleted = onToggleCompleted
//        self.labelTitleFavorite?.text = item.title
//        self.labelPriceFavorite?.text = item.price
//        let queue = DispatchQueue(label: "loadImgDetail")
//                   queue.async {
//                    if let url = NSURL(string: item.url) {
//                           if let data = NSData(contentsOf: url as URL) {
//                               DispatchQueue.main.async {
//                                       self.imgViewFavorite.image = UIImage(data: data as Data)
//                               }
//                           }
//                       }
//                   }
//      }
//
//      func toggleCompleted() {
//          guard let item = item else { fatalError("Item not found") }
//
//          onToggleCompleted?(item)
//      }
}
