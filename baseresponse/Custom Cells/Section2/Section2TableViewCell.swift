//
//  Section2TableViewCell.swift
//  baseresponse
//
//  Created by Le Dat on 8/19/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import UIKit

class Section2TableViewCell: UITableViewCell {

    //MARK: --Vars
    private var cellIdentifier = "Section2CollectionViewCell"
    var dataTrending:[Trendings] = []
    
    //MARK: --IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var section2FindLabel: UILabel!
    @IBOutlet weak var section2ForYouLabel: UILabel!
    @IBOutlet weak var section2ViewMoreButton1: UIButton!
    @IBOutlet weak var section2ViewMoreButton2: UIButton!
    
    
    //MARK: --IBAction
    @IBAction func sectionViewMoreAction1(_ sender: Any) {
    }
    
    @IBAction func sectionViewMoreAction2(_ sender: Any) {
    }
    
    //MARK: --View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        loadTrending(dataTrending: dataTrending)
    }

    func loadTrending(dataTrending:[Trendings]){
        self.dataTrending = dataTrending
        collectionView.reloadData()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension Section2TableViewCell: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataTrending.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? Section2CollectionViewCell else {fatalError()}
    
        let trending = dataTrending[indexPath.row]
        cell.thumbnailTitleLabel.text = trending.popularName
        cell.thumbnailSubTitleLabel.text = trending.id
        cell.thumbnailImageView.sd_setImage(with: URL(string: trending.items[0].itemImg),placeholderImage: UIImage(named: "heart"))
        return cell
    }
    
    
}
