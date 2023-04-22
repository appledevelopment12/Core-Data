//
//  myTableViewCell.swift
//  SearchCoreData
//
//  Created by Rajeev on 07/04/23.
//

import UIKit

class myTableViewCell: UITableViewCell {

    @IBOutlet var name: UILabel!
    
    @IBOutlet var roll: UILabel!
    
    //var age = roll.text.toInt() ?? 0
     //   var age = Int32("roll")
    @IBOutlet var classs: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
