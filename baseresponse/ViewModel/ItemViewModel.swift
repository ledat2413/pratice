//
//  ItemViewModel.swift
//  baseresponse
//
//  Created by Le Dat on 8/13/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import Foundation


protocol ItemsCollectionViewModel: class {
    var items: [Items] {get}
    var itemsListDataSource: ItemsCollectionViewModel! {get set}
    var itemsDidChange: ((ItemsCollectionViewModel) -> ())? {get set}
        
    init(items: [Items])
    func showItemsList()
}
