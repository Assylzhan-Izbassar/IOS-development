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
    
    func makeCorner(button b: UIButton, color c: CGColor?) {
        b.layer.cornerRadius = 22.0
        b.layer.borderWidth = 2.0
        
        if let x = c {
            b.layer.borderColor =  x
        }
    }
    
    func makeCorner(textfield t: UITextField, color c: CGColor?) {
        t.layer.cornerRadius = 22.0
        t.layer.borderWidth = 2.0
        
        if let x = c {
            t.layer.borderColor =  x
        }
        t.clipsToBounds = true
    }
}
