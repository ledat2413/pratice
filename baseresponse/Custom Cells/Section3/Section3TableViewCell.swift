//
//  Section3TableViewCell.swift
//  baseresponse
//
//  Created by Le Dat on 8/19/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import UIKit

class Section3TableViewCell: UITableViewCell {

    //MARK: --IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: --Vars
    var dataSource1:[ForYou] = []
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "Section3CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Section3CollectionViewCell")
        loadForYou()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: --Func
    
    private func loadForYou(){
        MGConnection.requestObject(APIRouter.getAllHomeData, Data.self) { (result, error) in
            guard error == nil else{
                print("Error \(String(describing: error?.mErrorMessage))")
                return
            }
            if let results = result{
                self.dataSource1 = results.foryou
            }
            self.collectionView.reloadData()
        }
    }
    
}

extension Section3TableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource1.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Section3CollectionViewCell", for: indexPath) as! Section3CollectionViewCell
        
        let forYou = dataSource1[indexPath.row]
        
        cell.st3_colCell_labelTitle.text = forYou.itemTitle
        cell.st3_colCell_labelPercent.text = forYou.itemDiscountPrice
        cell.st3_colCell_imgView.sd_setImage(with: URL(string: forYou.itemImg), placeholderImage: UIImage(named: "heart"))
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

extension Section3TableViewCell: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width:(self.frame.width/2) - 20, height: 260)
    }
    
}
