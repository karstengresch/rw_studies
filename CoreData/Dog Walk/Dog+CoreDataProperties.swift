//
//  Dog+CoreDataProperties.swift
//  Dog Walk
//
//  Created by Karsten Gresch on 02.07.17.
//  Copyright © 2017 Razeware. All rights reserved.
//

import Foundation
import CoreData


extension Dog {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dog> {
        return NSFetchRequest<Dog>(entityName: "Dog")
    }

    @NSManaged public var attribute: NSObject?
    @NSManaged public var name: String?
    @NSManaged public var walks: NSSet?

}

// MARK: Generated accessors for walks
extension Dog {

    @objc(addWalksObject:)
    @NSManaged public func addToWalks(_ value: Walk)

    @objc(removeWalksObject:)
    @NSManaged public func removeFromWalks(_ value: Walk)

    @objc(addWalks:)
    @NSManaged public func addToWalks(_ values: NSSet)

    @objc(removeWalks:)
    @NSManaged public func removeFromWalks(_ values: NSSet)

}
