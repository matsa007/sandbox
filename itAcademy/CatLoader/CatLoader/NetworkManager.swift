//
//  NetworkManager.swift
//  CatLoader
//
//  Created by Сергей Матвеенко on 31.01.2022.
//

import Foundation
import UIKit

struct NetworkManager {
    let vc = PreviewViewController()
    var arr:Array <String> = [] {
        didSet { print(arr.count) }
    }
    var dataSource = DataSource()
    
    
    mutating func apiCall() {
        
        let apiUrl = URL(string: dataSource.apiStr)
        var request = URLRequest(url: apiUrl!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Email")
        request.httpBody = try? Data(contentsOf: apiUrl!)
        let jsonData = try? Data(contentsOf: apiUrl!)
        
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let macs = try decoder.decode([NetworkDataSource].self, from: jsonData!)
            for element in macs {
                self.arr.append(element.url!)
                print(arr)
            }
            
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    
    
}
