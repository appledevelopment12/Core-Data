//
//  myTableViewCell.swift
//  CoreDataUpdataDelete
//
//  Created by Rajeev on 10/04/23.
//

import UIKit

class myTableViewCell: UITableViewCell {

    @IBOutlet var empid: UILabel!
    @IBOutlet var empName: UILabel!
    @IBOutlet var empCity: UILabel!
    @IBOutlet var empPhone: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
