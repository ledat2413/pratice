//
//  HeaderCollectionViewCell2.swift
//  baseresponse
//
//  Created by Le Dat on 8/20/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import UIKit

class HeaderCollectionViewCell2: UICollectionViewCell {

    @IBOutlet weak var scHeader_colCell2_imgView: UIImageView!
    @IBOutlet weak var scHeader_colCell2_labelTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.cornerRadius = 10
    }
}
