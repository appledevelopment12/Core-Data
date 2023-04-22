//
//  StudentData+CoreDataProperties.swift
//  SearchCoreData
//
//  Created by Rajeev on 07/04/23.
//
//

import Foundation
import CoreData


extension StudentData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StudentData> {
        return NSFetchRequest<StudentData>(entityName: "StudentData")
    }

    @NSManaged public var rollno: Int32
    @NSManaged public var studentname: String?
    @NSManaged public var sClass: String?

}

extension StudentData : Identifiable {

}
