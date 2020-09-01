//
//  TableViewCell.swift
//  baseresponse
//
//  Created by Le Dat on 8/28/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    var callbackValue: ((_ value: Int) -> Void)?
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var thumbnailTitle: UILabel!
    @IBOutlet weak var thumbnailPrice: UILabel!
    @IBOutlet weak var thumbnailCountLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func Stepper(_ sender: UIStepper) {
        thumbnailCountLabel.text = convertToCurrency(sender.value)
        callbackValue?(Int(sender.value))
    }
    
    func loadData(data: Cart ) {
        thumbnailTitle.text  = data.itemTitle
        thumbnailPrice.text = data.itemDiscountPrice
        thumbnailCountLabel.text = "\(data.quanlity)"
        thumbnailImageView.sd_setImage(with: URL(string: data.itemImg), placeholderImage: UIImage(systemName: "heart.fill"))
    }
    
    
}
