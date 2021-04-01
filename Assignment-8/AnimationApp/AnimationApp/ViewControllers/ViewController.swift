//
//  ViewController.swift
//  AnimationApp
//
//  Created by macbook on 31.03.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.layer.cornerRadius = 10
        nextButton.layer.borderWidth = 1
        nextButton.layer.borderColor = UIColor.white.cgColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        email.center.x = 0;
        UIView.animate(withDuration: 1.0, delay: 0.2, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .allowAnimatedContent, animations: {
            self.email.center.x = self.view.frame.width / 2
        }, completion: nil)
        
        password.center.x = self.view.frame.width;
        UIView.animate(withDuration: 1.0, delay: 0.2, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .allowAnimatedContent, animations: {
            self.password.center.x = self.view.frame.width / 2
        }, completion: nil)
        
        nextButton.alpha = 0;
        
        UIView.animate(withDuration: 1.0, delay: 1.0, options: .allowAnimatedContent, animations: {
            self.nextButton.alpha = 1
        }, completion: nil)
    }
    
    @IBAction func nextView(_ sender: Any) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DestinationViewController") as? ListViewController {
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: false, completion: nil)
        }
    }
}

