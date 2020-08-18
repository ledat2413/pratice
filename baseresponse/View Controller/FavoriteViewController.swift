//
//  FavoriteViewController.swift
//  baseresponse
//
//  Created by Le Dat on 8/14/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {

    //MARK : -- Variables
    var items: Items!
    let data: UserDefaults = UserDefaults()
    //MARK : -- IBOutlet
    @IBOutlet var favoriteCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func dataFavorite(){
        let data1: [Items] = data.array(forKey: "data") as! [Items]
        print(data1)
    }
}
