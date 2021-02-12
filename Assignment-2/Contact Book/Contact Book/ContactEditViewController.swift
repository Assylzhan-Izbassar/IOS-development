//
//  ContactEditViewController.swift
//  Contact Book
//
//  Created by macbook on 12.02.2021.
//

import UIKit

class ContactEditViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var surName: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var contactImage: UIImageView!
    
    var _name = ""
    var _surname = ""
    var _phoneNumber = ""
    var _image = UIImage()
    var id: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = _name
        surName.text = _surname
        phoneNumber.text = _phoneNumber
        contactImage.image = _image
        
        self.hideKeyboardWhenTappedAround()
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? ContactInfoViewController
        let edited = Contact(name.text!, surName.text!, phoneNumber.text!, contactImage.image!)
        destination?.model.editContact(id!, edited)
        destination?.name?.text = edited.name
        destination?.surName?.text = edited.surname
        destination?.phoneNum?.text = edited.phoneNumber
        
    }
}
