//
//  DataSource.swift
//  CatLoader
//
//  Created by Сергей Матвеенко on 23.01.2022.
//

import Foundation
import UIKit


struct DataSource {
    let urlStr = "https://gidonline.io/img/87e38a1e4_200x300.jpg"
    let apiStr = "https://api.thecatapi.com/v1/images/search"
}

struct NetworkDataSource:Codable {
    let id:String?
    let url:String?
    let breed:String?
}


