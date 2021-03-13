//
//  NewsCustomViewCell.swift
//  KBTUApp
//
//  Created by macbook on 12.03.2021.
//

import UIKit

class NewsCustomViewCell: UITableViewCell {

    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsMeta: UILabel!
    @IBOutlet weak var newsDate: UILabel!
    @IBOutlet weak var clockImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
