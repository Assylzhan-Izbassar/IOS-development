//
//  CovidInfoVC.swift
//  KBTUApp
//
//  Created by macbook on 13.03.2021.
//

import UIKit

class CovidInfoVC: UIViewController {

    @IBOutlet weak var postContent: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var _content = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postContent.text = _content
        
        scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: postContent.bottomAnchor).isActive = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
