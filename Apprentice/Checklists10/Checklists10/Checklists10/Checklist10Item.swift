//
//  Checklist10Item.swift
//  Checklists10
//
//  Created by Karsten Gresch on 26.10.16.
//  Copyright © 2016 Closure One. All rights reserved.
//

import Foundation

class Checklist10Item: NSObject, NSCoding {
  var itemId: Int
  
  var text: String
  var checked: Bool
  
  var dueDate = Date()
  var shouldRemind = false
  
  required init?(coder aDecoder: NSCoder) {
    itemId = aDecoder.decodeInteger(forKey: "ItemId")
    text = aDecoder.decodeObject(forKey: "Text") as! String
    checked = aDecoder.decodeBool(forKey: "Checked")
    dueDate = aDecoder.decodeObject(forKey: "DueDate") as! Date
    shouldRemind = aDecoder.decodeBool(forKey: "ShouldRemind")
    super.init()
  }
  
  convenience init(text: String) {
    self.init(text: text, checked: false)
  }
  
  init(text: String, checked: Bool) {
    self.text = text
    self.checked = checked
    super.init()
  }
  
  override init() {
    itemId = DataModel10.nextChecklist10ItemId()
    
    super.init()
  }
  
  convenience override init() {
    self.init(text: "", checked: false)
  }
  
  func toggleChecked() {
    checked = !checked
  }
  
  func encode(with aCoder: NSCoder) {
    aCoder.encode(itemId, forKey: "ItemId")
    aCoder.encode(text, forKey: "Text")
    aCoder.encode(checked, forKey: "Checked")
    aCoder.encode(dueDate, forKey: "DueDate")
    aCoder.encode(shouldRemind, forKey: "ShouldRemind")
    
  }
  
  
  
}

