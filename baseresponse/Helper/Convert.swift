//
//  Convery.swift
//  baseresponse
//
//  Created by Le Dat on 8/28/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import Foundation

func convertToCurrency(_ number: Double) -> String {
    
    let currencyFormatter = NumberFormatter()
    currencyFormatter.usesGroupingSeparator = true
    currencyFormatter.locale = Locale.autoupdatingCurrent
    
    return currencyFormatter.string(from: NSNumber(value: number))!
}
