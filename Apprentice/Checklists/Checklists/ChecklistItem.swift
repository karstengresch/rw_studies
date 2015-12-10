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
  
  func toggleChecked() {
    checked = !checked
  }
  
  // MARK: NSCoding implementations
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(text, forKey: "Text")
    aCoder.encodeObject(checked, forKey: "Checked")
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init()
  }
  
  
}