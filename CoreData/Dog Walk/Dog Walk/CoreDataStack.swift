//
//  CoreDataStack.swift
//  Dog Walk
//
//  Created by Karsten Gresch on 21.06.17.
//  Copyright © 2017 Razeware. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
  
  private let modelName: String
  
  init(modelName: String) {
    self.modelName = modelName
  }

  lazy var managedContext: NSManagedObjectContext = {
    return self.storeContainer.viewContext
  } ()
  
  private lazy var storeContainer: NSPersistentContainer = {
    print("Model name is: \(self.modelName)")
    let container = NSPersistentContainer(name: self.modelName)
    
    container.loadPersistentStores { (storeDescription, error) in
    if let error = error as NSError?
    {
      print("Unresolved error: \(error.userInfo), \(error.userInfo)") }
    }
      return container
    } ()
  
  func saveContext() {
    guard managedContext.hasChanges else { return }
    
    do {
      try managedContext.save()
    } catch let error as NSError {
      print("Unresolved error: \(error.userInfo), \(error.userInfo)")
    }
  }
  
  }

