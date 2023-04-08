//
//  ChildrenData+CoreDataProperties.swift
//  saveAndFetchData
//
//  Created by Rajeev on 08/04/23.
//
//

import Foundation
import CoreData


extension ChildrenData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ChildrenData>
    {
        return NSFetchRequest<ChildrenData>(entityName: "ChildrenData")
    }

    @NSManaged public var childName: String?

}

extension ChildrenData : Identifiable {

}
