//
//  MGConnection.swift
//  baseresponse
//
//  Created by Le Dat on 8/12/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class MGConnection {
    
    static func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
    //MARK : -- Request Object
    static func requestObject<T: Mappable>(_ apiRouter: APIRouter,_ returnType: T.Type, completion: @escaping (_ result: [T]?, _ error: BaseResponseError?) -> Void) {
           if !isConnectedToInternet() {
               return
           }
           
           Alamofire.request(apiRouter).responseObject {(response: DataResponse<BaseResponse<T>>) in
               switch response.result {
               case .success:
                   if response.response?.statusCode == 200 {
                       if (response.result.value?.isSuccessCode())! {
                           completion(response.result.value?.result, nil)
                       } else {
                           
                           if let code = response.result.value?.status.code, let message = response.result.value?.status.message {
                               let err: BaseResponseError = BaseResponseError.init(NetworkErrorType.API_ERROR, code, message)
                               
                               completion(nil, err)
                           }
                           
                       }
                   } else {
                       let err: BaseResponseError = BaseResponseError.init(NetworkErrorType.HTTP_ERROR, (response.response?.statusCode)!, "Request is error!")
                       completion(nil, err)
                   }
                   break
                   
               case .failure(let error):
                   if error is AFError {
                       let err: BaseResponseError = BaseResponseError.init(NetworkErrorType.HTTP_ERROR, error._code, "Request is error!")
                       completion(nil, err)
                   }
                   
                   break
               }
           }
    }
}
    
    
    //MARK : - Request Array
//    static func request<T: Mappable>(_ apiRouter: APIRouter,_ returnType: T.Type, completion: @escaping (_ result: T?, _ error: BaseResponseError?) -> Void) {
//        if !isConnectedToInternet() {
//            return
//        }
//
//        Alamofire.request(apiRouter).responseObject {(response: DataResponse<BaseResponse<T>>) in
//            switch response.result {
//            case .success:
//                if response.response?.statusCode == 200 {
//                    if (response.result.value?.isSuccessCode())! {
//                        completion(response.result.value?.result, nil)
//                    } else {
//
//                        if let code = response.result.value?.status.code, let message = response.result.value?.status.message {
//                            let err: BaseResponseError = BaseResponseError.init(NetworkErrorType.API_ERROR, code, message)
//
//                            completion(nil, err)
//                        }
//
//                    }
//                } else {
//                    let err: BaseResponseError = BaseResponseError.init(NetworkErrorType.HTTP_ERROR, (response.response?.statusCode)!, "Request is error!")
//                    completion(nil, err)
//                }
//                break
//
//            case .failure(let error):
//                if error is AFError {
//                    let err: BaseResponseError = BaseResponseError.init(NetworkErrorType.HTTP_ERROR, error._code, "Request is error!")
//                    completion(nil, err)
//                }
//
//                break
//            }
//        }
//    }

