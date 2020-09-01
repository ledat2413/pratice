//
//  HomeViewController.swift
//  baseresponse
//
//  Created by Le Dat on 8/25/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController {
    
    
    //MARK: --Vars
    
    public var dataPromotion:[Promotion] = []
    
    public var dataFlashSale:[FlashSale] = []
    
    public var dataTrending:[Trendings] = []
    
    public var dataForYou:[ForYou] = []
    
    var forYouCallBack: ((_ forYou: ForYou) -> Void)?
    
    
    private var cellIdentifier = ["Sec0CollectionViewCell","Sec1CollectionViewCell","Sec2CollectionViewCell","Sec3CollectionViewCell"]
    
    //MARK: --IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: --View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        
        collectionView.dataSource = self
        
        connectNib()
        
        fetchAllHomeData()
    }
    
    //MARK: --Func
    public func fetchAllHomeData(){
        MGConnection.requestObject(APIRouter.getAllHomeData, Data.self) { (result, error) in
            guard error == nil else {
                print("Error code \(String(describing: error?.mErrorCode)) and Error message \(String(describing: error?.mErrorMessage))")
                return
            }
            if let result = result {
                self.dataPromotion = result.promotion
                
                self.dataFlashSale = result.flashSale
                
                self.dataTrending = result.trending
                
                self.dataForYou = result.foryou
            }
            self.collectionView.reloadData()
        }
    }
    
    func connectNib() {
        collectionView.register(UINib(nibName: cellIdentifier[0], bundle: nil), forCellWithReuseIdentifier: cellIdentifier[0])
        
        collectionView.register(UINib(nibName: cellIdentifier[1], bundle: nil), forCellWithReuseIdentifier: cellIdentifier[1])
        
        collectionView.register(UINib(nibName: cellIdentifier[2], bundle: nil), forCellWithReuseIdentifier: cellIdentifier[2])
        
        collectionView.register(UINib(nibName: cellIdentifier[3], bundle: nil), forCellWithReuseIdentifier: cellIdentifier[3])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailViewController, let forYou = sender as? ForYou {
            vc.dataForYou = forYou
        }
    }
    private func showDetail(forYou: ForYou){
        let itemVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        itemVC.dataForYou = forYou
        self.navigationController?.pushViewController(itemVC, animated: true)
    }
    
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 3 {
            let forYou = dataForYou[indexPath.row]
            collectionView.deselectItem(at: indexPath, animated: true)
            showDetail(forYou: forYou)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        case 3:
            return dataForYou.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier[0], for: indexPath) as! Sec0CollectionViewCell
            
            cell.loadPromotion(dataSource: dataPromotion)
            
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier[1], for: indexPath) as! Sec1CollectionViewCell
            
            cell.loadFlashSale(flashSale: dataFlashSale)
            
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier[2], for: indexPath) as! Sec2CollectionViewCell
            
            cell.loadDataTrending(dataTrending: dataTrending)
            
            return cell
        case 3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier[3], for: indexPath) as? Sec3CollectionViewCell else{
                fatalError()
            }
            
            cell.loadData(forYou: dataForYou[indexPath.row])
            
            return cell
            
        default:
            return UICollectionViewCell()
        }
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.section {
        case 0:
            return CGSize(width: collectionView.frame.width, height: 300)
        case 1:
            return CGSize(width: collectionView.frame.width, height: 250)
        case 2:
            return CGSize(width: collectionView.frame.width, height: 250)
        case 3:
            return CGSize(width: (collectionView.frame.width)/2 - 10, height: 270)
        default:
            return CGSize()
        }
    }
}
