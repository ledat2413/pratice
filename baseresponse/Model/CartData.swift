//
//  CartData.swift
//  baseresponse
//
//  Created by Le Dat on 9/1/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

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

     static func getListCart() -> Results<Cart>{
        let data = try! Realm()
        return data.objects(Cart.self)
    }
    
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
