//
//  AddAlarmViewController.swift
//  AlarmApp
//
//  Created by macbook on 12.03.2021.
//

import UIKit

protocol AddAlarm: class {
    func add(_ newAlarm: Alarm)
}

class AddAlarmViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var timePicker: UIPickerView!
    @IBOutlet weak var myNote: UITextField!
    
    var pickedData: [[String]] = [[String]]()
    weak static var alarmDelegate: AddAlarm?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect data
        self.timePicker.delegate = self
        self.timePicker.dataSource = self
        
        pickedData = [["00", "01", "02", "03", "04", "05", "06", "07", "08",
                       "09", "10", "11", "12", "13", "14", "15", "16", "17",
                       "18", "19", "20", "21", "22", "23"],
                      ["00", "01", "02", "03", "04", "05", "06", "07", "08",
                       "09", "10", "11", "12", "13", "14", "15", "16", "17",
                       "18", "19", "20", "21", "22", "23", "24", "25", "26",
                       "27", "28", "29", "30", "31", "32", "33", "34", "35",
                       "36", "37", "38", "39", "40", "41", "42", "43", "44",
                       "45", "46", "47", "48", "49", "50", "51", "52", "53",
                       "54", "55", "56", "57", "58", "59",
                      ]]
        self.hideKeyboardWhenTappedAround()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Picker View
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickedData[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.pickedData[component][row]
    }
    
    // MARK: - Page Actions
    
    @IBAction func save(_ sender: UIButton) {
        
        let hour = pickedData[0][timePicker.selectedRow(inComponent: 0)]
        let minute = pickedData[1][timePicker.selectedRow(inComponent: 1)]
        
        AddAlarmViewController.alarmDelegate?.add(Alarm(hour+":"+minute, true, myNote.text!))
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
