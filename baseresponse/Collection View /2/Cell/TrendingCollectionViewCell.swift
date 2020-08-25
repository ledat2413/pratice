//
//  TrendingCollectionViewCell.swift
//  baseresponse
//
//  Created by Le Dat on 8/25/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import UIKit

class TrendingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var thumbnailTitleLabel: UILabel!
    @IBOutlet weak var thumbnailTopLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
    }

}
