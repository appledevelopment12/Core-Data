//
//  ViewController.swift
//  SearchCoreData
//
//  Created by Rajeev on 07/04/23.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    var studentN:UITextField!
    var studentR:UITextField!
    var studentC:UITextField!
    
    var sDATAA = [StudentData]()
    @IBOutlet var myStatus: UILabel!
    @IBOutlet var rollText: UITextField!
    @IBOutlet var rollLable: UILabel!
    @IBOutlet var classLabell: UILabel!
    @IBOutlet var studentNameLabl: UILabel!
    
    @IBOutlet var myTable:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let dh = databaseHandler()
        dh.saveData(roll: 1001, sname: "Rohit kumar", sClass: "B.C.A")
        dh.saveData(roll: 1002, sname: "Rahul kumar", sClass: "M.C.A")
        dh.saveData(roll: 10002, sname: "Raja kumar", sClass: "B.C.A")
        dh.saveData(roll: 1004, sname: "Rohan kumar", sClass: "M.C.A")
        dh.saveData(roll: 1005, sname: "Raushan kumar", sClass: "J.C.A")
        dh.saveData(roll: 1006, sname: "Romit umar", sClass: "N.C.A")
        dh.saveData(roll: 1007, sname: "Riki kumar", sClass: "B.C.A")
        dh.saveData(roll: 1008, sname: "Ritik kumar", sClass: "M.C.A")
        dh.saveData(roll: 1009, sname: "Roshni kumar", sClass: "B.C.A")
        
        
        
        sDATAA=dh.fetchData()
        myTable.reloadData()
    }

    
    //**************** SEARCHING KEYBUTTONS
    
    @IBAction func searchButton(_ sender: UIButton)
    {
        var  sdata = [StudentData]()
        
        if rollText.text! != " "
        {
            let dh = databaseHandler()
            let rollno = Int32(rollText.text!) ?? 0
            sdata =  dh.searchData(sroll: rollno)
            if sdata.count>0
            {
                myStatus.text = "Roll Number Found Successfully"
                rollLable.text = "Roll Number is \(String(sdata[0].rollno))"
                studentNameLabl.text = "Student Name is \(sdata[0].studentname ?? "")"
                classLabell.text = "Class is \(sdata[0].sClass ?? " ")"
                
            }
            else
            {
                rollLable.text = " "
                classLabell.text = " "
                studentNameLabl.text = " "
                myStatus.text = " Roll Number Not Found"
            }
            
        }
        else
        {
            myStatus.text = "Kindly Enter Roll Number  First"
        }
        
    }
    
    
    
    
    
    
    
    
    //****************************   ADDDING BUTTON ACTION CODEE
    
    @IBAction func addNewData(_ sender: UIButton)
    {
        
        let dialogMessage=UIAlertController(title: "Add data", message: "Enter Student details", preferredStyle: .alert)
        
        let okAction=UIAlertAction(title: "OK", style: .default) { [self] (action) in
            
            
            let NewStudentName=self.studentN.text!
            let NewRoll=Int32(studentR.text!) ?? 0
            let NewClass=self.studentC.text!
            let dh=databaseHandler()
            dh.saveData(roll: NewRoll, sname: NewStudentName, sClass: NewClass)
            self.sDATAA=dh.fetchData()
            self.myTable.reloadData()
            
        }
        let cancelAction=UIAlertAction(title: "cancel", style: .cancel){(action) in print("Cancel the Operation")
            
        }
        
        dialogMessage.addAction(okAction)
        dialogMessage.addAction(cancelAction)
        dialogMessage.addTextField()
        {
            (UITextField) in self.studentN=UITextField
            self.studentN.placeholder="Name of student"
        }
        dialogMessage.addTextField()
        {
        (UITextField) in self.studentR = UITextField
        self.studentR.placeholder = "Roll of student "
        }
        dialogMessage.addTextField()
        {
            (UITextField) in self.studentC = UITextField
            self.studentC.placeholder = "Class of student"
        }
            
            
        
        self.present(dialogMessage,animated: true,completion: nil)
        
    }
    //***********************
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return sDATAA.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = myTable.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! myTableViewCell
        cell.name.text = sDATAA[indexPath.row].studentname
       // cell.roll.text = sDATAA[indexPath.row].rollno
        cell.roll.text = String(sDATAA[indexPath.row].rollno)
        cell.classs.text = sDATAA[indexPath.row].sClass
        
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            sDATAA.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

