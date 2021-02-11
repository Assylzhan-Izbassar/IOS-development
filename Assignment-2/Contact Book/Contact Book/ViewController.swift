//
//  ViewController.swift
//  Contact Book
//
//  Created by macbook on 10.02.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTable: UITableView!
    var model = ContactModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTable.delegate = self
        myTable.dataSource = self
        // Connecting TableView with ViewController
        self.myTable.rowHeight = 64.0
        // Making cell height equal to 64
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.contacts!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! CustomTableViewCell
        // Filling the view labels and image
        cell.contactName.text = model.contacts![indexPath.row].name
        cell.contactSurName.text = model.contacts![indexPath.row].surname
        cell.contactPhoneNumber.text = model.contacts![indexPath.row].phoneNumber
        cell.contactImage.image = model.contacts![indexPath.row].image
        return cell
    }
    
    @IBAction func unwindToContactList(_ sender: UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as? ContactInfoViewController
        
        destVC?._name =  model.contacts![myTable.indexPathForSelectedRow!.row].name
        destVC?._surName =  model.contacts![myTable.indexPathForSelectedRow!.row].surname
        destVC?._phoneNum =  model.contacts![myTable.indexPathForSelectedRow!.row].phoneNumber
        destVC?._image =  model.contacts![myTable.indexPathForSelectedRow!.row].image
        destVC?.setId(myTable.indexPathForSelectedRow!.row)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedIndexPath = myTable.indexPathForSelectedRow {
            myTable.deselectRow(at: selectedIndexPath, animated: animated)
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        model.deleteContact(indexPath)
        
        myTable.deleteRows(at: [indexPath], with: .automatic)
    }
}

