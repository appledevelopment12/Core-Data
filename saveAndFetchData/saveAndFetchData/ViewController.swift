//
//  ViewController.swift
//  saveAndFetchData
//
//  Created by Rajeev on 08/04/23.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    
    
    @IBOutlet var myText: UITextField!
    
    
    //var cDATA = [ChildrenData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addNewChildren(_ sender: UIButton)
    {
        let appDe = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDe.persistentContainer.viewContext
        let childData = NSEntityDescription.insertNewObject(forEntityName: "ChildrenData", into: context) as! ChildrenData
        childData.childName = myText.text
        do
        {
            try context.save()
            print("Data Has Been While Saved Successfully")
            myText.text = " "
        }
        catch
        {
            print("Error Occured While Saving Data")
        }
    }
    
    @IBAction func fetchClickData(_ sender: UIButton)
    {
        let appDe = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDe.persistentContainer.viewContext
        do
        {
            let cData =  try context.fetch(ChildrenData.fetchRequest()) as! [ChildrenData]
            print("Data has fetched successfuly")
            for childObject in cData
            {
                print(childObject.childName!)
            }
        }
        catch
        {
            print("Error Occured While Fetching Data")
        }
    }
    
    
}

