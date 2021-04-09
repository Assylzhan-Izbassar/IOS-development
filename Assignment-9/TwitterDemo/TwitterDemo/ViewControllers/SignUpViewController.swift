//
//  SignUpViewController.swift
//  TwitterDemo
//
//  Created by macbook on 08.04.2021.
//

import UIKit

class SignUpViewController: StyledUIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var surname: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var birthday: UIDatePicker!
    @IBOutlet weak var signInBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        decorate()
    }
    
    func decorate() {
        self.makeCorner(textfield: name, color: UIColor.white.cgColor)
        self.makeCorner(textfield: surname, color: UIColor.white.cgColor)
        self.makeCorner(textfield: email, color: UIColor.white.cgColor)
        self.makeCorner(textfield: password, color: UIColor.white.cgColor)
        self.makeCorner(button: signInBtn, color: UIColor.white.cgColor)
        birthday.setValue(UIColor.white, forKeyPath: "textColor")
    }
}
