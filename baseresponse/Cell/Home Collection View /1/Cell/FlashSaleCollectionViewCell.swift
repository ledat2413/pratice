//
//  FlashSaleCollectionViewCell.swift
//  baseresponse
//
//  Created by Le Dat on 8/25/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import UIKit

class FlashSaleCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var thumbnailSoldLabel: UILabel!
    @IBOutlet weak var thumbnailPriceLabel: UILabel!
    @IBOutlet weak var thumbnailDiscountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
        self.thumbnailSoldLabel.layer.cornerRadius = 5
        thumbnailSoldLabel.layer.masksToBounds = true
        thumbnailSoldLabel.textAlignment = .center    }

}
