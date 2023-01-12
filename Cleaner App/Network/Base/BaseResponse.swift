//
//  BaseResponse.swift
//  Cleaner App
//
//  Created by Mohamed Khaled on 04/01/2023.
//

import Foundation


class BaseResponse<T: Codable>: Codable {
    var data: BasicDataResponse<T>?
    var code: Int?
}
