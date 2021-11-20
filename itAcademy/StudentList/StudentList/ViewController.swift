//
//  ViewController.swift
//  StudentList
//
//  Created by Sergey Matveenko on 16.11.21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
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
    
    lazy var sections = {
        return [dataSourceMen,dataSourceWomen]
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
