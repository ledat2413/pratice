//
//  Items.swift
//  baseresponse
//
//  Created by Le Dat on 8/12/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import Foundation
import ObjectMapper


class Items: Mappable{
    var id: Int?
    var title: String?
    var url: String?
    var price: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        url <- map["url"]
        price <- map["price"]
    }
}

class Status: Mappable{
    var message: String = ""
    var code: Int = 0
    
    init() {
    }
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        message <- map["message"]
        code <- map["code"]
    }
}
