//
//  Configs.swift
//  baseresponse
//
//  Created by Le Dat on 8/12/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import Foundation


struct Production {
    static let BASE_URL: String = "http://192.168.1.85:5001"
}
enum NetworkErrorType {
    case API_ERROR
    case HTTP_ERROR
}
