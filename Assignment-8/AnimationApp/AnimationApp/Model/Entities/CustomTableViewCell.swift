//
//  CustomTableViewCell.swift
//  AnimationApp
//
//  Created by macbook on 01.04.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func detailAction(_ sender: UIButton) {
    }
}
