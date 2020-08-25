//
//  HeaderCollectionViewCell.swift
//  baseresponse
//
//  Created by Le Dat on 8/19/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import UIKit

class HeaderCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var thumbnailStateLabel: UILabel!
    @IBOutlet weak var thumbnailPercentLabel: UILabel!
    @IBOutlet weak var thumbnailNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
        self.thumbnailStateLabel.layer.cornerRadius = 5
        thumbnailStateLabel.layer.masksToBounds = true
        thumbnailStateLabel.textAlignment = .center
    }
    
}
