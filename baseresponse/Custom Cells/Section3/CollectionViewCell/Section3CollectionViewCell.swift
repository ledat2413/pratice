//
//  Section3CollectionViewCell.swift
//  baseresponse
//
//  Created by Le Dat on 8/19/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import UIKit

class Section3CollectionViewCell: UICollectionViewCell {
    
    //MARK: --Vars
    var dataRating:[ForYou] = []
    
    //MARK: --IBOutlet
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var thumbnailTitleLabel: UILabel!
    @IBOutlet weak var thumbnailNewPriceLabel: UILabel!
    @IBOutlet weak var thumbnailOldPriceLabel: UILabel!
    @IBOutlet weak var thumbnailPercenLabel: UILabel!
    @IBOutlet weak var thumbnailRatingLabel: UILabel!
    
    @IBOutlet weak var star1Button: UIButton!
    @IBOutlet weak var star2Button: UIButton!
    @IBOutlet weak var star3Button: UIButton!
    @IBOutlet weak var star4Button: UIButton!
    @IBOutlet weak var star5Button: UIButton!
    //MARK: --View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
        
    }
}
    

