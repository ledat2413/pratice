//
//  CollectionViewCell2.swift
//  baseresponse
//
//  Created by Le Dat on 8/25/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import UIKit

class CollectionViewCell2: UICollectionViewCell {

    @IBOutlet weak var cell2Label: UILabel!
    @IBOutlet weak var Cell2ImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
    }

}
