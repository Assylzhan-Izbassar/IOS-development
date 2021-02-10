//
//  ViewController.swift
//  Contact Book
//
//  Created by macbook on 10.02.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTable: UITableView!
    private var model = ContactModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTable.delegate = self
        myTable.dataSource = self
        // Connecting TableView with ViewController
        self.myTable.rowHeight = 64.0
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
}

