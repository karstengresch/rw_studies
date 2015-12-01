//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Karsten Gresch on 30.11.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import Foundation

class ChecklistItem {
  var text = ""
  var checked = false
  
  func toggleChecked() {
    checked = !checked
  }
}