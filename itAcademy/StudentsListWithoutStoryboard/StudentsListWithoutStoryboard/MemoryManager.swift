//
//  MemoryManager.swift
//  StudentsListWithoutStoryboard
//
//  Created by Сергей Матвеенко on 07.12.2021.
//

import Foundation

class Memory {
    
    let userDefaults = UserDefaults.standard
    
    func saveData (menList: [String]?, womenList: [String]?) {
        saveMenList(menList)
        saveWomenList(womenList)
    }
    
    private func saveMenList (_ menList: [String]?) {
        userDefaults.set(menList, forKey: "MenList")
    }
    private func saveWomenList (_ womenList: [String]?) {
        userDefaults.set(womenList, forKey: "WomenList")
    }
    
    func loadMen () -> [String] {
        if let menList = userDefaults.array(forKey: "MenList") as? [String] {
            return menList
        } else {
            return []
        }
    }
    
    func loadWomen () -> [String] {
        if let womenList = userDefaults.array(forKey: "WomenList") as? [String] {
            return womenList
        } else {
            return []
        }
    }
}
