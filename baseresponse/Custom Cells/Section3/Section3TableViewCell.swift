//
//  Section3TableViewCell.swift
//  baseresponse
//
//  Created by Le Dat on 8/19/20.
//  Copyright © 2020 Le Dat. All rights reserved.
//

import UIKit

class Section3TableViewCell: UITableViewCell {
    
    //MARK: --IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: --Vars
    var dataForYou:[ForYou] = []
    private let cellIdentifier = "Section3CollectionViewCell"
    private let viewControllerIdentifier = "DetailViewController"
    
    
    //MARK: --View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = false
        collectionView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        loadForYou(dataForYou: dataForYou)
    }
    
    //MARK: --Navigation Segue
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let forYouDetailVC = segue.destination as? DetailViewController, let forYou = sender as? ForYou {
            forYouDetailVC.dataForYou = forYou
        }
    }

    private func showDetailView(forYou: ForYou){
        let detailForYouVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: viewControllerIdentifier) as! DetailViewController
        detailForYouVC.dataForYou = ForYou(itemRatingScore: forYou.itemRatingScore, brandID: forYou.brandID, currency: forYou.currency, id: forYou.id, shopID: forYou.shopID, itemImg: forYou.itemImg, itemTitle: forYou.itemTitle, categoryID: forYou.categoryID, itemDiscountPrice: forYou.itemDiscountPrice, itemPrice: forYou.itemPrice, itemID: forYou.itemID, itemDiscount: forYou.itemDiscount, itemURL: forYou.itemURL, skuID: forYou.skuID)
//        present(detailForYouVC,animated: true,completion: nil)
    }

    //MARK: --Load Data
    func loadForYou(dataForYou:[ForYou]){
        self.dataForYou = dataForYou
        collectionView.reloadData()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension Section3TableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let forYou = dataForYou[indexPath.row]
        collectionView.deselectItem(at: indexPath, animated: true)
        showDetailView(forYou: forYou)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataForYou.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? Section3CollectionViewCell else { fatalError() }
        
        let forYou = dataForYou[indexPath.row]
        cell.thumbnailImageView.sd_setImage(with: URL(string: forYou.itemImg), placeholderImage: UIImage(systemName: "heart"))
        cell.thumbnailTitleLabel.text = forYou.itemTitle
        cell.thumbnailNewPriceLabel.text = forYou.itemDiscountPrice
        cell.thumbnailOldPriceLabel.text = forYou.itemPrice
        cell.thumbnailPercenLabel.text = forYou.itemDiscount
        cell.thumbnailRatingLabel.text = "(\(forYou.itemRatingScore))"
        
        switch Double(forYou.itemRatingScore) {
        case 0:
            cell.star1Button.setImage(UIImage(systemName: "star"), for: .normal)
            cell.star2Button.setImage(UIImage(systemName: "star"), for: .normal)
            cell.star3Button.setImage(UIImage(systemName: "star"), for: .normal)
            cell.star4Button.setImage(UIImage(systemName: "star"), for: .normal)
            cell.star5Button.setImage(UIImage(systemName: "star"), for: .normal)
        case 1:
            cell.star1Button.setImage(UIImage(systemName: "star.fill"), for: .normal)
            cell.star2Button.setImage(UIImage(systemName: "star"), for: .normal)
            cell.star3Button.setImage(UIImage(systemName: "star"), for: .normal)
            cell.star4Button.setImage(UIImage(systemName: "star"), for: .normal)
            cell.star5Button.setImage(UIImage(systemName: "star"), for: .normal)
        case 2:
            cell.star1Button.setImage(UIImage(systemName: "star.fill"), for: .normal)
            cell.star2Button.setImage(UIImage(systemName: "star.fill"), for: .normal)
            cell.star3Button.setImage(UIImage(systemName: "star"), for: .normal)
            cell.star4Button.setImage(UIImage(systemName: "star"), for: .normal)
            cell.star5Button.setImage(UIImage(systemName: "star"), for: .normal)
        case 3:
            cell.star1Button.setImage(UIImage(systemName: "star.fill"), for: .normal)
            cell.star2Button.setImage(UIImage(systemName: "star.fill"), for: .normal)
            cell.star3Button.setImage(UIImage(systemName: "star.fill"), for: .normal)
            cell.star4Button.setImage(UIImage(systemName: "star"), for: .normal)
            cell.star5Button.setImage(UIImage(systemName: "star"), for: .normal)
        case 4:
            cell.star1Button.setImage(UIImage(systemName: "star.fill"), for: .normal)
            cell.star2Button.setImage(UIImage(systemName: "star.fill"), for: .normal)
            cell.star3Button.setImage(UIImage(systemName: "star.fill"), for: .normal)
            cell.star4Button.setImage(UIImage(systemName: "star.fill"), for: .normal)
            cell.star5Button.setImage(UIImage(systemName: "star"), for: .normal)
        case 4.5:
            cell.star1Button.setImage(UIImage(systemName: "star.fill"), for: .normal)
            cell.star2Button.setImage(UIImage(systemName: "star.fill"), for: .normal)
            cell.star3Button.setImage(UIImage(systemName: "star.fill"), for: .normal)
            cell.star4Button.setImage(UIImage(systemName: "star.fill"), for: .normal)
            cell.star5Button.setImage(UIImage(systemName: "star.fill"), for: .normal)
        case 5:
            cell.star1Button.setImage(UIImage(systemName: "star.fill"), for: .normal)
            cell.star2Button.setImage(UIImage(systemName: "star.fill"), for: .normal)
            cell.star3Button.setImage(UIImage(systemName: "star.fill"), for: .normal)
            cell.star4Button.setImage(UIImage(systemName: "star.fill"), for: .normal)
            cell.star5Button.setImage(UIImage(systemName: "star.fill"), for: .normal)
            
        default:
            return UICollectionViewCell()
        }
        return cell
    }
    
}

extension Section3TableViewCell: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width:(self.frame.width/2) - 20, height: 260)
    }
    
}
