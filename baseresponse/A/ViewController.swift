//import UIKit
//
//class ViewController: UIViewController {
//
//    //MARK: --IBOutlet
//    @IBOutlet var collectionView: UICollectionView!
//
//
//    //MARK: --IBAction
//    @IBOutlet weak var btnList: UIBarButtonItem!
//
//
//
//    //MARK : --Vars
//    var dataSource:[Items] = []
//    private let sectionInsets = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
//    private let itemsPerRow: CGFloat = 3
//
//
//    //MARK : --View Lifecycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        loadItemProduct()
//
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let vc = segue.destination as? DetailItemViewController, let item = sender as? Items {
//            vc.dataSource = item
//        }
//    }
//
//    //MARK: --Function
//    func loadItemProduct(){
//              MGConnection.requestObject(APIRouter.getAllProducts, Items.self) { (result, error) in
//                        guard error == nil else {
//                            print("Error code : \(String(describing: error?.mErrorCode)) and Error message \(String(describing: error?.mErrorMessage))")
//                            return
//                        }
//                  self.dataSource = result!
//                self.collectionView.reloadData()
//                    }
//    }
//
//     private func showItemView(item: Items){
//           let itemVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "DetailView") as! DetailItemViewController
//        itemVC.dataSource = Items(id: item.id, title: item.title, price: item.price, url: item.url,isFavorite: item.isFavorite)
////        present(itemVC, animated: true, completion: nil)
//       }
//
//}
//
//extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource{
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return dataSource.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ItemsCollectionViewCell
//
//        let item = dataSource[indexPath.row]
//        cell.labelTitle.text = item.title
//        cell.labelPrice.text = item.price
//        let queue = DispatchQueue(label: "loadImg")
//                       queue.async {
//                           if let url = NSURL(string: item.url) {
//                               if let data = NSData(contentsOf: url as URL) {
//                                   DispatchQueue.main.async {
//                                   cell.imgView.image = UIImage(data: data as Data)
//                                   }
//                               }
//                           }
//                       }
//        return cell
//    }
//
//
//    //MARK : -- UI Collection Delegate
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let item = dataSource[indexPath.row]
//        collectionView.deselectItem(at: indexPath, animated: true)
//        showItemView(item: item)
//    }
//}
//
//extension ViewController: UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
//        let availableWidth = view.frame.width - paddingSpace
//        let withPerItem = availableWidth / itemsPerRow
//
//        return CGSize(width: withPerItem, height: withPerItem)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return sectionInsets
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return sectionInsets.left
//
//    }
//
//}
//
