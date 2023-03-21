//
//  ViewController.swift
//  tableWithCoreData
//
//  Created by Rajeev on 26/02/23.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource
{
    var country:UITextField!
    var cData=[CountryData]()
    
    
    
    @IBOutlet var myTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dh=DataBaseHandler()
        cData=dh.fetchData()
        
        myTable.reloadData()
        
        
        
        
    }
    
    @IBAction func addNewData(_ sender: Any)
    {
        
        let dialogMessage=UIAlertController(title: "Add data", message: "Enter Country Name", preferredStyle: .alert)
        
        let okAction=UIAlertAction(title: "OK", style: .default) { (action) in
            
            
            let NewCountryName=self.country.text!
            let dh=DataBaseHandler()
            dh.saveData(cName: NewCountryName)
            self.cData=dh.fetchData()
            self.myTable.reloadData()
            
        }
        let cancelAction=UIAlertAction(title: "cancel", style: .cancel){(action) in print("Cancel the Operation")
            
        }
        
        dialogMessage.addAction(okAction)
        dialogMessage.addAction(cancelAction)
        dialogMessage.addTextField(){(UITextField) in self.country=UITextField
            self.country.placeholder="Type of country"
            
        }
        self.present(dialogMessage,animated: true,completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=myTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text=cData[indexPath.row].countryName
        return cell
        
    }
    
    
}

