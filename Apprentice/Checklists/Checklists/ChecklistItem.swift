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
  var dueDate = NSDate()
  var shouldRemind = false
  var itemId: Int
  
  override init() {
    itemId = DataModel.nextChecklistItemId()
    print("itemId: \(itemId)")
    super.init()
  }
  
  required init?(coder aDecoder: NSCoder) {
    print("init?")
    text = aDecoder.decodeObjectForKey("Text") as! String
    checked = aDecoder.decodeBoolForKey("Checked")
    dueDate = aDecoder.decodeObjectForKey("DueDate") as! NSDate
    shouldRemind = aDecoder.decodeBoolForKey("ShouldRemind")
    itemId = aDecoder.decodeIntegerForKey("ItemId")
    
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
  func encodeWithCoder(aCoder: NSCoder) {
    print("encodeWithCoder")
    aCoder.encodeObject(text, forKey: "Text")
    aCoder.encodeBool(checked, forKey: "Checked")
    aCoder.encodeObject(dueDate, forKey: "DueDate")
    aCoder.encodeBool(shouldRemind, forKey: "ShouldRemind")
    aCoder.encodeInteger(itemId, forKey: "ItemID")
    
  }
  
}