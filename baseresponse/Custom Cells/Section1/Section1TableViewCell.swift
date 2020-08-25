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
    let images:[UIImage] = [UIImage(named: "laz_mall")!,UIImage(named: "laz_category")!,UIImage(named: "laz_game")!,UIImage(named: "laz_groceries")!,UIImage(named: "laz_promo")!,]
    
    var dataSource: [Promotion] = []
    
    private var cellIdentifier1 = "HeaderCollectionViewCell1"
    private var cellIdentifier2 = "HeaderCollectionViewCell2"
    
    private let sectionInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    private let cellHeight: CGFloat = 196.0
    private let itemsPerRow: CGFloat = 1
    
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
        
        collectionView1.register(UINib(nibName: cellIdentifier1, bundle: nil), forCellWithReuseIdentifier: cellIdentifier1)
        collectionView2.register(UINib(nibName: cellIdentifier2, bundle: nil), forCellWithReuseIdentifier: cellIdentifier2)
        
        loadPromotion(dataSource: dataSource)
    }
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func loadPromotion(dataSource:[Promotion]) {
        self.dataSource = dataSource 
        collectionView1.reloadData()
    }
    
}

extension Section1TableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView.tag == 0 {
            return dataSource.count
        }
        else if collectionView.tag == 1 {
            return title.count
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 0 {
            guard let cell = collectionView1.dequeueReusableCell(withReuseIdentifier: cellIdentifier1, for: indexPath) as? HeaderCollectionViewCell1 else {fatalError()}
            let promotion = dataSource[indexPath.row]
            cell.scHeader_colCell1_imgView.sd_setImage(with: URL(string: promotion.url), placeholderImage: UIImage(named: "heart"))
            return cell
        }
        else if collectionView.tag == 1 {
            
            guard let cell = collectionView2.dequeueReusableCell(withReuseIdentifier: cellIdentifier2, for: indexPath) as? HeaderCollectionViewCell2 else {fatalError()}
            
            cell.scHeader_colCell2_labelTitle.text = title[indexPath.row]
            cell.scHeader_colCell2_imgView.image = images[indexPath.row]
            
            return cell
        }
        return UICollectionViewCell()
    }
}

extension Section1TableViewCell: UICollectionViewDelegateFlowLayout{
    
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if collectionView.tag == 0 {
       let availableWidth = collectionView.frame.width - sectionInsets.left
        return CGSize(width: availableWidth, height: cellHeight)
    }
    else if collectionView.tag == 1 {
        let availableWidth = collectionView.frame.width - sectionInsets.left
         return CGSize(width:availableWidth/5 , height: 55)
    }
    return CGSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
         if collectionView.tag == 0 {
             return sectionInsets
         }
         return sectionInsets
     }
     
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
         if collectionView.tag == 0 {
             return sectionInsets.left
         }
         else if collectionView.tag == 1 {
            return 2
        }
         return sectionInsets.left
     }
}

