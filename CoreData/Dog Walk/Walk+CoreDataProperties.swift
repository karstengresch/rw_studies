//
//  Walk+CoreDataProperties.swift
//  Dog Walk
//
//  Created by Karsten Gresch on 02.07.17.
//  Copyright © 2017 Razeware. All rights reserved.
//

import Foundation
import CoreData


extension Walk {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Walk> {
        return NSFetchRequest<Walk>(entityName: "Walk")
    }

    @NSManaged public var walk: NSDate?
    @NSManaged public var dog: Dog?

}
