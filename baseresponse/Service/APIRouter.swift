//
//  APIRouter.swift
//  baseresponse
//
//  Created by Le Dat on 8/12/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    // =========== Begin define api ===========
    case getAllHomeData
   
    
    // =========== End define api ===========
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .getAllHomeData:
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .getAllHomeData:
            return "/App/TestApi/home.json"
       
        }
    }
    
    // MARK: - Headers
    private var headers: HTTPHeaders {
        let headers = ["Accept": "application/json"]
        switch self {
        case .getAllHomeData:
            break
        }
        
        return headers;
    }

    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .getAllHomeData:
            return [:]
       
        }
    }

    // MARK: - URL request
    func asURLRequest() throws -> URLRequest {
        let url = try Production.BASE_URL.asURL()
        
        // setting path
        var urlRequest: URLRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // setting method
        urlRequest.httpMethod = method.rawValue
        
        // setting header
        for (key, value) in headers {
            urlRequest.addValue(value, forHTTPHeaderField: key)
        }
        
        if let parameters = parameters {
            do {
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            } catch {
                print("Encoding fail")
            }
        }
        
        return urlRequest
    }
    
    private func getAuthorizationHeader() -> String? {
        return "Authorization token"
    }
}
