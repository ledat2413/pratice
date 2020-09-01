//
//  Sec1CollectionViewCell.swift
//  baseresponse
//
//  Created by Le Dat on 8/25/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import UIKit

class Sec1CollectionViewCell: UICollectionViewCell {
    
    //MARK: --Vars
    private var cellIdentifier = "FlashSaleCollectionViewCell"
    var dataFlashSale:[FlashSale] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var section1ImageView: UIImageView!
    @IBOutlet weak var sectionViewMoreButton: UIButton!
    
    //MARK: --IBAction
    
    @IBAction func ViewMoreActionButton(_ sender: Any) {
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        loadFlashSale(flashSale: dataFlashSale)
        collectionView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    }
    
    //MARK: --Load Data
    func loadFlashSale(flashSale:[FlashSale]) {
        self.dataFlashSale = flashSale
        collectionView.reloadData()
    }
    
    
}

extension Sec1CollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataFlashSale.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? FlashSaleCollectionViewCell else {fatalError()}
         let flashSale = dataFlashSale[indexPath.row]
               
               cell.thumbnailPriceLabel.text = "\(flashSale.itemPrice) \(flashSale.currency)"
               cell.thumbnailDiscountLabel.text = flashSale.itemDiscount
               cell.thumbnailSoldLabel.text = "\(flashSale.itemSoldCnt) Đã bán"
               cell.thumbnailImageView.sd_setImage(with: URL(string: flashSale.itemImg), placeholderImage: UIImage(named: "heart"))
        return cell
    }
}
