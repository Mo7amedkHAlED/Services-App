//
//  Common.swift
//  Cleaner App
//
//  Created by Mohamed Khaled on 25/12/2022.
//

import Foundation
import UIKit

let api: UsersAPIProtocol = ServiceAPI()

typealias TableView = UITableViewDelegate & UITableViewDataSource

typealias CollectionView = UICollectionViewDataSource & UICollectionViewDelegate
