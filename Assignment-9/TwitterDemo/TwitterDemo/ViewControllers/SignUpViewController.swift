//
//  SignUpViewController.swift
//  TwitterDemo
//
//  Created by macbook on 08.04.2021.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var surname: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var birthday: UIDatePicker!
    @IBOutlet weak var signInBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // make some decore
        decorate()
    }
}

// MARK: - Extension

extension SignUpViewController: Decoration {
    func decorate() {
        makeCorner(textfield: name, color: UIColor.white.cgColor)
        makeCorner(textfield: surname, color: UIColor.white.cgColor)
        makeCorner(textfield: email, color: UIColor.white.cgColor)
        makeCorner(textfield: password, color: UIColor.white.cgColor)
        makeCorner(button: signInBtn, color: UIColor.white.cgColor)
        birthday.setValue(UIColor.white, forKeyPath: "textColor")
    }
}
