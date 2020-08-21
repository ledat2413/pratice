//
//  Defaults.swift
//  baseresponse
//
//  Created by Le Dat on 8/15/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import Foundation


//struct Defaults {
//    static let (titleKey,urlKey,priceKey) = ("title","url","price")
//    static let sessionKey = "data"
//    private static let userDefault = UserDefaults.standard
//    
//    struct ItemDetail {
//        let title: String
//        let price: String
//        let url: String
//        
//        init(_ json: [String: Any]) {
//            self.title = json[titleKey] as! String
//            self.price = json[priceKey] as! String
//            self.url = json[urlKey] as! String
//        }
//    }
//    
//    static func counts(){
//        
//    }
//        
//    static func save(title: String,url: String ,price: String){
//        userDefault.set([titleKey: title,urlKey: url ,priceKey: price], forKey: sessionKey)
//        }
//        
//    static func getDetailItem()-> [Items] {
//        return [Items(JSON: ((userDefault.value(forKey: sessionKey) as? [String: String])!))!]
//    }
//    
//    static func clearDetailItem(){
//        userDefault.removeObject(forKey: sessionKey)
//    }
//}
