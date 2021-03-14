//
//  WomenViewController.swift
//  KBTUApp
//
//  Created by macbook on 14.03.2021.
//

import UIKit

class WomenViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: myLabel.bottomAnchor).isActive = true
        // Do any additional setup after loading the view.
        
        myLabel.text = "'Our goal is to increase and strengthen women’s presence, voices, equity, and leadership within the University and the larger society. We would like to provide opportunities for networking and a platform from which to address issues of particular concern to women within the University and beyond'. \nAssel Issina\nFounder and Chairman\nWE@KBTU.KZ"
        
        self.makeCorner(btn, UIColor.white.cgColor)
    }
    
    func makeCorner(_ button: UIButton, _ borderColor: CGColor) {
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 2
        button.layer.borderColor =  borderColor
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
