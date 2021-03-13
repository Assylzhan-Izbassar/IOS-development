//
//  ViewController.swift
//  AlarmApp
//
//  Created by macbook on 12.03.2021.
//

import UIKit

// MARK: - Protocol implementaions

extension ViewController: AddAlarm, ChangeAlarm, DeleteAlarm {
    
    func add(_ newAlarm: Alarm) {
        self.model.addAlarm(newAlarm)
        self.myTable.reloadData()
    }
    
    func changeAlarm(_ id: Int, _ changed: Alarm) {
        self.model.editAlarm(id, changed)
        self.myTable.reloadData()
    }
    
    func deleteAlarm(_ id: Int) {
        self.model.removeAlarm(withId: id)
        self.myTable.reloadData()
    }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTable: UITableView!
    var model = AlarmModel()
    
    // MARK: - Initialize
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Additional setup after loading the view.
        AddAlarmViewController.alarmDelegate = self
        ChangeAlarmViewController.changeDelegate = self
        ChangeAlarmViewController.deleteDelegate = self
        
        myTable.delegate = self
        myTable.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedIndexPath = myTable.indexPathForSelectedRow {
            myTable.deselectRow(at: selectedIndexPath, animated: animated)
        }
        myTable.reloadData()
    }
    
    // MARK: - Table View Methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.getAlarms().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        
        cell.cellTime.text = model.getAlarms()[indexPath.row].time
        cell.cellNote.text = model.getAlarms()[indexPath.row].note
        cell.cellSwitcher.isOn = model.getAlarms()[indexPath.row].isOn
        cell._id = indexPath.row
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        model.removeAlarm(indexPath)
        
        myTable.deleteRows(at: [indexPath], with: .automatic)
    }

    // MARK: - Switcher
    
    @IBAction func switched(_ sender: UISwitch) {
        guard
            let table = sender.superview?.superview as? CustomTableViewCell
        else {
            fatalError()
        }
        model.getAlarms()[table._id].isOn = sender.isOn
    }
    
    // MARK: - Segue Methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as? ChangeAlarmViewController
        
        destVC?._time = model.getAlarms()[myTable.indexPathForSelectedRow!.row].time
        destVC?._note = model.getAlarms()[myTable.indexPathForSelectedRow!.row].note
        destVC?._id = myTable.indexPathForSelectedRow!.row
        destVC?._isOn = model.getAlarms()[myTable.indexPathForSelectedRow!.row].isOn
    }
    
    @IBAction func unwindToMain( _ sender: UIStoryboardSegue) {}
}

