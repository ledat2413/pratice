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
    var dataSource:[FlashSale] = []
    
    //MARK: --IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var st1_col_imgView: UIImageView!
    @IBOutlet weak var st1_col_btnViewMore: UIButton!
    
    
    //MARK: --IBAction
    @IBAction func st1_col_btnAction(_ sender: Any) {
    }
    
    //MARK: --Func
    private func loadFlashSale(){
        MGConnection.requestObject(APIRouter.getAllHomeData, Data.self) { (result, error) in
            guard error == nil else {
                print("Error code: \(String(describing: error?.mErrorCode)) and Error massage: \(String(describing: error?.mErrorMessage))")
                return
            }
            if let results = result {
                self.dataSource = results.flashSale
                print(results.flashSale)
            }
            self.collectionView.reloadData()
        }
    }
    
    //MARK: --View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "HeaderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HeaderCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        loadFlashSale()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension HeaderTableViewCell: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCollectionViewCell", for: indexPath) as! HeaderCollectionViewCell
        let flashSale = dataSource[indexPath.row]
        
        cell.header_item_collection_labelName.text = "\(flashSale.itemPrice) \(flashSale.currency)"
    
        cell.header_item_collection_labelPercent.text = flashSale.itemDiscount
        cell.header_item_collection_labelState.text = "\(flashSale.itemSoldCnt) Đã bán"
        cell.header_item_collection_Img.sd_setImage(with: URL(string: flashSale.itemImg), placeholderImage: UIImage(named: "heart"))
       
        return cell
    }
}
