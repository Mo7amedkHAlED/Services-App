//
//  HomeViewController.swift
//  Cleaner App
//
//  Created by Mohamed Khaled on 10/01/2023.
//

import UIKit
import Alamofire
class HomeViewController: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var offersCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var userLocation: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var mainServicesCollectionView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    
    // MARK: - Make vars
    //
    var currentPage: Int = 0
    var mainServics: [ServiceType]?
    let images: [UIImage] = [UIImage(named: "10")!,UIImage(named: "14")!,UIImage(named: "13")!,UIImage(named: "12")!,UIImage(named: "11")!]
    let OffresImage: [UIImage] = [UIImage(named: "20")!,UIImage(named: "21")!,UIImage(named: "22")!]
    let OffresName: [String] = ["Cleaning Service","Carpentry Service","Electrice Service"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCollectionView()
        getMainServices()
        getUserInfo()
        pageController.numberOfPages = OffresImage.count
        
    }
    func getUserInfo (){
        let accountUser = UserDefaults.standard.string(forKey: "UserName")!
        userName.text = accountUser
//        let accountImage = UserDefaults.standard.string(forKey: "UserImage")!
//        userImage.image = UIImage(named: accountImage)
        let accountLocation = UserDefaults.standard.string(forKey: "UserLocation")!
        userLocation.text = accountLocation
    }
    
    func registerCollectionView() {
        
        offersCollectionView.register(UINib(nibName: "OffersCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OffersCollectionViewCell")
        
        mainServicesCollectionView.register(UINib(nibName: "ServiceCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ServiceCollectionViewCell")
    }
    
    private func getMainServices() {
        guard let url = URL(string: "http://apifm.alfoadia.com.sa/api/ServiceType") else { return }
        AF.request(url, method: .get,encoding: JSONEncoding.default).responseDecodable(of:MainserviceModel.self) { response in
            switch response.result {
            case .success(let data):
                self.mainServics = data.data.serviceTypes
                self.mainServicesCollectionView.reloadData()
                print("Done")
            case .failure(_):
                print("error")
            }
        }
        
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Map", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MapViewController")
        vc.modalPresentationStyle = .currentContext
        present(vc, animated: true)
    }
    
}

extension HomeViewController : CollectionView {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == mainServicesCollectionView {
            return images.count
        } else {
            return OffresName.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case mainServicesCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceCollectionViewCell", for: indexPath) as! ServiceCollectionViewCell
            cell.serviceName.text = mainServics?[indexPath.row].serviceTypeNameEn
            cell.serviceImage.image = images[indexPath.row]
            
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OffersCollectionViewCell", for: indexPath) as! OffersCollectionViewCell
            cell.offerImage.image = OffresImage[indexPath.row]
            cell.offreName.text = OffresName[indexPath.row]
            pageController.currentPage = currentPage ?? 0
            currentPage += 1
            return cell
        }
    }
}
extension HomeViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case mainServicesCollectionView:
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
            return CGSize(width: collectionView.frame.width * 0.30  , height:  collectionView.frame.width * 0.30)
        default :
            let width = collectionView.frame.width
            let height = (collectionView.frame.height)
            return CGSize(width: width, height: height)
            
        }
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageController.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }

}
