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
    var dataSource2:[Trendings] = []
    
    //MARK: --IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var st2_col_labelFind: UILabel!
    @IBOutlet weak var st2_col_btnViewMore: UIButton!
    
    
    //MARK: --IBAction
    @IBAction func st2_col_btnAction(_ sender: Any) {
    }
    
    //MARK: --View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "Section2CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Section2CollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        loadTrendings()
        // Initialization code
    }
    
    //MARK: --Func
    private func loadTrendings(){
        MGConnection.requestObject(APIRouter.getAllHomeData, Data.self) { (result, error) in
            guard error == nil else{
                print("Error \(String(describing: error?.mErrorMessage))")
                return
            }
            if let results = result {
                self.dataSource2 = results.trending
            }
            self.collectionView.reloadData()
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension Section2TableViewCell: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource2.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Section2CollectionViewCell", for: indexPath) as! Section2CollectionViewCell
    
        let trending = dataSource2[indexPath.row]
        cell.st2_colCell_labelTitle.text = trending.popularName
        cell.st2_colCell_labelSubTit.text = trending.id
        cell.st2_colCell_img.sd_setImage(with: URL(string: trending.items[0].itemImg),placeholderImage: UIImage(named: "heart"))
        return cell
    }
    
    
}
