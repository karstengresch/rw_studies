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
  var iconName: String
  var checklistItems = [ChecklistItem]()
  
  required init?(coder aDecoder: NSCoder) {
    name = aDecoder.decodeObjectForKey("Name") as! String
    iconName = aDecoder.decodeObjectForKey("IconName") as! String
    checklistItems = aDecoder.decodeObjectForKey("ChecklistItems") as! [ChecklistItem]
    super.init()
  }
  
  init(name: String, iconName: String) {
    self.name = name
    self.iconName = iconName
    super.init()
  }
  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(name, forKey: "Name")
        aCoder.encodeObject(iconName, forKey: "IconName")
    aCoder.encodeObject(checklistItems, forKey: "ChecklistItems")
  }
  
  init(name: String) {
    self.name = name
    iconName = "No Icon"
    super.init()
  }
  
  func countUncheckedItems() -> Int {
    return (checklistItems.filter { $0.checked == false }).count
  }
  

}
