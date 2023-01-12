//
//  onboardingCollectionViewCell.swift
//  Cleaner App
//
//  Created by Mohamed Khaled on 25/12/2022.
//

import UIKit

class onboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitle: UILabel!
    
    
    func setUp(_ slide: OnbardingModel){
        slideImageView.image = slide.image
        slideTitle.text = slide.title
    }
    
}
