//
//  LoginViewController.swift
//  TwitterDemo
//
//  Created by macbook on 08.04.2021.
//

import UIKit

class LoginViewController: StyledUIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        decorate()
    }
    
    func decorate() {
        self.makeCorner(textfield: email, color: UIColor.white.cgColor)
        self.makeCorner(textfield: password, color: UIColor.white.cgColor)
        self.makeCorner(button: loginBtn, color: UIColor.white.cgColor)
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
    }
}
