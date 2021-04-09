//
//  LoginViewController.swift
//  TwitterDemo
//
//  Created by macbook on 08.04.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // make some decore
        decorate()
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
    }
}

// MARK: - Extension

extension LoginViewController: Decoration {
    func decorate() {
        makeCorner(textfield: email, color: UIColor.white.cgColor)
        makeCorner(textfield: password, color: UIColor.white.cgColor)
        makeCorner(button: loginBtn, color: UIColor.white.cgColor)
    }
}
