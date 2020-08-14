//
//  Binding.swift
//  baseresponse
//
//  Created by Le Dat on 8/13/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import Foundation
import RxSwift

class DataBinding<T> {
    typealias Handler = (T) -> Void
       private var handler: Handler?
       var value: T {
           didSet {
               self.handler?(value)
           }
       }
       
       init(value: T) {
           self.value = value
       }
       
       func bind(hdl: @escaping Handler) {
           self.handler = hdl
           handler?(value)
       }
}
