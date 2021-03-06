//
//  FavoriteCollectionViewCell.swift
//  baseresponse
//
//  Created by Le Dat on 8/27/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import UIKit

class FavoriteCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var thumbnailTitleLabel: UILabel!
    @IBOutlet weak var thumbnailNewPriceLabel: UILabel!
    @IBOutlet weak var thumbnailOldPriceLabel: UILabel!
    @IBOutlet weak var thumbnailRatingLabel: UILabel!
    @IBOutlet weak var thumbnailDisCountLabel: UILabel!
    @IBOutlet weak var star1: UIButton!
    @IBOutlet weak var star2: UIButton!
    @IBOutlet weak var star3: UIButton!
    @IBOutlet weak var star4: UIButton!
    @IBOutlet weak var star5: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func loadData(data: ForYou) {
        thumbnailImageView.sd_setImage(with: URL(string: data.itemImg), placeholderImage: UIImage(systemName: "heart.fill"))
        thumbnailTitleLabel.text = data.itemTitle
        thumbnailDisCountLabel.text = data.itemDiscount
        thumbnailRatingLabel.text = String(data.itemRatingScore)
        thumbnailNewPriceLabel.text = data.itemDiscountPrice
        thumbnailOldPriceLabel.text = data.itemPrice
        switch Double(data.itemRatingScore) {
        case 0:
            star1.setImage(UIImage(systemName: "star"), for: .normal)
            star2.setImage(UIImage(systemName: "star"), for: .normal)
            star3.setImage(UIImage(systemName: "star"), for: .normal)
            star4.setImage(UIImage(systemName: "star"), for: .normal)
            star5.setImage(UIImage(systemName: "star"), for: .normal)
        case 1:
            star1.setImage(UIImage(systemName: "star.fill"), for: .normal)
            star2.setImage(UIImage(systemName: "star"), for: .normal)
            star3.setImage(UIImage(systemName: "star"), for: .normal)
            star4.setImage(UIImage(systemName: "star"), for: .normal)
            star5.setImage(UIImage(systemName: "star"), for: .normal)
        case 2:
            star1.setImage(UIImage(systemName: "star.fill"), for: .normal)
            star2.setImage(UIImage(systemName: "star.fill"), for: .normal)
            star3.setImage(UIImage(systemName: "star"), for: .normal)
            star4.setImage(UIImage(systemName: "star"), for: .normal)
            star5.setImage(UIImage(systemName: "star"), for: .normal)
        case 3:
            star1.setImage(UIImage(systemName: "star.fill"), for: .normal)
            star2.setImage(UIImage(systemName: "star.fill"), for: .normal)
            star3.setImage(UIImage(systemName: "star.fill"), for: .normal)
            star4.setImage(UIImage(systemName: "star"), for: .normal)
            star5.setImage(UIImage(systemName: "star"), for: .normal)
        case 4:
            star1.setImage(UIImage(systemName: "star.fill"), for: .normal)
            star2.setImage(UIImage(systemName: "star.fill"), for: .normal)
            star3.setImage(UIImage(systemName: "star.fill"), for: .normal)
            star4.setImage(UIImage(systemName: "star.fill"), for: .normal)
            star5.setImage(UIImage(systemName: "star"), for: .normal)
        case 4.5:
            star1.setImage(UIImage(systemName: "star.fill"), for: .normal)
            star2.setImage(UIImage(systemName: "star.fill"), for: .normal)
            star3.setImage(UIImage(systemName: "star.fill"), for: .normal)
            star4.setImage(UIImage(systemName: "star.fill"), for: .normal)
            star5.setImage(UIImage(systemName: "star.fill"), for: .normal)
        case 5:
            star1.setImage(UIImage(systemName: "star.fill"), for: .normal)
            star2.setImage(UIImage(systemName: "star.fill"), for: .normal)
            star3.setImage(UIImage(systemName: "star.fill"), for: .normal)
            star4.setImage(UIImage(systemName: "star.fill"), for: .normal)
            star5.setImage(UIImage(systemName: "star.fill"), for: .normal)
            
        default:
            return ()
        }
    }
    
}
