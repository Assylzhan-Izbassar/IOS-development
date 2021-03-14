//
//  FacultiesInfoViewController.swift
//  KBTUApp
//
//  Created by macbook on 12.03.2021.
//

import UIKit

class FacultiesInfoViewController: UIViewController {

    @IBOutlet weak var facultyImage: UIImageView!
    @IBOutlet weak var facultyContent: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var facultyTitle: UILabel!
    
    var _content = ""
    var _image = UIImage()
    var _title = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: facultyContent.bottomAnchor).isActive = true
        facultyImage.image = _image
        facultyContent.text = _content
        facultyTitle.text = _title
    }
}
