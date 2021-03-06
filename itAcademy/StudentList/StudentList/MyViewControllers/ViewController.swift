//
//  ViewController.swift
//  StudentList
//
//  Created by Sergey Matveenko on 16.11.21.
//

import UIKit

protocol VCDelegate:AnyObject {
    func selectedStudent (_ student: String)
}

class ViewController: UIViewController, UISearchResultsUpdating, UISearchBarDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    weak var delegate: VCDelegate?
    
    let searchController = UISearchController (searchResultsController: ResultsViewController())
    
    var dataSourceMen = ["Aртимович Игорь Владимирович",
                         "Богданович Дмитрий Александрович",
                         "Гришин Павел Андреевич",
                         "Куклицкий Максим Сергеевич",
                         "Лапин Николай Владимирович",
                         "Малишевский Никита Валерьевич",
                         "Матвеенко Сергей Александрович",
                         "Мостовой Алексей Алексеевич",
                         "Пачковский Михаил Тадеушевич",
                         "Савков Александр Геннадьевич",
                         "Симонов Владислав Дмитриевич",
                         "Сысов Валерий Александрович"].sorted(by: {$1 > $0}) // Массив мужчины
    
    var dataSourceWomen = ["Букаренко Арина Олеговна",
                           "Елисеева Марина Михайловна",
                           "Ефименко Анастасия Владимировна",
                           "Пернацкая Алеся Юрьевна",
                           "Сандова Галина Александровна"].sorted(by: < ) // Массив женщины
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        var filDataM: [String] = []
        var filDataW: [String] = []
        
        if searchText.isEmpty == false {
            filDataM = (dataSourceMen).filter({ $0.contains(searchText) })
            filDataW = (dataSourceWomen).filter({ $0.contains(searchText) })
            sections = {[filDataM,filDataW]} ()
            
        } else {
            sections = {[dataSourceMen,dataSourceWomen]} ()
        }
        tableView.reloadData()
    }
    
    lazy var sections = {
        return [dataSourceMen,dataSourceWomen]
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
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
    } //Кол-во секций
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    } //Кол-во рядов в секциях для мужчин и женщин
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0: return "Мужчины: \(sections[section].count) человек"
        case 1: return "Женщины: \(sections[section].count) человек"
        default: break
        }
        return "\(section)"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath) as! StudentCell
        if indexPath.section == 0 {
            cell.textLabel?.text = sections[indexPath.section][indexPath.row]
        }
        if indexPath.section == 1 {
            cell.textLabel?.text = sections[indexPath.section][indexPath.row]
        }
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let name:String
        if indexPath.section == 0 {
            name = dataSourceMen[indexPath.row]
        } else {
            name = dataSourceWomen[indexPath.row]
        }
        delegate?.selectedStudent(name)
        dismiss(animated: true, completion: nil)
    }
}

