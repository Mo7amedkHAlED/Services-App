//
//  ServiceCollectionViewCell.swift
//  Cleaner App
//
//  Created by Mohamed Khaled on 09/01/2023.
//

import UIKit

class ServiceCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var serviceName: UILabel!
    @IBOutlet weak var serviceImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
//    func configureCell(serviceData: ServiceType) {
//        serviceName.text = serviceData.serviceTypeNameEn
//        
//    }

}
