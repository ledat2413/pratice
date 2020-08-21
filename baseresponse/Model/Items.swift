////
////  Items.swift
////  baseresponse
////
////  Created by Le Dat on 8/12/20.
////  Copyright © 2020 Le Dat. All rights reserved.
////
//
//import Foundation
//import ObjectMapper
//import RealmSwift
//
//class Items: Mappable {
//
//    var id: Int = 0
//    var title: String = ""
//    var url: String = ""
//    var price: String = ""
//    var isFavorite: Bool = false
//    
//    init(id: Int, title: String, price: String, url: String, isFavorite: Bool = false) {
//        self.id = id
//        self.title = title
//        self.price = price
//        self.url = url
//        self.isFavorite = isFavorite
//    }
//    
//    required  init?(map: Map) {
//        self.init()
//    }
//    
//
//    func mapping(map: Map) {
//        id <- map["id"]
//        title <- map["title"]
//        url <- map["url"]
//        price <- map["price"]
//    }
//}
//
//class Status:Object, Mappable{
//    var message: String = ""
//    var code: Int = 0
//    
//    required public init() {
//        super.init()
//    }
//    
//    required convenience init?(map: Map) {
//        self.init()
//    }
//    
//    func mapping(map: Map) {
//        message <- map["message"]
//        code <- map["code"]
//    }
//}
//
//
