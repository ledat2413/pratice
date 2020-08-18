//
//  Configs.swift
//  baseresponse
//
//  Created by Le Dat on 8/12/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import Foundation


struct Production {
    static let BASE_URL: String = "https://raw.githubusercontent.com/lhvan89/files/master/"
}

enum NetworkErrorType {
    case API_ERROR
    case HTTP_ERROR
}
