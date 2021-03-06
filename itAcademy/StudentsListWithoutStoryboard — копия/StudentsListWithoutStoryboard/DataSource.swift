//
//  File.swift
//  StudentsListWithoutStoryboard
//
//  Created by Сергей Матвеенко on 04.12.2021.
//

import Foundation

struct Student {
    let name: String
    let phone: String
    let githubURL: String
}
    
struct DataSource {
    static let menArray =
        ["Богданов",
         "Гришин Павел Андреевич",
         "Куклицкий Максим Сергеевич",
         "Лапин Николай Владимирович",
         "Малишевский Никита Валерьевич",
         "Матвеенко Сергей Александрович",
         "Мостовой Алексей Алексеевич",
         "Пачковский Михаил Тадеушевич",
         "Савков Александр Геннадьевич",
         "Симонов Владислав Дмитриевич",
         "Сысов Валерий Александрович",
         "Артимович Игорь Владимирович"
        ].sorted()

    
    static let womenArray = ["Букаренко Арина Олеговна",
                             "Ефименко Анастасия Владимировна",
                             "Пернацкая Алеся Юрьевна",
                             "Сандова Галина Александровна",
                             "Елисеева Марина Михайловна"
    ].sorted()
}
