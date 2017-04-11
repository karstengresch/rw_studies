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
  
  
  
  
  // Utility methods
  func documentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
  }
  
  
  func dataFilePath() -> URL {
    return documentsDirectory().appendingPathComponent("Checklist10.plist")
  }
  
  
  func saveChecklist10s() {
    let data = NSMutableData()
    let archiver = NSKeyedArchiver(forWritingWith: data)
    archiver.encode(checklist10s, forKey: "Checklist10s")
    archiver.finishEncoding()
    data.write(to: dataFilePath(), atomically: true)
  }
  
  func loadChecklist10s() {
    let path = dataFilePath()
    if let data = try? Data(contentsOf: path) {
      let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
      checklist10s = unarchiver.decodeObject(forKey: "Checklist10s") as! [Checklist10]
      unarchiver.finishDecoding()
    }
  }
  
}
