//
//  EditViewController.swift
//  MapsApp
//
//  Created by macbook on 24.03.2021.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var pinTitle: UITextField!
    @IBOutlet weak var pinSubTitle: UITextField!
    
    
    var _title: String = ""
    var _subtitle: String = ""
    var _id = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pinTitle.text = _title
        pinSubTitle.text = _subtitle
    }
    
    // MARK: - Navigation
    
    @IBAction func unwindToViewController( _ seg: UIStoryboardSegue) {}

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "backToViewController" {
            if let destination = segue.destination as? ViewController {
                destination.updateAnnotation(_title, _subtitle, pinTitle.text!, pinSubTitle.text!)
            }
        }
    }

}
