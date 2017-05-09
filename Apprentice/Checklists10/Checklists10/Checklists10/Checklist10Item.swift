//
//  Checklist10Item.swift
//  Checklists10
//
//  Created by Karsten Gresch on 26.10.16.
//  Copyright © 2016 Closure One. All rights reserved.
//

import Foundation

class Checklist10Item: NSObject, NSCoding {
  var text: String
  var checked: Bool
  
  required init(coder aDecoder: NSCoder) {
    text = aDecoder.decodeObject(forKey: "Text") as! String
    checked = aDecoder.decodeBool(forKey: "Checked")
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
  
  override convenience init() {
    self.init(text: "", checked: false)
  }
  
  func toggleChecked() {
    checked = !checked
  }
  
  func encode(with aCoder: NSCoder) {
    aCoder.encode(text, forKey: "Text")
    aCoder.encode(checked, forKey: "Checked")
  }
  
  
  
}

