//
//  Sec2CollectionViewCell.swift
//  baseresponse
//
//  Created by Le Dat on 8/25/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import UIKit

class Sec2CollectionViewCell: UICollectionViewCell {

    var dataTrending: [Trendings] = []
    var cellIdentifier = "TrendingCollectionViewCell"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        
        loadDataTrending(dataTrending: dataTrending)
    }

    @IBAction func viewMore1Button(_ sender: Any) {
    }
    @IBAction func viewMore2Button(_ sender: Any) {
    }
    
    func loadDataTrending(dataTrending: [Trendings]){
        self.dataTrending = dataTrending
        collectionView.reloadData()
    }
    
    
}

extension Sec2CollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataTrending.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? TrendingCollectionViewCell else {fatalError()}
        
        let trending = dataTrending[indexPath.row]
        
        cell.thumbnailImageView.sd_setImage(with: URL(string: trending.items[0].itemImg), placeholderImage: UIImage(named: "heart.fill"))
        cell.thumbnailTitleLabel.text = trending.popularName
        cell.thumbnailTopLabel.text = trending.id
        
        return cell
    }
}
