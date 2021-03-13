//
//  ChangeAlarmViewController.swift
//  AlarmApp
//
//  Created by macbook on 12.03.2021.
//

import UIKit

protocol ChangeAlarm: class {
    func changeAlarm(_ id: Int, _ changed: Alarm)
}

protocol DeleteAlarm: class {
    func deleteAlarm(_ id: Int)
}

class ChangeAlarmViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var timePicker: UIPickerView!
    @IBOutlet weak var infoNote: UITextField!
    
    var pickedData: [[String]] = [[String]]()
    
    // Delegates
    static weak var changeDelegate: ChangeAlarm?
    static weak var deleteDelegate: DeleteAlarm?
    
    // Temp parameters
    var _time: String = ""
    var _note: String = ""
    var _id: Int = -1
    var _isOn: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
        
        self.timePicker.delegate = self
        self.timePicker.dataSource = self

        // Do any additional setup after loading the view.
        infoNote.text = _note
        
        let hour = _time.prefix(2)
        let minute = _time.suffix(2)
        
        timePicker.selectRow(Int(hour)!, inComponent: 0, animated: true)
        timePicker.selectRow(Int(minute)!, inComponent: 1, animated: true)
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
    
    
    @IBAction func removeAlarm(_ sender: Any) {
        ChangeAlarmViewController.deleteDelegate?.deleteAlarm(_id)
    }
    
    
    @IBAction func changeAlarm(_ sender: Any) {
        let hour = pickedData[0][timePicker.selectedRow(inComponent: 0)]
        let minute = pickedData[1][timePicker.selectedRow(inComponent: 1)]
        ChangeAlarmViewController.changeDelegate?.changeAlarm(_id, Alarm(hour+":"+minute, _isOn , (infoNote.text)!))
    }
}
