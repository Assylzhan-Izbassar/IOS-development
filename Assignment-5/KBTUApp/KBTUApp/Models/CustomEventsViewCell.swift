//
//  CustomEventsViewCell.swift
//  KBTUApp
//
//  Created by macbook on 12.03.2021.
//

import UIKit

class CustomEventsViewCell: UITableViewCell {
    
    @IBOutlet weak var eventsRegImage: UIImageView!
    @IBOutlet weak var regTitle: UILabel!
    
    @IBOutlet weak var regMeta: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
