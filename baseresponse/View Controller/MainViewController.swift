//
//  MainViewController.swift
//  baseresponse
//
//  Created by Le Dat on 8/17/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    //MARK: --Vars
    public var dataPromotion:[Promotion] = []
    public var dataFlashSale:[FlashSale] = []
    public var dataTrending:[Trendings] = []
    public var dataForYou:[ForYou] = []
    
    private var cellIdentifier:[String] = ["Section1TableViewCell","HeaderTableViewCell","Section2TableViewCell","Section3TableViewCell"]
    
    //MARK: --IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: --View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 1000
        tableView.register(UINib(nibName: cellIdentifier[0], bundle: nil), forCellReuseIdentifier: cellIdentifier[0])
        tableView.register(UINib(nibName: cellIdentifier[1], bundle: nil), forCellReuseIdentifier: cellIdentifier[1])
        tableView.register(UINib(nibName: cellIdentifier[2], bundle: nil), forCellReuseIdentifier: cellIdentifier[2])
        tableView.register(UINib(nibName: cellIdentifier[3], bundle: nil), forCellReuseIdentifier: cellIdentifier[3])
        
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
            self.tableView.reloadData()
        }
    }
}

extension MainViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        default:
            return 1

        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 3 {
            return CGFloat(dataForYou.count * 270)
        }
        return UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
             let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier[0], for: indexPath) as! Section1TableViewCell
             cell.loadPromotion(dataSource: dataPromotion)
             return cell
        case 1:
             let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier[1], for: indexPath) as! HeaderTableViewCell
             cell.loadFlashSale(flashSale: dataFlashSale)
             return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier[2], for: indexPath) as! Section2TableViewCell
            cell.loadTrending(dataTrending: dataTrending)
            return cell
        case 3:
             let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier[3], for: indexPath) as! Section3TableViewCell
             cell.loadForYou(dataForYou: dataForYou)
            return cell
        default:
            return UITableViewCell()

        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
}

extension MainViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
