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
      return NSUserDefaults.standardUserDefaults().integerForKey("ChecklistIndex")
    }
    
    set {
      NSUserDefaults.standardUserDefaults().setInteger(newValue, forKey: "ChecklistIndex")
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
    let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
    return paths[0]
  }
  
  func dataFilePath() -> String {
    return (documentsDirectory() as NSString).stringByAppendingPathComponent("Checklists.plist")
  }
  
  func saveChecklists() {
    let data = NSMutableData()
    let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
    archiver.encodeObject(checklists, forKey: "Checklists")
    archiver.finishEncoding()
    data.writeToFile(dataFilePath(), atomically: true)
  }
  
  func loadChecklists() {
    let path = dataFilePath()
    if NSFileManager.defaultManager().fileExistsAtPath(path) {
      if let data = NSData(contentsOfFile: path) {
        let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
        checklists = unarchiver.decodeObjectForKey("Checklists") as! [Checklist]
        unarchiver.finishDecoding()
      }
    }
  }
  
  func registerDefaults() {
    let dictionary = [ "ChecklistIndex": -1, "AppRunsFirstTime": true ]
    
    NSUserDefaults.standardUserDefaults().registerDefaults(dictionary)
  }
  
  func handleFirstTimeAppStart() {
    let userDefaults = NSUserDefaults.standardUserDefaults()
    let firstTime = userDefaults.boolForKey("AppRunsFirstTime")
    if firstTime {
     let firstTimeChecklist = Checklist(name: "First Checklist")
      checklists.append(firstTimeChecklist)
      indexOfSelectedChecklist = 0
      userDefaults.setBool(false, forKey: "AppRunsFirstTime")
      userDefaults.synchronize()
    }
  }
  
  
}
