//
//  Checklist10.swift
//  Checklists10
//
//  Created by Karsten Gresch on 30.03.17.
//  Copyright © 2017 Closure One. All rights reserved.
//

import UIKit

class Checklist10: NSObject, NSCoding {
  
  var name = ""
  var checklist10Items = [Checklist10Item]()
  // var checklist10Items: [Checklist10Item]  = []
  
  init(name: String) {
    self.name = name
    super.init()    
  }
  
  required init?(coder aDecoder: NSCoder) {
    name = aDecoder.decodeObject(forKey: "Name") as! String
    checklist10Items = aDecoder.decodeObject(forKey: "Checklist10Items") as! [Checklist10Item]
  }
  
  func encode(with aCoder: NSCoder) {
    aCoder.encode(name, forKey: "Name")
    aCoder.encode(checklist10Items, forKey: "Checklist10Items")
  }
  
  func countUncheckedChecklist10Items() -> Int {
    var count = 0
    
    for checklist10Item in checklist10Items where !checklist10Item.checked {
      count += 1
    }
    
    return count
  }
  
}
