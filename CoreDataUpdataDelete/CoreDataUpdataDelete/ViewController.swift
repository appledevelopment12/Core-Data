//
//  ViewController.swift
//  CoreDataUpdataDelete
//
//  Created by Rajeev on 10/04/23.
//

import UIKit
import CoreData
class ViewController: UIViewController,refreshBackScreen {
  

    @IBOutlet var tableViewObj: UITableView!
    
    var arrEmployee:[Student] = []
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchEmpData()
        
    }
    func fetchEmpData()
    {
        let context = appDelegate?.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject> (entityName:"Student")
        
        do
        {
            arrEmployee = try context?.fetch(fetchRequest) as! [Student]
            tableViewObj.reloadData()
        }
        catch let error as NSError
        {
            print("error == ",error)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="addSegue"
        {
            let userData:addUpdateVC = segue.destination as! addUpdateVC
            userData.checkAction = "Add"
            userData.delegate = self
        }
        if segue.identifier == "updateData"
        {
            
           // if self.tableViewObj.indexPath(for: (sender as? UITableViewCell ?? <#default value#>)) != nil
            
                let addUpdate:addUpdateVC = segue.destination as! addUpdateVC
                addUpdate.checkAction = "update"
                //   addUpdate.empData = arrEmployee[indexPath.row]
                addUpdate.delegate = self
            
            
        }
    }
    func refreshBackData() {
        fetchEmpData()
    }
    

}
extension ViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrEmployee.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! myTableViewCell
        
        let empData =  arrEmployee[indexPath.row]
        cell.empid.text = "EmpId "+String(describing: empData.value(forKey: "empid") as! NSNumber)
        cell.empName.text = "EmpName "+(empData.value(forKey: "ename") as! String)
        cell.empCity.text = "EmpCity "+(empData.value(forKey: "empcity") as! String)
      //  cell.empPhone.text = "EmpPhone "+String(describing: empData.value(forKey: "empPhone") as! NSNumber)
        cell.empPhone.text = "EmpPhone "+String(describing: empData.value(forKey: "empPhone") as! NSNumber)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Click on did select")
         
        tableViewObj.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "updateData", sender: self)
    }
}

