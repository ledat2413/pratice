////
////  Detail.swift
////  baseresponse
////
////  Created by Le Dat on 8/17/20.
////  Copyright © 2020 Le Dat. All rights reserved.
////
//
//import Foundation
//
//class Settings: NSObject {
//    static var wishList: [Detail] {
//        get {
//            if let data = UserDefaults.standard.object(forKey: "kWishList") as? NSData {
//                return NSKeyedUnarchiver.unarchiveObject(with: data as Data) as? [Detail] ?? []
//            }
//            return []
//        }
//        set {
//            UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: newValue), forKey: "kWishList")
//            UserDefaults.standard.synchronize()
//        }
//    }
//}
//
//class Detail : NSObject, NSCoding {
//
//    var id: Int
//    var title: String
//    var price: String
//    var url: String
//    var isWishList: Bool
//
//    init(id: Int, title: String, price: String, url: String,isWishList: Bool) {
//        self.id = id
//        self.title = title
//        self.price = price
//        self.url = url
//        self.isWishList = isWishList
//    }
//
//    func encode(with coder: NSCoder) {
//        coder.encode(id, forKey: "kItemId")
//        coder.encode(title, forKey: "kTitle")
//        coder.encode(price, forKey: "kPrice")
//        coder.encode(url, forKey: "kUrl")
//        coder.encode(isWishList, forKey: "kIsWishList")
//    }
//
//    required init(coder aDecoder: NSCoder) {
//        id = aDecoder.decodeInteger(forKey: "kItemId")
//        title = aDecoder.decodeObject(forKey: "kTitle") as? String ?? ""
//        price = aDecoder.decodeObject(forKey: "kPrice") as? String ?? ""
//        url = aDecoder.decodeObject(forKey: "kUrl") as? String ?? ""
//        isWishList = aDecoder.decodeObject(forKey: "kIsWishList") as? Bool ?? false
//    }
//}
//
