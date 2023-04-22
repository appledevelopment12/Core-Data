//
//  addUpdateVC.swift
//  CoreDataUpdataDelete
//
//  Created by Rajeev on 10/04/23.
//

import UIKit
import CoreData



protocol refreshBackScreen
{
    func refreshBackData()
}
class addUpdateVC: UIViewController
{
    var checkAction:String = " "
    
    @IBOutlet var txtId: UITextField!
    
    
    @IBOutlet var txtName: UITextField!
    
    @IBOutlet var txtCity: UITextField!
    
    @IBOutlet var btnAddUpdate: UIButton!
    
    @IBOutlet var txtPhone: UITextField!
    
    var delegate : refreshBackScreen!
    var empData:Student?
    override func viewDidLoad()
    {
        super.viewDidLoad()
        print("checkAction====",checkAction)
        
        if(checkAction=="Add")
        {
            btnAddUpdate.setTitle("Add", for: .normal)
        }
        else
        {
            btnAddUpdate.setTitle("Update", for: .normal)
            
            txtId.text = String(empData?.empid ?? 0)
            txtName.text = empData?.ename
            txtCity.text = empData?.empcity
            txtPhone.text = String(empData?.empPhone ?? 0)
        }

        
    }
    
    @IBAction func addAndUpdate(_ sender: UIButton)
    {
        guard  let appDelegate = UIApplication.shared.delegate as? AppDelegate else
        {return }
        let context = appDelegate.persistentContainer.viewContext
        let hn = NSEntityDescription.entity(forEntityName: "Student", in: context)
        let newUser = NSManagedObject(entity: hn!, insertInto: context)
        
        newUser.setValue(Int(txtId.text ?? ""), forKey: "empid")
        newUser.setValue(txtName.text, forKey: "ename")
        newUser.setValue(txtCity.text, forKey: "empcity")
        newUser.setValue(Int(txtPhone.text ?? ""), forKey: "empPhone")
        do
        {
            try context.save()
            delegate.refreshBackData()
            self.navigationController?.popViewController(animated: true)
        }
        catch let error  as NSError
        {
            print("error throw update")
        }
    }
    

}
