//
//  ImageTableViewCell.swift
//  KBTUApp
//
//  Created by macbook on 12.03.2021.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var kbtuImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
