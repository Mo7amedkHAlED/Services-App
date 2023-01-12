//
//  ViewController.swift
//  Cleaner App
//
//  Created by Mohamed Khaled on 04/01/2023.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTX: UITextField!
    @IBOutlet weak var passwordTX: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

    }
    
    @IBAction func createAccount(_ sender: UIButton) {
        
        
    }
    
    @IBAction func forgetPassword(_ sender: UIButton){
        
        
    }
    
    
    @IBAction func loginPassword(_ sender: UIButton) {
        guard let userName = emailTX.text else { return }
        guard let password = passwordTX.text else { return }
        
        verifyTheInformation(userName: userName, password: password)
        
    }
    
    private func verifyTheInformation(userName: String,password: String) {
        guard let url = URL(string: "http://apifm.alfoadia.com.sa/api/Auth/login") else { return }
        let params:[String:String] = ["UserName": userName,"Password": password]
        AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default).responseDecodable(of:LoginModel.self) { response in
            switch response.result {
            case .success(let data):
                UserDefaults.standard.set(data.Data.user.token, forKey: "LoginToken")
                UserDefaults.standard.set(data.Data.user.username, forKey: "UserName")
                UserDefaults.standard.set(data.Data.user.PhotoUrl, forKey: "UserImage")
                print("Done")
                self.goToMapPage()
            case .failure(let error):
                print("error")
            }
        }
    }
    func goToMapPage (){
        let storyboard = UIStoryboard(name: "Map", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MapViewController")
        vc.modalPresentationStyle = .currentContext
        present(vc, animated: true)
    }
}
