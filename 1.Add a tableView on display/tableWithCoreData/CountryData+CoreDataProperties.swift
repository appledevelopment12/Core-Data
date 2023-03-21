//
//  CountryData+CoreDataProperties.swift
//  tableWithCoreData
//
//  Created by Rajeev on 26/02/23.
//
//

import Foundation
import CoreData


extension CountryData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CountryData> {
        return NSFetchRequest<CountryData>(entityName: "CountryData")
    }

    @NSManaged public var countryName: String?

}

extension CountryData : Identifiable {

}
