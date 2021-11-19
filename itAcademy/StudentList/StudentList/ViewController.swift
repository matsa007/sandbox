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
                         "Сысов Валерий Александрович"] // Массив мужчины
    
    var dataSourceWomen = ["Букаренко Арина Олеговна",
                           "Ефименко Анастасия Владимировна",
                           "Пернацкая Алеся Юрьевна",
                           "Сандова Галина Александровна",
                           "Елисеева Марина Михайловна"] // Массив женщины
    
    var dataSourceTotal = ["Aртимович Игорь Владимирович",
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
                            "Сысов Валерий Александрович",
                            "Букаренко Арина Олеговна",
                            "Ефименко Анастасия Владимировна",
                            "Пернацкая Алеся Юрьевна",
                            "Сандова Галина Александровна",
                            "Елисеева Марина Михайловна"] // Массив мужчины и женщины
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    } //Кол-во секций - 2
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return dataSourceMen.count
        case 1: return dataSourceWomen.count
        default: break
        }
        return dataSourceTotal.count
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
        if indexPath.row <= dataSourceMen.count {
                cell.nameLabel.text = dataSourceTotal[indexPath.row]
        }
        else {
                cell.nameLabel.text = dataSourceWomen[indexPath.row]
        }
       return cell
        }
    
}
