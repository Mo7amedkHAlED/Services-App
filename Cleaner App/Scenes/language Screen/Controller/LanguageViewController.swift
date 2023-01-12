//
//  LanguageViewController.swift
//  Cleaner App
//
//  Created by Mohamed Khaled on 25/12/2022.
//

import UIKit

class LanguageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func arButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
        vc.modalPresentationStyle = .currentContext
        present(vc, animated: true)
    }
    
    @IBAction func enButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
        vc.modalPresentationStyle = .currentContext
        present(vc, animated: true)
    }
    

}
