//
//  Checklist.swift
//  Checklists
//
//  Created by Karsten Gresch on 13.12.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit

class Checklist: NSObject, NSCoding {
  var name = ""
  var checklistItems = [ChecklistItem]()
  
  required init?(coder aDecoder: NSCoder) {
    name = aDecoder.decodeObjectForKey("Name") as! String
    checklistItems = aDecoder.decodeObjectForKey("ChecklistItems") as! [ChecklistItem]
    super.init()
  }
  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(name, forKey: "Name")
    aCoder.encodeObject(checklistItems, forKey: "ChecklistItems")
  }
  
  init(name: String) {
    self.name = name
    super.init()
  }
  
  func countUncheckedItems() -> Int {
    return (checklistItems.filter { $0.checked == false }).count
  }
  

}
