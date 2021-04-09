//
//  SignUpViewController.swift
//  TwitterDemo
//
//  Created by macbook on 08.04.2021.
//

import UIKit
import Firebase
import FirebaseAuth

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
    
    func showMessage(title t: String, message m: String) {
        let alert = UIAlertController(title: t, message: m, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Okay", style: .default) { (UIAlertAction) in
            if t != "Error" {
                self.dismiss(animated: true, completion: nil)
            }
        }
        
        alert.addAction(ok)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func validate(password p: String) -> Bool {

        return true
    }
    
    func validate(email e: String) -> Bool {
        
        return true
    }
    
    /**
    Sign in the new user
     */
    @IBAction func signInUser(_ sender: UIButton) {
        
        if let e = email.text, let p = password.text {
            if validate(email: e) && validate(password: p) {
                _ = User(name.text!, surname.text!, birthday.date, e, p)
                Auth.auth().createUser(withEmail: e, password: p) { [weak self] (result, error) in
                    if error == nil {
                        Auth.auth().currentUser?.sendEmailVerification(completion: nil)
                        self?.showMessage(title: "Success", message: "Please, verify your email!")
                    }
                }
            }
        }
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
