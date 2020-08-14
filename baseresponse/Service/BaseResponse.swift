//
//  BaseResponse.swift
//  baseresponse
//
//  Created by Le Dat on 8/12/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import Foundation
import ObjectMapper


class BaseResponse<T: Mappable>: Mappable{
    var status: Status = Status()
    var result: [T] = []
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        result <- map["result"]
    }
    
    func isSuccessCode() -> Bool? {
        return status.code == 1
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
