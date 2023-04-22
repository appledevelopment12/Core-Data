//
//  databaseHandler.swift
//  SearchCoreData
//
//  Created by Rajeev on 07/04/23.
//

import Foundation
import CoreData
import UIKit

class databaseHandler
{
    func saveData(roll:Int32,sname:String,sClass:String)
    {
        let appDe = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDe.persistentContainer.viewContext
        let studentObject = NSEntityDescription.insertNewObject(forEntityName: "StudentData", into: context) as! StudentData
        studentObject.rollno = roll
        studentObject.sClass = sClass
        studentObject.studentname = sname
        do
        {
            try context .save()
            print("Data has been saved in CoreData")
            
            
        }
        catch
        {
            print("Error While Saving Data")
        }
    }
    
    func searchData(sroll:Int32)->[StudentData]
    {
        var  sdata = [StudentData]()
        let appDe = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDe.persistentContainer.viewContext
        
        let fetchrequest:NSFetchRequest = StudentData.fetchRequest()
        let cpredicate = NSPredicate(format: "rollno contains %i", sroll)
        
        fetchrequest.predicate = cpredicate
        do
        {
            sdata=try (context.fetch(fetchrequest))
        }
        catch
        {
            print("Error wile fetching data")
        }
        return sdata
    }
    
    func fetchData()->[StudentData]
    {
        var cData=[StudentData]()
        let  appDe=(UIApplication.shared.delegate) as! AppDelegate
        let context=appDe.persistentContainer.viewContext
          do
          {
              cData=try context.fetch(StudentData.fetchRequest()) as! [StudentData]
              
          }
        catch
        {
            print("Error occured during fetch request")
        }
        
        return  cData
    }
}
