//
//  MainserviceModel.swift
//  Cleaner App
//
//  Created by Mohamed Khaled on 10/01/2023.
//



import Foundation

// MARK: - Welcome
struct MainserviceModel: Codable {
    let status: Int
    let message: String
    let data: serviceTypesData

    enum CodingKeys: String, CodingKey {
        case status = "Status"
        case message = "Message"
        case data = "Data"
    }
}

// MARK: - DataClass
struct serviceTypesData: Codable {
    let serviceTypes: [ServiceType]

    enum CodingKeys: String, CodingKey {
        case serviceTypes = "ServiceTypes"
    }
}

// MARK: - ServiceType
struct ServiceType: Codable {
    let id: Int
    let serviceTypeNameAr, serviceTypeNameEn: String
    let mainServices: [MainService]

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case serviceTypeNameAr = "ServiceTypeNameAr"
        case serviceTypeNameEn = "ServiceTypeNameEn"
        case mainServices = "MainServices"
    }
}

// MARK: - MainService
struct MainService: Codable {
    let id, serviceTypeID: Int
    let mainServiceNameAr, mainServiceNameEn: String
    let subServices: String?

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case serviceTypeID = "ServiceTypeId"
        case mainServiceNameAr = "MainServiceNameAr"
        case mainServiceNameEn = "MainServiceNameEn"
        case subServices = "SubServices"
    }
}

