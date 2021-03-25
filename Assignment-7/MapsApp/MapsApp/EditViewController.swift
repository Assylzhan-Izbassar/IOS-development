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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pinTitle.text = _title
        pinSubTitle.text = _subtitle
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
