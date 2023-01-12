//
//  LoginModel.swift
//  Cleaner App
//
//  Created by Mohamed Khaled on 06/01/2023.
//

import Foundation

// MARK: - LoginModel
struct LoginModel: Codable {
    let Status: Int
    let Message: String
    let Data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let user: User
}

// MARK: - User
struct User: Codable {
    let token: String
    let id, UserTypeId: Int
    let username, Mobile, Email: String
    let PhotoUrl: String
    let CreateDate: String
}
