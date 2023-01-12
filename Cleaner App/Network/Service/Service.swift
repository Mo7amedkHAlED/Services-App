//
//  Service.swift
//  Cleaner App
//
//  Created by Mohamed Khaled on 04/01/2023.
//

import Foundation
import Alamofire

enum Service {
    case login 

}
extension Service : TargetType {
    // This is the base URL we'll be using, typically our server.
    var baseURL: String {
        let serverURL = "http://apifm.alfoadia.com.sa/api/Auth/"
        guard let url = URL(string: serverURL) else { fatalError("wrong baseURL in Route") }
        let urlString: String = "\(url)"
        return urlString
    }
    
    // This is the path of each operation that will be appended to our base URL.
    var path: String {
        switch self {
        case .login:
            return "login"
        }
    }
    
    // Here we specify which method our calls should use.
    var method: HTTPMethod {
        switch self {
        case .login :
            return .post
        }
    }
    
    // Here we specify body parameters, objects, files etc.
    // or just do a plain request without a body.
    var task: Task {
        switch self {
        case .login :
            return .requestPlain
        }
    }
    
    // These are the headers that our service requires.
    var headers: [String: String]? {
        return ["accept": "application/json"]
    }
    
    // This is sample return data that you can use to mock and test your services,
    var sampleData: Data {
        return Data()
    }
}
