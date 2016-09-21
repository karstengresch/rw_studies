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
    name = aDecoder.decodeObject(forKey: "Name") as! String
    iconName = aDecoder.decodeObject(forKey: "IconName") as! String
    checklistItems = aDecoder.decodeObject(forKey: "ChecklistItems") as! [ChecklistItem]
    super.init()
  }

  
  convenience init(name: String) {
    self.init(name: name, iconName: "No Icon")
  }
  
  init(name: String, iconName: String) {
    self.name = name
    self.iconName = iconName
    super.init()
  }
  
  func encode(with aCoder: NSCoder) {
    aCoder.encode(name, forKey: "Name")
        aCoder.encode(iconName, forKey: "IconName")
    aCoder.encode(checklistItems, forKey: "ChecklistItems")
  }

  
  func countUncheckedItems() -> Int {
    return (checklistItems.filter { $0.checked == false }).count
  }
  

}
