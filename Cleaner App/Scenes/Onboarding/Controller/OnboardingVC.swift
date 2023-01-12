//
//  OnboardingVC.swift
//  Cleaner App
//
//  Created by Mohamed Khaled on 25/12/2022.
//

import UIKit

class OnboardingVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    
    var slides :[OnbardingModel] = []
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides .count - 1 {
                nextButton.setTitle("Get Started", for: .normal)
            } else {
                nextButton .setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        slides = [OnbardingModel(title: "Choose the service you want Choose all the services you want and add themto your basket", image: UIImage(named: "3")!),OnbardingModel(title: "Discover our services We provide you with all kinds of maintenance, cleaning, sterilization and other services", image: UIImage(named: "2")!),OnbardingModel(title: "Choose the service you want Choose all the services you want and add themto your basket", image: UIImage(named: "1")!)]
        
        pageControl.numberOfPages = slides.count

    }
    
    
    @IBAction func nextButtonClick(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            let storyboard = UIStoryboard(name: "language", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "LanguageViewController")
            vc.modalPresentationStyle = .currentContext
            UserDefaults.standard.hasOnboarded = true
            self.definesPresentationContext = true
            present(vc, animated: true)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}

extension OnboardingVC : CollectionView {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "onboardingCollectionViewCell", for: indexPath) as! onboardingCollectionViewCell
        cell.setUp(slides[indexPath.row])
        collectionView.reloadData()
        return cell
    }
    
    
}
extension OnboardingVC : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let width = scrollView.frame.width
            currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
        }
}
