//
//  LoginViewController.swift
//  TwitterDemo
//
//  Created by macbook on 08.04.2021.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var activeIndicator: UIActivityIndicatorView!

    var currentUser: User?
    var user: CustomUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentUser = (Auth.auth().currentUser)
        
        // make some decore
        decorate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let t = password.text {
            if t != "" {
                password.text = ""
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        currentUser = (Auth.auth().currentUser)
        
        if currentUser != nil && (currentUser!.isEmailVerified) {
             fetchData(currentUser?.email ?? "default")
        }
    }
    
    func fetchData(_ email: String) {
        Database.database(url: "https://twitter-8ae9b-default-rtdb.europe-west1.firebasedatabase.app/").reference().child("users").observe(.value, with: { [weak self]
            (snapshot) in
            for item in snapshot.children {
                if let x = item as? DataSnapshot {
                    let value = x.value as! [String: String]
                    if value["email"] == email {
                        self?.user = CustomUser(snapshot: x)
                    }
                }
            }
            self?.goToMainPage()
        })
    }
    
    func showMessage(title t: String, message m: String) {
        let alert = UIAlertController(title: t, message: m, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Okay", style: .default) { (UIAlertAction) in
            if t != "Error" {
                // do something
            }
        }
        
        alert.addAction(ok)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func validate(email e: String) -> Bool {
        
        return true
    }
    
    func validate(password p: String) -> Bool {
        
        return true
    }
    
    func goToMainPage() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        if let tabBar = storyboard.instantiateViewController(identifier: "TabBar") as? UITabBarController {
            if let mainPage = tabBar.viewControllers![0] as? TweetsTableViewController, let secondPage = tabBar.viewControllers![1] as? SearchViewController {
                
                tabBar.modalPresentationStyle = .fullScreen
                
                currentUser = (Auth.auth().currentUser)
                
                mainPage.user = user
                secondPage.user = user
                
                present(tabBar, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        let email = self.email.text ?? ""
        let password = self.password.text ?? ""
        
        if validate(email: email) && validate(password: password) && !activeIndicator.isAnimating {
            activeIndicator.startAnimating()
            
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] (result, error) in
                self?.activeIndicator.stopAnimating()
                if error == nil {
                    if Auth.auth().currentUser!.isEmailVerified {
                        self?.fetchData(email)
                    } else {
                        self?.showMessage(title: "Warning", message: "Please, verify your email!")
                    }
                } else {
                    
                }
            }
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    }
}

// MARK: - Extension

extension LoginViewController: Decoration {
    func decorate() {
        makeCorner(textfield: email, color: UIColor.white.cgColor)
        makeCorner(textfield: password, color: UIColor.white.cgColor)
        makeCorner(button: loginBtn, color: UIColor.white.cgColor)
    }
}
