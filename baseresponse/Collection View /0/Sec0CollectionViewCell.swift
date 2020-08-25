//
//  Sec0CollectionViewCell.swift
//  baseresponse
//
//  Created by Le Dat on 8/25/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import UIKit

class Sec0CollectionViewCell: UICollectionViewCell {
    
    
    //MARK: --Vars
    private let sectionInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    private let cellHeight: CGFloat = 196.0
    private let itemsPerRow: CGFloat = 1
    
    let title:[String] = ["Laz Mall","Siêu Thị Lazada","Mã Giảm Giá","Danh Mục","Nạp Thẻ & eVoucher"]
    let images:[UIImage] = [UIImage(named: "laz_mall")!,UIImage(named: "laz_category")!,UIImage(named: "laz_game")!,UIImage(named: "laz_groceries")!,UIImage(named: "laz_promo")!,]
    
    var dataSource: [Promotion] = []
    var cellIdentifier = ["CollectionViewCell1","CollectionViewCell2"]
    
    //MARK: --IBOutlet
    @IBOutlet weak var collectionView1: UICollectionView!
    @IBOutlet weak var collectionView2: UICollectionView!
    
    //MARK: --View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView1.dataSource = self
        collectionView1.delegate = self
        
        collectionView2.dataSource = self
        collectionView2.delegate = self
        
        collectionView1.register(UINib(nibName: cellIdentifier[0], bundle: nil), forCellWithReuseIdentifier: cellIdentifier[0])
        
        collectionView2.register(UINib(nibName: cellIdentifier[1], bundle: nil), forCellWithReuseIdentifier: cellIdentifier[1])
        
        loadPromotion(dataSource: dataSource)
    }
    
    func loadPromotion(dataSource:[Promotion]) {
          self.dataSource = dataSource
          collectionView1.reloadData()
      }
    
}

extension Sec0CollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
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
        switch collectionView.tag {
            
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier[0], for: indexPath) as? CollectionViewCell1 else {fatalError()}
            
            cell.collection1ImageView.sd_setImage(with: URL(string: dataSource[indexPath.row].url), placeholderImage: UIImage(systemName: "heart.fill"))
            
            return cell
//            
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier[1], for: indexPath) as? CollectionViewCell2 else {fatalError()}
            
            cell.Cell2ImageView.image = images[indexPath.row]
            cell.cell2Label.text = title[indexPath.row]
            
            return cell
            
        default:
            return UICollectionViewCell()
            
        }
    }
}

extension Sec0CollectionViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if collectionView.tag == 0 {
       let availableWidth = collectionView.frame.width - sectionInsets.left
        return CGSize(width: availableWidth, height: cellHeight)
    }
    else if collectionView.tag == 1 {
        let availableWidth = collectionView.frame.width - sectionInsets.left
         return CGSize(width:(availableWidth/6) - 5 , height: 55)
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
