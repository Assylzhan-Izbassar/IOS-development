//
//  NewContactViewController.swift
//  Contact Book
//
//  Created by macbook on 11.02.2021.
//

import UIKit

class NewContactViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var newName: UITextField!
    @IBOutlet weak var newSurname: UITextField!
    @IBOutlet weak var newPhoneNumber: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var myPicker: UIPickerView!
    var pickedData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect data
        self.myPicker.delegate = self
        self.myPicker.dataSource = self
        
        // Input data of the picker
        pickedData = ["Male", "Female"]
        
        self.hideKeyboardWhenTappedAround()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickedData.count
    }
    
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickedData[row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ViewController
        
        let selectedVal = pickedData[myPicker.selectedRow(inComponent: 0)]
        let gender: String?
        if selectedVal == "Male" {
            gender = "male"
        }else{
            gender = "female"
        }
        let _newName = newName?.text
        let _newSurName = newSurname?.text
        let _newPhoneNumber = newPhoneNumber?.text
        let _image = UIImage.init(named: gender!)
        let newContact = Contact(_newName!, _newSurName!, _newPhoneNumber!, _image!)
        
        destination.model.addContact(newContact)
        
        destination.myTable.reloadData()
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
