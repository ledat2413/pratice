//
//  Section1TableViewCell.swift
//  baseresponse
//
//  Created by Le Dat on 8/20/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import UIKit
import SDWebImage

class Section1TableViewCell: UITableViewCell {

    //MARK: --Vars
    let title:[String] = ["Laz Mall","Siêu Thị Lazada","Mã Giảm Giá","Danh Mục","Nạp Thẻ & eVoucher"]
    var dataSourceHeader: [Promotion] = []
    
    //MARK: --IBOutlet
    @IBOutlet weak var collectionView1: UICollectionView!
    @IBOutlet weak var collectionView2: UICollectionView!
    
    
    //MARK: --View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView1.delegate = self
        collectionView1.dataSource = self
        collectionView2.delegate = self
        collectionView2.dataSource = self
        
        collectionView1.register(UINib(nibName: "HeaderCollectionViewCell1", bundle: nil), forCellWithReuseIdentifier: "HeaderCollectionViewCell1")
        collectionView2.register(UINib(nibName: "HeaderCollectionViewCell2", bundle: nil), forCellWithReuseIdentifier: "HeaderCollectionViewCell2")
        
        loadPromotion()
    }
    
    //MARK: --Func
    private func loadPromotion(){
        MGConnection.requestObject(APIRouter.getAllHomeData, Data.self) { (result, error) in
            guard error == nil else {
                print("Erorr\(String(describing: error?.mErrorMessage)) and Status code \(String(describing: error?.mErrorCode))")
                return
            }
            if let results = result {
                self.dataSourceHeader = results.promotion
            }
            self.collectionView1.reloadData()
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension Section1TableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return dataSourceHeader.count
        }
        else if collectionView.tag == 1 {
            return title.count
        }
        return 1
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 0 {
            let cell = collectionView1.dequeueReusableCell(withReuseIdentifier: "HeaderCollectionViewCell1", for: indexPath) as! HeaderCollectionViewCell1
            let promotion = dataSourceHeader[indexPath.row]
            cell.scHeader_colCell1_imgView.sd_setImage(with: URL(string: promotion.url), placeholderImage: UIImage(named: "heart"))
            return cell
        }
        else if collectionView.tag == 1 {
            
            let cell = collectionView2.dequeueReusableCell(withReuseIdentifier: "HeaderCollectionViewCell2", for: indexPath) as! HeaderCollectionViewCell2
            let image:[UIImage] = [UIImage(named: "laz_mall")!,UIImage(named: "laz_category")!,UIImage(named: "laz_game")!,UIImage(named: "laz_groceries")!,UIImage(named: "laz_promo")!,]
            cell.scHeader_colCell2_labelTitle.text = title[indexPath.row]
            cell.scHeader_colCell2_imgView.image = image[indexPath.row]
            return cell
        }
        return UICollectionViewCell()
    }
}

extension Section1TableViewCell: UICollectionViewDelegateFlowLayout{
    
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if collectionView.tag == 0 {
        return CGSize(width:self.frame.width, height: self.frame.height)
    }
    else if collectionView.tag == 1 {
         return CGSize(width:(self.frame.width/5) - 10, height: 55)
    }
    return CGSize()
    }
}
