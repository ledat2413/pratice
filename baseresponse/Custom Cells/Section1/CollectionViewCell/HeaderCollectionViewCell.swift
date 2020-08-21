//
//  HeaderCollectionViewCell.swift
//  baseresponse
//
//  Created by Le Dat on 8/19/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import UIKit

class HeaderCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var header_item_collection_Img: UIImageView!
    @IBOutlet weak var header_item_collection_labelState: UILabel!
    @IBOutlet weak var header_item_collection_labelPercent: UILabel!
    @IBOutlet weak var header_item_collection_labelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
        self.header_item_collection_labelState.layer.cornerRadius = 5
        header_item_collection_labelState.layer.masksToBounds = true
        header_item_collection_labelState.textAlignment = .center
    }
    
}
