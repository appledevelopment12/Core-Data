//
//  Student+CoreDataProperties.swift
//  CoreDataUpdataDelete
//
//  Created by Rajeev on 10/04/23.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var empid: Int32
    @NSManaged public var empPhone: Int64
    @NSManaged public var empcity: String?
    @NSManaged public var ename: String?

}

extension Student : Identifiable {

}
