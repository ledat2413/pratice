//
//  aaa.swift
//  baseresponse
//
//  Created by Le Dat on 8/17/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import Foundation

class Detail: NSObject, NSCoding {
    var id: Int
    var title: String
    var url: String
    var price: String


    init(id: Int, title: String, url: String, price: String) {
        self.id = id
        self.title = title
        self.url = url
        self.price = price

    }

    required convenience init(coder aDecoder: NSCoder) {
        let id = aDecoder.decodeInteger(forKey: "id")
        let title = aDecoder.decodeObject(forKey: "title") as! String
        let url = aDecoder.decodeObject(forKey: "url") as! String
        let price = aDecoder.decodeObject(forKey: "price") as! String
        self.init(id: id, title: title,url: url, price: price)
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(title, forKey: "title")
        aCoder.encode(url, forKey: "url")
        aCoder.encode(price, forKey: "price")
    }
}
