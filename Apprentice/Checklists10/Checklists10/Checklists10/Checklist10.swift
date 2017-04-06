//
//  Checklist10.swift
//  Checklists10
//
//  Created by Karsten Gresch on 30.03.17.
//  Copyright © 2017 Closure One. All rights reserved.
//

import UIKit

class Checklist10: NSObject {
  
  var name = ""
  var checklist10Items = [Checklist10Item]()
  // var checklist10Items: [Checklist10Item]  = []
  
  init(name: String) {
    self.name = name
    super.init()    
  }
  
}
