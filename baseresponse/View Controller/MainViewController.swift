//
//  MainViewController.swift
//  baseresponse
//
//  Created by Le Dat on 8/17/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    
    //MARK: --IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "Section1TableViewCell", bundle: nil), forCellReuseIdentifier: "Section1TableViewCell")
        tableView.register(UINib(nibName: "HeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "HeaderTableViewCell")
        tableView.register(UINib(nibName: "Section2TableViewCell", bundle: nil), forCellReuseIdentifier: "Section2TableViewCell")
        tableView.register(UINib(nibName: "Section3TableViewCell", bundle: nil), forCellReuseIdentifier: "Section3TableViewCell")
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
        switch indexPath.row {
        case 0:
            return 230
        case 1:
            return 230
        case 2:
            return 230
        case 3:
            return 230
        default:
            return 0
        }
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
             let cell = tableView.dequeueReusableCell(withIdentifier: "Section1TableViewCell", for: indexPath) as! Section1TableViewCell
             return cell
            
        case 1:
             let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell", for: indexPath) as! HeaderTableViewCell
             return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Section2TableViewCell", for: indexPath) as! Section2TableViewCell
            return cell
        case 3:
             let cell = tableView.dequeueReusableCell(withIdentifier: "Section3TableViewCell", for: indexPath) as! Section3TableViewCell
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
