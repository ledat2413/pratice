//
//  Section3CollectionViewCell.swift
//  baseresponse
//
//  Created by Le Dat on 8/19/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import UIKit

class Section3CollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var st3_colCell_imgView: UIImageView!
    
    @IBOutlet weak var st3_colCell_labelTitle: UILabel!
    @IBOutlet weak var st3_colCell_labelNewPrice: UILabel!
    @IBOutlet weak var st3_colCell_labelOldPrice: UILabel!
    @IBOutlet weak var st3_colCell_labelPercent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
    }

}
