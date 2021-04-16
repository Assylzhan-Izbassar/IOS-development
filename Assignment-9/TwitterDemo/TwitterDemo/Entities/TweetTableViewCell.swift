//
//  TweetTableViewCell.swift
//  TwitterDemo
//
//  Created by macbook on 11.04.2021.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var fullname: UILabel!
    @IBOutlet weak var handle: UILabel!
    @IBOutlet weak var published: UILabel!
    @IBOutlet weak var content: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userImage.layer.cornerRadius = 20
        userImage.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
