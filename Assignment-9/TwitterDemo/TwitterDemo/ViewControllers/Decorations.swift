//
//  Decorations.swift
//  TwitterDemo
//
//  Created by macbook on 08.04.2021.
//

import Foundation
import UIKit

class StyledUIViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func makeCorner(button b: UIButton, color c: CGColor) {
        b.layer.cornerRadius = 15.0
        b.layer.borderWidth = 2.0
        b.layer.borderColor =  c
    }
    
    func makeCorner(textfield t: UITextField, color c: CGColor) {
        t.layer.cornerRadius = 15.0
        t.layer.borderWidth = 2.0
        t.layer.borderColor = c
    }
}
