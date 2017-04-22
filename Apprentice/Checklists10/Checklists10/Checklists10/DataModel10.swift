//
//  DataModel10.swift
//  Checklists10
//
//  Created by Karsten Gresch on 11.04.17.
//  Copyright © 2017 Closure One. All rights reserved.
//

import Foundation

class DataModel10 {
  var checklist10s = [Checklist10]()
  
  var indexOfSelectedChecklist10: Int {
    get {
      return UserDefaults.standard.integer(forKey: "Checklist10Index")
    }
    set {
      UserDefaults.standard.set(newValue, forKey: "Checklist10Index")
    }
  }
  
  init() {
    loadChecklist10s()
    registerDefaults()
    handleFirstTime()
  }
  
  // Utility methods
  func documentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
  }
  
  func dataFilePath() -> URL {
    return documentsDirectory().appendingPathComponent("Checklist10.plist")
  }
  
  func saveChecklist10s() {
    print("saveChecklist10s called")
    let data = NSMutableData()
    let archiver = NSKeyedArchiver(forWritingWith: data)
    archiver.encode(checklist10s, forKey: "Checklist10s")
    archiver.finishEncoding()
    data.write(to: dataFilePath(), atomically: true)
  }
  
  func loadChecklist10s() {
    let path = dataFilePath()
    print("loadChecklist10s called for \(path)")
    if let data = try? Data(contentsOf: path) {
      let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
      checklist10s = unarchiver.decodeObject(forKey: "Checklist10s") as! [Checklist10]
      unarchiver.finishDecoding()
    }
  }
  
  func registerDefaults() {
    let dictionary: [String: Any] = ["Checklist10Index": -1,
                                     "FirstTime": true]
    UserDefaults.standard.register(defaults: dictionary)
  }
  
  func handleFirstTime() {
   let userDefaults = UserDefaults.standard
   let isFirstTime = userDefaults.bool(forKey: "FirstTime")
    
    if isFirstTime {
     let firstChecklist10 = Checklist10(name: "List")
      checklist10s.append(firstChecklist10)
      
      indexOfSelectedChecklist10 = 0
      userDefaults.set(false, forKey: "FirstTime")
      userDefaults.synchronize()
    }
    
  }
  
  func sortChecklist10s() {
    checklist10s.sort(by: { checklist101, checklist102 in return checklist101.name.localizedStandardCompare(checklist102.name) == .orderedAscending })
  }
  
}
