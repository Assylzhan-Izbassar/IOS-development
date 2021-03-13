//
//  NewsInfoViewController.swift
//  KBTUApp
//
//  Created by macbook on 12.03.2021.
//

import UIKit

class NewsInfoViewController: UIViewController {

    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsContent: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var _title = ""
    var _content = ""
    var _image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsTitle.text = _title
        newsContent.text = _content
        mainImage.image = _image
        
        scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: newsContent.bottomAnchor).isActive = true
    }
}
