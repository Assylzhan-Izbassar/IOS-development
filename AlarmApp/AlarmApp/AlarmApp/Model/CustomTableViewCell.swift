//
//  CustomTableViewCell.swift
//  AlarmApp
//
//  Created by macbook on 12.03.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var cellTime: UILabel!
    @IBOutlet weak var cellNote: UILabel!
    @IBOutlet weak var cellSwitcher: UISwitch!
    
    var _id: Int = -1
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
