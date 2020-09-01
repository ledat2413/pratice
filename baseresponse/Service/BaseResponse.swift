//
//  BaseResponse.swift
//  baseresponse
//
//  Created by Le Dat on 8/12/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift


class BaseResponse<T: Mappable>: Object, Mappable{
   dynamic var status: Status = Status()
   dynamic var result: T?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        result <- map["result"]
    }
    
    func isSuccessCode() -> Bool? {
        return status.code == 200
    }
}

class BaseResponseError {
    var mErrorType: NetworkErrorType!
    var mErrorCode: Int!
    var mErrorMessage: String!
       
       init(_ errorType: NetworkErrorType,_ errorCode: Int,_ errorMessage: String) {
           mErrorType = errorType
           mErrorCode = errorCode
           mErrorMessage = errorMessage
       }
}
