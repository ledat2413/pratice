//
//  Cart2CollectionViewCell.swift
//  baseresponse
//
//  Created by Le Dat on 8/27/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import UIKit

class Cart2CollectionViewCell: UICollectionViewCell {
    
    var subTotal: Int = 0
    
    @IBOutlet weak var subTotalLabel: UILabel!
    @IBOutlet weak var shippingCostLabel: UILabel!
    @IBOutlet weak var taxesLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
