//
//  FavoriteListViewController.swift
//  baseresponse
//
//  Created by Le Dat on 8/26/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import UIKit
import RealmSwift

class FavoriteListViewController: UIViewController {
    
    //MARK: --Vars
    var cellIdentifier = "FavoriteCollectionViewCell"
    let realm = try! Realm()
    var favorite: Results<ForYou>{
        get {return realm.objects(ForYou.self)}
    }
    
    //MARK: --IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: --View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }
    
    //MARK: --Func
    private func showItemView(withItem forYou: ForYou){
        let itemVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        itemVC.dataForYou = forYou
        self.navigationController?.pushViewController(itemVC, animated: true)
    }
}

extension FavoriteListViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let item = favorite[indexPath.row]
        try! self.realm.write({
            self.realm.delete(item)
        })
        collectionView.deleteItems(at: [indexPath])
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = favorite[indexPath.row]
        try! self.realm.write({
            if (item.isFavorite == false){
                item.isFavorite = true
            }
        })
        collectionView.reloadItems(at: [indexPath])
        showItemView(withItem: item)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favorite.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? FavoriteCollectionViewCell else {fatalError()}
        let data = favorite[indexPath.row]
        cell.loadData(data: data)
        return cell
    }
}

extension FavoriteListViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width)/2 - 10, height: 260)
    }
}
