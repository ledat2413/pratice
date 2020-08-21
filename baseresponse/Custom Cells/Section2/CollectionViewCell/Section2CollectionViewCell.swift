//
//  Section2CollectionViewCell.swift
//  baseresponse
//
//  Created by Le Dat on 8/19/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import UIKit

class Section2CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var st2_colCell_labelTitle: UILabel!
    @IBOutlet weak var st2_colCell_labelSubTit: UILabel!
    @IBOutlet weak var st2_colCell_img: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
    }

}
