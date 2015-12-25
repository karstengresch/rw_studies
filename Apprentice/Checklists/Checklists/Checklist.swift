//
//  Checklist.swift
//  Checklists
//
//  Created by Karsten Gresch on 13.12.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit

class Checklist: NSObject {
  var name = ""
  var checklistItems = [ChecklistItem]()
  
  init(name: String) {
    self.name = name
    super.init()
  }
  

}
