//
//  CustomButton.swift
//  baseresponse
//
//  Created by Le Dat on 8/14/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import Foundation

class HighlightedButton: UIButton {

    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? .red : .green
        }
    }
}
