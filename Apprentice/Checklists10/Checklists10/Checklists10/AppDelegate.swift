//
//  AppDelegate.swift
//  Checklists10
//
//  Created by Karsten Gresch on 17.10.16.
//  Copyright © 2016 Closure One. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

  let dataModel10 = DataModel10()
  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    let navigationController = window!.rootViewController as! UINavigationController
    let controller = navigationController.viewControllers[0] as! AllLists10ViewController
    controller.dataModel10 = dataModel10
    let userNotificationCenter = UNUserNotificationCenter.current()
    userNotificationCenter.requestAuthorization(options: [.alert, .sound]) {
      granted, error in
      if granted {
        print("Permission granted.")
      } else {
        print("Permission denied.")
      }
    }
    
    let notificationContent = UNMutableNotificationContent()
    notificationContent.title = "Hi Folks!"
    notificationContent.body = "Da local notification"
    notificationContent.sound = UNNotificationSound.default()
    
    let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
    let notificationRequest = UNNotificationRequest(identifier: "HiNotification", content: notificationContent, trigger: notificationTrigger)
    userNotificationCenter.add(notificationRequest)
    
    return true
  }
  
  
  func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    print("Received local notification: \(notification)")
  }

  func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    saveData()
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(_ application: UIApplication) {
    saveData()
  }
  
  func saveData() {
    dataModel10.saveChecklist10s()
  }


}

