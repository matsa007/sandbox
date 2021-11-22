//
//  ViewController.swift
//  StudentList
//
//  Created by Sergey Matveenko on 16.11.21.
//

import UIKit

class ViewController: UIViewController, UISearchResultsUpdating, UISearchBarDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    let searchController = UISearchController (searchResultsController: ResultsViewController())
    
    
    var dataSourceMen = ["Aртимович Игорь Владимирович",
                         "Богданович Дмитрий Александрович",
                         "Гришин Павел Андреевич",
                         "Куклицкий Максим Сергеевич",
                         "Лапин Николай Владимирович",
                         "Малишевский Никита Валерьевич",
                         "Матвеенко Сергей Александрови",
                         "Мостовой Алексей Алексеевич",
                         "Пачковский Михаил Тадеушевич",
                         "Савков Александр Геннадьевич",
                         "Симонов Владислав Дмитриевич",
                         "Сысов Валерий Александрович"].sorted(by: {$1 > $0}) // Массив мужчины
    
    var dataSourceWomen = ["Букаренко Арина Олеговна",
                           "Елисеева Марина Михайловна",
                           "Ефименко Анастасия Владимировна",
                           "Пернацкая Алеся Юрьевна",
                           "Сандова Галина Александровна"].sorted(by: {$1 > $0}) // Массив женщины
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        var filDataM: [String] = []
        filDataM = dataSourceMen

        var filDataW: [String] = []
        filDataW = dataSourceWomen
        
        if searchText.isEmpty == false {
            filDataM = (dataSourceMen).filter({ $0.contains(searchText) })
            dataSourceMen = filDataM
            filDataW = (dataSourceWomen).filter({ $0.contains(searchText) })
            dataSourceWomen = filDataW
            
        } else {
            filDataM = dataSourceMen
            filDataW = dataSourceWomen
        }
       
        tableView.reloadData()
        
        
        
    
        
    }
    
   
    
    
    
    
    
    lazy var sections = {
        return [dataSourceMen,dataSourceWomen]
    } ()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.viewDidLoad()
       
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        
        let vc = searchController.searchResultsController as? ResultsViewController
        vc?.view.backgroundColor = nil
        
       
        print(text)
    }
}


extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    } //Кол-во секций - 2
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    } //Кол-во рядов в секциях для мужчин и женщин
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0: return "Мужчины: \(dataSourceMen.count) человек"
        case 1: return "Женщины: \(dataSourceWomen.count) человек"
        default: break
        }
        return "\(section)"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath) as! StudentCell
        if indexPath.section == 0{
            cell.textLabel?.text = sections[indexPath.section][indexPath.row]
                }
        if indexPath.section == 1{
            cell.textLabel?.text = sections[indexPath.section][indexPath.row]
                }
        return cell
        }
    
    
}



