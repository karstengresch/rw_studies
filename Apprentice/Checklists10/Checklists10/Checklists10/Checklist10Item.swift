//
//  Checklist10Item.swift
//  Checklists10
//
//  Created by Karsten Gresch on 26.10.16.
//  Copyright © 2016 Closure One. All rights reserved.
//

import Foundation

class Checklist10Item: NSObject, NSCoding {
  var text = ""
  var checked = false
  
  required init(coder aDecoder: NSCoder) {
    super.init()
  }
  
  override init() {
    super.init()  
  }
  
  func toggleChecked() {
    checked = !checked
  }
  
  func encode(with aCoder: NSCoder) {
    aCoder.encode(text, forKey: "Text")
    aCoder.encode(checked, forKey: "Checked")
  }
  
  
  
}

