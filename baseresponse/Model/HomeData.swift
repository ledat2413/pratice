//
//  HomeData.swift
//  baseresponse
//
//  Created by Le Dat on 8/20/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class Status: Mappable{
    var message: String = ""
    var code: Int = 0
    
    required  init() {
    }
    
    required  init?(map: Map) {
    }
    
    func mapping(map: Map) {
        message <- map["message"]
        code <- map["code"]
    }
}

class Data: Object, Mappable{
    dynamic var promotion: [Promotion] = []
    dynamic  var flashSale: [FlashSale] = []
    dynamic var trending: [Trendings] = []
    dynamic  var foryou: [ForYou] = []
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        promotion <- map["promotion"]
        flashSale <- map["flashSale"]
        trending <- map["trending"]
        foryou <- map["forYou"]
    }
}

class Promotion: Object,Mappable{
    
    dynamic var id: Int = 0
    dynamic var url: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        url <- map["imageURL"]
    }
}


class FlashSale: Object, Mappable{
    
    dynamic var itemTitle: String = ""
    dynamic var itemSoldCnt: String = " "
    dynamic var itemDiscount: String = ""
    dynamic  var almostSoldOut: String = ""
    dynamic  var itemCurrentStock: String = ""
    dynamic var itemId: String = ""
    dynamic  var itemImg: String = ""
    dynamic  var itemHaveStock: String = ""
    dynamic  var itemDiscountPrice: String = ""
    dynamic   var itemPrice: String = ""
    dynamic  var currency: String = ""
    dynamic  var id: String = ""
    dynamic  var itemUrl: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        itemTitle <- map["itemTitle"]
        itemSoldCnt <- map["itemSoldCnt"]
        itemDiscount <- map["itemDiscount"]
        almostSoldOut <- map["almostSoldOut"]
        itemCurrentStock <- map["itemCurrentStock"]
        itemId <- map["itemId"]
        itemImg <- map["itemImg"]
        itemHaveStock <- map["itemHaveStock"]
        itemDiscountPrice <- map["itemDiscountPrice"]
        itemPrice <- map["itemPrice"]
        currency <- map["currency"]
        id <- map["id"]
        itemUrl <- map["itemUrl"]
        
    }
}

class Trendings: Object, Mappable{
    
    dynamic  var entityType: String = ""
    dynamic   var popularName: String = ""
    dynamic  var id: String = ""
    dynamic   var itemCnt: String = ""
    dynamic   var itemWantCnt: String = ""
    dynamic  var popularSubName: String = ""
    dynamic  var items: [Item] = []
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        entityType <- map["entityType"]
        popularName <- map["popularName"]
        id <- map["id"]
        itemCnt <- map["itemCnt"]
        itemWantCnt <- map["itemWantCnt"]
        popularSubName <- map["popularSubName"]
        items <- map["items"]
        
    }
}

class Item: Object, Mappable{
    
    dynamic var itemId: String = ""
    dynamic  var itemImg: String = ""
    dynamic  var cateId: String = ""
    dynamic  var itemUrl: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        itemId <- map["itemId"]
        itemImg <- map["itemImg"]
        cateId <- map["cateId"]
        itemUrl <- map["itemUrl"]
    }
}

class ForYou: Object, Mappable{
    
    @objc dynamic var itemRatingScore: Int = 0
    @objc dynamic var brandID: String = ""
    @objc dynamic var currency: String = ""
    @objc dynamic  var id: String = ""
    @objc dynamic var shopID: Int = 0
    @objc dynamic var itemImg: String = ""
    @objc dynamic  var skuID: String = ""
    @objc dynamic  var itemTitle: String = ""
    @objc dynamic  var categoryID: Int = 0
    @objc dynamic var itemDiscountPrice: String = ""
    @objc dynamic  var itemPrice: String = ""
    @objc dynamic  var itemID: Int = 0
    @objc dynamic  var itemDiscount: String = ""
    @objc dynamic  var itemURL: String = ""
    @objc dynamic var isFavorite: Bool = false
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        itemRatingScore <- map["itemRatingScore"]
        brandID <- map["brandID"]
        currency <- map["currency"]
        id <- map["id"]
        shopID <- map["shopID"]
        skuID <- map["skuID"]
        itemImg <- map["itemImg"]
        itemTitle <- map["itemTitle"]
        categoryID <- map["categoryID"]
        itemDiscountPrice <- map["itemDiscountPrice"]
        itemPrice <- map["itemPrice"]
        itemID <- map["itemID"]
        itemDiscount <- map["itemDiscount"]
        itemURL <- map["itemURL"]
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    //MARK: --Func
    
    static func getFavoriteById(id: String) -> ForYou? {
           let data = try! Realm()
           return data.objects(ForYou.self).filter("id = '\(id)'").first
       }
    
    func save() {
        let database = try! Realm()
        try! database.write {
            database.add(self, update: .all)
        }
    }
    
    func remove() {
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(self)
            }
        } catch {
            print("Lỗi Delete đối tượng")
        }
    }
}

class Cart: Object {
    
    @objc dynamic var itemRatingScore: Int = 0
    @objc dynamic var brandID: String = ""
    @objc dynamic var currency: String = ""
    @objc dynamic  var id: String = ""
    @objc dynamic var shopID: Int = 0
    @objc dynamic var itemImg: String = ""
    @objc dynamic  var skuID: String = ""
    @objc dynamic  var itemTitle: String = ""
    @objc dynamic  var categoryID: Int = 0
    @objc dynamic var itemDiscountPrice: String = ""
    @objc dynamic  var itemPrice: String = ""
    @objc dynamic  var itemID: Int = 0
    @objc dynamic  var itemDiscount: String = ""
    @objc dynamic  var itemURL: String = ""
    @objc dynamic var quanlity: Int = 0
    
    required convenience init?(map: Map) {
        self.init()
    }
    override class func primaryKey() -> String? {
        return "id"
    }
    
    //MARK: --Func
    static func getCartById(id: String) -> Cart? {
        let data = try! Realm()
        return data.objects(Cart.self).filter("id = '\(id)'").first
    }
        
    func save() {
        let database = try! Realm()
        try! database.write {
            database.add(self, update: .all)
        }
    }
    
    func updateQuanlity(quanlity: Int) {
        let realm = try! Realm()
        try! realm.write { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.quanlity = quanlity
        }
    }
    
    func remove() {
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(self)
            }
        } catch {
            print("Lỗi Delete đối tượng")
        }
    }
    
}
