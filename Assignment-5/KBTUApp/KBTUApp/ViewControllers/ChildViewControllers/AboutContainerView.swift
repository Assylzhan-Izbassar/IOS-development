//
//  AboutContainerView.swift
//  KBTUApp
//
//  Created by macbook on 12.03.2021.
//

import UIKit

class AboutContainerView: UIViewController {
    
    
    @IBOutlet weak var building: UIButton!
    @IBOutlet weak var history: UIButton!
    @IBOutlet weak var message: UIButton!
    @IBOutlet weak var leadership: UIButton!
    @IBOutlet weak var vision: UIButton!
    @IBOutlet weak var alumni: UIButton!
    @IBOutlet weak var dorm: UIButton!
    @IBOutlet weak var contact: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeCorner(building)
        makeCorner(history)
        makeCorner(message)
        makeCorner(leadership)
        makeCorner(vision)
        makeCorner(alumni)
        makeCorner(dorm)
        makeCorner(contact)
    }
    
    func makeCorner(_ button: UIButton) {
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.layer.borderColor =  UIColor(red: 53/255.0, green: 91/255.0, blue: 163/255.0, alpha: 1.00).cgColor
    }
}
