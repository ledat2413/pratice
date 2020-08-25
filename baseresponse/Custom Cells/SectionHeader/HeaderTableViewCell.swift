//
//  HeaderTableViewCell.swift
//  baseresponse
//
//  Created by Le Dat on 8/17/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import UIKit
import SDWebImage

class HeaderTableViewCell: UITableViewCell {

    
    //MARK: --Vars
    var dataFlashSale:[FlashSale] = []
    private var cellIdentifier = "HeaderCollectionViewCell"
    
    //MARK: --IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var section1ImageView: UIImageView!
    @IBOutlet weak var section1ViewMoreButton: UIButton!
    
    
    //MARK: --IBAction
    @IBAction func st1_col_btnAction(_ sender: Any) {
    }
    

    //MARK: --View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: cellIdentifier , bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        loadFlashSale(flashSale: dataFlashSale)
    }
    
    //MARK: --Load Data
    func loadFlashSale(flashSale:[FlashSale]) {
        self.dataFlashSale = flashSale
        collectionView.reloadData()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension HeaderTableViewCell: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataFlashSale.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? HeaderCollectionViewCell else {fatalError()}
        let flashSale = dataFlashSale[indexPath.row]
        
        cell.thumbnailNameLabel.text = "\(flashSale.itemPrice) \(flashSale.currency)"
        cell.thumbnailPercentLabel.text = flashSale.itemDiscount
        cell.thumbnailStateLabel.text = "\(flashSale.itemSoldCnt) Đã bán"
        cell.thumbnailImageView.sd_setImage(with: URL(string: flashSale.itemImg), placeholderImage: UIImage(named: "heart"))
       
        return cell
    }
}
