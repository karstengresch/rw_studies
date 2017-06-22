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
  
  private lazy var StoreContainer: NSPersistentContainer {
    
  }
  
}
