//
//  Checklist10Item.swift
//  Checklists10
//
//  Created by Karsten Gresch on 26.10.16.
//  Copyright © 2016 Closure One. All rights reserved.
//

import Foundation
import UserNotifications

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
    removeNotification()
    if shouldRemind && dueDate > Date() {
      let notificationContent = UNMutableNotificationContent()
      notificationContent.title = "Reminder:"
      notificationContent.body = text
      notificationContent.sound = UNNotificationSound.default()
      
      let gregorianCalendar = Calendar(identifier: .gregorian)
      let dateComponents = gregorianCalendar.dateComponents([.month, .day, .hour, .minute], from: dueDate)
      let notificationTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
      let notificationRequest = UNNotificationRequest(identifier: "\(checklist10ItemId)", content: notificationContent, trigger: notificationTrigger)
      let notificationCenter = UNUserNotificationCenter.current()
      notificationCenter.add(notificationRequest)
      
      print("Scheduled notification \(notificationRequest) for checklist10ItemId \(checklist10ItemId)")
      }
    else {
      print("Either no reminder set or date lies in the past.")
    }
  }
  
  func removeNotification(){
    let notificationCenter = UNUserNotificationCenter.current()
    notificationCenter.removeDeliveredNotifications(withIdentifiers: ["\(checklist10ItemId)"])
  }
  
  deinit {
    removeNotification()
  }
  
  
}

