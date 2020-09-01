//
//  ForYouCollectionViewCell.swift
//  baseresponse
//
//  Created by Le Dat on 8/25/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import UIKit

class ForYouCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var thumbnailDiscountLabel: UILabel!
    @IBOutlet weak var thumbnailTitleLabel: UILabel!
    @IBOutlet weak var thumbnailNewPriceLabel: UILabel!
    @IBOutlet weak var thumbnailOldPriceLabel: UILabel!
    @IBOutlet weak var thumbnailRatingLabel: UILabel!
    @IBOutlet weak var star1: UIButton!
    @IBOutlet weak var star2: UIButton!
    @IBOutlet weak var star3: UIButton!
    @IBOutlet weak var star4: UIButton!
    @IBOutlet weak var star5: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
    }

}
