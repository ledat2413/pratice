//
//  DetailViewController.swift
//  baseresponse
//
//  Created by Le Dat on 8/24/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    //MARK: --Vars
    var dataForYou: ForYou?
    
    //MARK: --IBOutlet
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var detailPriceLabel: UILabel!
    @IBOutlet weak var rating1: UIButton!
    @IBOutlet weak var rating2: UIButton!
    @IBOutlet weak var rating3: UIButton!
    @IBOutlet weak var rating4: UIButton!
    @IBOutlet weak var rating5: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    @IBAction func addCartButton(_ sender: Any) {
    }
    
    //MARK: --Func
    private func setupUI() {
        if dataForYou != nil {
            
        }
    }
    
}
