//
//  BasicDataResponse.swift
//  Cleaner App
//
//  Created by Mohamed Khaled on 04/01/2023.
//

import Foundation

class BasicDataResponse <T: Codable>:  Codable {
    let results: T?
    let count: Int?
}
