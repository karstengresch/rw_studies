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
  
  override init() {
    super.init()
  }
  
  required init?(coder aDecoder: NSCoder) {
    
    text = aDecoder.decodeObjectForKey("Text") as! String
    checked = aDecoder.decodeBoolForKey("Checked")
    
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
  
  // MARK: Class methods
  func toggleChecked() {
    checked = !checked
  }
  
  // MARK: NSCoding implementations
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(text, forKey: "Text")
    aCoder.encodeBool(checked, forKey: "Checked")
  }
  
}