////
////  Realm.swift
////  baseresponse
////
////  Created by Le Dat on 8/18/20.
////  Copyright © 2020 Le Dat. All rights reserved.
////
//
//import Foundation
//import RealmSwift
//
//class Item: Object{
//    @objc dynamic var id = 0
//    @objc dynamic var title = ""
//    @objc dynamic var url = ""
//    @objc dynamic var price = ""
//    @objc dynamic var isFavorite = false
//
//    override class func primaryKey() -> String? {
//        return "id"
//    }
//
//    func save() {
//        let database = try! Realm()
//        try! database.write {
//            database.add(self, update: .all)
//        }
//    }
//
//
//}
//
