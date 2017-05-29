//
//  Checklist10Item.swift
//  Checklists10
//
//  Created by Karsten Gresch on 26.10.16.
//  Copyright © 2016 Closure One. All rights reserved.
//

import Foundation

class Checklist10Item: NSObject, NSCoding {
  var checklist10ItemId: Int
  
  var text = ""
  var checked = false
  
  var dueDate = Date()
  var shouldRemind = false
  
  
  override init() {
    checklist10ItemId = DataModel10.nextChecklist10ItemId()
    super.init()
  }
  
  required init?(coder aDecoder: NSCoder) {
    checklist10ItemId = aDecoder.decodeInteger(forKey: "Checklist10ItemId")
    text = aDecoder.decodeObject(forKey: "Text") as! String
    checked = aDecoder.decodeBool(forKey: "Checked")
    dueDate = aDecoder.decodeObject(forKey: "DueDate") as! Date
    shouldRemind = aDecoder.decodeBool(forKey: "ShouldRemind")
    super.init()
  }
  
  func toggleChecked() {
    checked = !checked
  }
  
  func encode(with aCoder: NSCoder) {
    aCoder.encode(checklist10ItemId, forKey: "Checklist10ItemId")
    aCoder.encode(text, forKey: "Text")
    aCoder.encode(checked, forKey: "Checked")
    aCoder.encode(dueDate, forKey: "DueDate")
    aCoder.encode(shouldRemind, forKey: "ShouldRemind")
  }
  
  func scheduleNotification() {
    if shouldRemind && dueDate > Date() {
      print("TO DO: Schedule a notification")
    }
    else {
      print("Either no reminder set or date lies in the past.")
    }
  }
  
  
}

