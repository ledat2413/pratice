//
//  DetailItemTableViewCell.swift
//  baseresponse
//
//  Created by Le Dat on 8/31/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import UIKit

class DetailItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var thumbnailPriceLabel: UILabel!
    @IBOutlet weak var thumbailOldPriceLabel: UILabel!
    @IBOutlet weak var thumbnailDiscountLabel: UILabel!
    @IBOutlet weak var thumbnailTitleLabel: UILabel!
    @IBOutlet weak var thumbnailRatingLabel: UILabel!
    @IBOutlet weak var star1: UIButton!
    @IBOutlet weak var star2: UIButton!
    @IBOutlet weak var star3: UIButton!
    @IBOutlet weak var star4: UIButton!
    @IBOutlet weak var star5: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setUpCell(model: ForYou){
        thumbnailImageView.sd_setImage(with: URL(string: model.itemImg), placeholderImage: UIImage(systemName: "heart.fill"))
        thumbailOldPriceLabel.text = model.itemPrice
        thumbnailDiscountLabel.text = model.itemDiscount
        thumbnailTitleLabel.text = model.itemTitle
        thumbnailPriceLabel.text = "\(model.itemDiscountPrice) \(model.currency)"
        thumbnailRatingLabel.text = "\(model.itemRatingScore)/5"
        
        switch Double(model.itemRatingScore) {
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
            star4.setImage(UIImage(systemName: "star.half.fill"), for: .normal)
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
