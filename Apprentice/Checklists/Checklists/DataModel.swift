//
//  DataModel.swift
//  Checklists
//
//  Created by Karsten Gresch on 28.12.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import Foundation

class DataModel {
  var checklists = [Checklist]()
  
  var indexOfSelectedChecklist: Int {
    
    get {
      return UserDefaults.standard.integer(forKey: "ChecklistIndex")
    }
    
    set {
      UserDefaults.standard.set(newValue, forKey: "ChecklistIndex")
    }
    
    
  }
  
  init() {
    print("Data file path is \(dataFilePath())")
    loadChecklists()
    registerDefaults()
    handleFirstTimeAppStart()
  }
  
  // MARK: File related
  func documentsDirectory() -> String {
    let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    return paths[0]
  }
  
  func dataFilePath() -> String {
    return (documentsDirectory() as NSString).appendingPathComponent("Checklists.plist")
  }
  
  func saveChecklists() {
    let data = NSMutableData()
    let archiver = NSKeyedArchiver(forWritingWith: data)
    archiver.encode(checklists, forKey: "Checklists")
    archiver.finishEncoding()
    data.write(toFile: dataFilePath(), atomically: true)
  }
  
  func loadChecklists() {
    print("loading Checklist")
    let path = dataFilePath()
    if FileManager.default.fileExists(atPath: path) {
      if let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
        let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
        checklists = unarchiver.decodeObject(forKey: "Checklists") as! [Checklist]
        unarchiver.finishDecoding()
        sortChecklists()
      }
    }
  }
  
  func sortChecklists() {
    print("sorting Checklist")
    checklists.sort(
      by: {
        checklist1, checklist2 in
        return checklist1.name.localizedStandardCompare(checklist2.name) == .orderedAscending
      })
  }
  
  func analyzeChecklist(_ checklists: [Checklist]) {
    checklists.forEach { print("Checklist name: \($0.name) - Items: \($0.checklistItems.count)" )}
  }
  
  func registerDefaults() {
    let dictionary = [ "ChecklistIndex": -1,
                       "AppRunsFirstTime": true,
                       "ChecklistItemId": 0 ] as [String : Any]
    
    UserDefaults.standard.register(defaults: dictionary)
  }
  
  func handleFirstTimeAppStart() {
    print("starting handleFirstTimeAppStart")
    let userDefaults = UserDefaults.standard
    let firstTime = userDefaults.bool(forKey: "AppRunsFirstTime")
    if firstTime {
     print("Running first time!")
     let firstTimeChecklist = Checklist(name: "First Checklist")
      checklists.append(firstTimeChecklist)
      indexOfSelectedChecklist = 0
      userDefaults.set(false, forKey: "AppRunsFirstTime")
      userDefaults.synchronize()
    }
  }
  
  class func nextChecklistItemId() -> Int {
    let userDefaults = UserDefaults.standard
    let checklistItemId = userDefaults.integer(forKey: "ChecklistItemId")
    userDefaults.set(checklistItemId + 1, forKey: "ChecklistItemId")
    userDefaults.synchronize()
    return checklistItemId
  }
  
}
