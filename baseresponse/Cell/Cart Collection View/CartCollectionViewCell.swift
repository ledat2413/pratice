//
//  CartCollectionViewCell.swift
//  baseresponse
//
//  Created by Le Dat on 8/26/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import UIKit
import GMStepper

class CartCollectionViewCell: UICollectionViewCell {

    var total: Int = 0
    
    @IBOutlet weak var thumbnailCountLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var thumbnailTitleLabel: UILabel!
    @IBOutlet weak var thumbnailPriceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func stepper(_ sender: UIStepper) {
        thumbnailCountLabel.text = String(sender.value)
    }
}
