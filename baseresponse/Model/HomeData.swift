//
//  HomeData.swift
//  baseresponse
//
//  Created by Le Dat on 8/20/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import Foundation
import ObjectMapper

class Status: Mappable{
    var message: String = ""
    var code: Int = 0

    required  init() {
    }

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        message <- map["message"]
        code <- map["code"]
    }
}

class Data: Mappable{
    var promotion: [Promotion] = []
    var flashSale: [FlashSale] = []
    var trending: [Trendings] = []
    var foryou: [ForYou] = []
    
     required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        promotion <- map["promotion"]
        flashSale <- map["flashSale"]
        trending <- map["trending"]
        foryou <- map["forYou"]
    }
}

class Promotion: Mappable{

    var id: Int = 0
    var url: String = ""

    required init?(map: Map) {
    }

    func mapping(map: Map) {
        id <- map["id"]
        url <- map["imageURL"]
    }
}


class FlashSale: Mappable{

    var itemTitle: String = ""
    var itemSoldCnt: String = " "
    var itemDiscount: String = ""
    var almostSoldOut: String = ""
    var itemCurrentStock: String = ""
    var itemId: String = ""
    var itemImg: String = ""
    var itemHaveStock: String = ""
    var itemDiscountPrice: String = ""
    var itemPrice: String = ""
    var currency: String = ""
    var id: String = ""
    var itemUrl: String = ""

    required init?(map: Map) {
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

class Trendings: Mappable{

    var entityType: String = ""
    var popularName: String = ""
    var id: String = ""
    var itemCnt: String = ""
    var itemWantCnt: String = ""
    var popularSubName: String = ""
    var items: [Item] = []

    required init?(map: Map) {
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

class Item: Mappable{

    var itemId: String = ""
    var itemImg: String = ""
    var cateId: String = ""
    var itemUrl: String = ""

    required init?(map: Map) {
       }

       func mapping(map: Map) {
        itemId <- map["itemId"]
        itemImg <- map["itemImg"]
        cateId <- map["cateId"]
        itemUrl <- map["itemUrl"]
       }
}

class ForYou: Mappable{

    var itemRatingScore: Int = 0
    var brandID: String = ""
    var currency: String = ""
    var id: String = ""
    var shopID: Int = 0
    var itemImg: String = ""
    var skuID: String = ""
    var itemTitle: String = ""
    var categoryID: Int = 0
    var itemDiscountPrice: String = ""
    var itemPrice: String = ""
    var itemID: Int = 0
    var itemDiscount: String = ""
    var itemURL: String = ""

    required init?(map: Map) {
}
    required init(itemRatingScore: Int, brandID: String, currency: String, id: String, shopID: Int, itemImg: String, itemTitle: String, categoryID: Int, itemDiscountPrice: String, itemPrice: String, itemID: Int, itemDiscount: String, itemURL: String, skuID: String){
        self.itemRatingScore = itemRatingScore
        self.brandID = brandID
        self.brandID = brandID
        self.id = id
        self.shopID = shopID
        self.itemImg = itemImg
        self.skuID = skuID
        self.itemTitle = itemTitle
        self.categoryID = categoryID
        self.itemDiscountPrice = itemDiscountPrice
        self.itemPrice = itemPrice
        self.itemID = itemID
        self.itemDiscount = itemDiscount
        self.itemURL = itemURL
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
}
