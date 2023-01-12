//
//  asfs.swift
//  Cleaner App
//
//  Created by Mohamed Khaled on 08/01/2023.
//

import Foundation
import UIKit

func showAlert (message: String) {
    let alertController = UIAlertController(title: "Confirm", message: message,preferredStyle: UIAlertController.Style.alert)
    let okAction = UIAlertAction(title: "OK", style: .default)
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
    
    // Add the actions
    alertController.addAction(okAction)
    alertController.addAction(cancelAction)
    
    // Present the controller
//    present(alertController, animated: true, completion: nil)
}
