//
//  HomeContainerView.swift
//  KBTUApp
//
//  Created by macbook on 12.03.2021.
//

import UIKit

class HomeContainerView: UIViewController {

    @IBOutlet weak var firstBtn: UIButton!
    @IBOutlet weak var secondBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeCorner(firstBtn, UIColor(red: 53/255.0, green: 91/255.0, blue: 163/255.0, alpha: 1.00).cgColor)
        makeCorner(secondBtn, UIColor.white.cgColor)
    }
    
    func makeCorner(_ button: UIButton, _ borderColor: CGColor) {
        button.layer.cornerRadius = 10
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
