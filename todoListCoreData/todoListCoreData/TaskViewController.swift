//
//  TaskViewController.swift
//  todoListCoreData
//
//  Created by Rajeev on 11/04/23.
//

import UIKit

class TaskViewController: UIViewController {

    var task:String?
    
    @IBOutlet var label:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = task
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
    }
    

    @objc func deleteTask()
    {
      //  let newCount = count - 1
     //   UserDefaults().setValue(newCount, forKey: "count")
    // UserDefaults.setValue(nil, forKey: "task_\(currentPosition)")
    }

}
