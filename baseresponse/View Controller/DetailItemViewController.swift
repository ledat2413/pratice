//
//  DetailItemViewController.swift
//  baseresponse
//
//  Created by Le Dat on 8/14/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import UIKit
import JGProgressHUD

class DetailItemViewController: UIViewController {
    
    //MARK: -- IBOutlet
    @IBOutlet weak var imgViewUrl: UIImageView!
    @IBOutlet weak var labelDetailTitle: UILabel!
    @IBOutlet weak var btnaddOutlet: UIBarButtonItem!
    @IBOutlet weak var labelDetailPrice: UILabel!
    
    
    //MARK: --IBAction
    @IBAction func bntAddFavorite(_ sender: Any) {
        btnPress()
    }
    
    
    //MARK: -- Variables
    var dataSource: Items?
    var hud = JGProgressHUD()
    let data: UserDefaults = UserDefaults()
    
    //MARK: -- View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    
    //MARK: --Function
    
    private func btnPress(){
        print("Added favorite")
        hud.textLabel.text = "Add favorite list"
        hud.indicatorView = JGProgressHUDSuccessIndicatorView()
        hud.show(in: self.view)
        hud.dismiss(afterDelay: 2.0)
        data.set([Items].self, forKey: "data")
    }
    
    private func setupUI(){
        if dataSource != nil {
                    self.title = dataSource!.title
                    labelDetailTitle.text = dataSource!.title
                    labelDetailPrice.text = dataSource!.price
            let queue = DispatchQueue(label: "loadImgDetail")
            queue.async {
                if let url = NSURL(string: self.dataSource!.url ?? "") {
                    if let data = NSData(contentsOf: url as URL) {
                        DispatchQueue.main.async {
                                self.imgViewUrl.image = UIImage(data: data as Data)
                        }
                    }
                }
            }
        }
    }
}

extension DetailItemViewController: UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}




