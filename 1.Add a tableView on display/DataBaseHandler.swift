//
//  DataBaseHandler.swift
//  tableWithCoreData
//
//  Created by Rajeev on 26/02/23.
//

import Foundation
import CoreData
import UIKit

class DataBaseHandler
{
    func saveData(cName:String)
    {
        let appDe=(UIApplication.shared.delegate) as! AppDelegate
        let context=appDe.persistentContainer.viewContext
        let countryObject = NSEntityDescription.insertNewObject(forEntityName: "CountryData", into: context) as! CountryData
        countryObject.countryName=cName
        
        do
        {
            try context.save()
            print("Data has been saved")
            
        }
        catch{
            print("Error has been occured durinfg save data ")
        }
        
        
    }
    func fetchData() -> [CountryData]
    {
        
        var cData=[CountryData]()
        let  appDe=(UIApplication.shared.delegate) as! AppDelegate
        let context=appDe.persistentContainer.viewContext
          do
          {
              cData=try context.fetch(CountryData.fetchRequest()) as! [CountryData]
              
          }
        catch
        {
            print("Error occured during fetch request")
        }
        
        return  cData
    }
    
}
