//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Karsten Gresch on 30.11.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject, NSCoding {
  var text = ""
  var checked = false
  var dueDate = Date()
  var shouldRemind = false
  var itemId: String
  
  override init() {
    itemId = DataModel.nextChecklistItemId()
    print("itemId: \(itemId)")
    super.init()
  }
  
  required init?(coder aDecoder: NSCoder) {
    print("init?")
    text = aDecoder.decodeObject(forKey: "Text") as! String
    checked = aDecoder.decodeBool(forKey: "Checked")
    dueDate = aDecoder.decodeObject(forKey: "DueDate") as! Date
    shouldRemind = aDecoder.decodeBool(forKey: "ShouldRemind")
    itemId = aDecoder.decodeObject(forKey: "ItemId") as! String
    
    super.init()
  }
  
  convenience init(text: String) {
    self.init(text: text, checked: false)
  }
  
  init(text: String, checked: Bool) {
    self.text = text
    self.checked = checked
    itemId = DataModel.nextChecklistItemId()
    super.init()
  }
  
  // MARK: Class methods
  func toggleChecked() {
    checked = !checked
  }
  
  // MARK: NSCoding implementations
  func encode(with aCoder: NSCoder) {
    print("encodeWithCoder")
    aCoder.encode(text, forKey: "Text")
    aCoder.encode(checked, forKey: "Checked")
    aCoder.encode(dueDate, forKey: "DueDate")
    aCoder.encode(shouldRemind, forKey: "ShouldRemind")
    aCoder.encode(itemId, forKey: "ItemId")
    
  }
  
}
