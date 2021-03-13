//
//  EventsContainerViewController.swift
//  KBTUApp
//
//  Created by macbook on 11.03.2021.
//

import UIKit

class EventsContainerView: UITableViewController {

    @IBOutlet var myTable: UITableView!
    var model = EventsModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return model.getEvents().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "eventsCell") as! CustomEventsViewCell
        
        cell2.eventsRegImage.image = model.getEvents()[indexPath.row].image
        cell2.regTitle.text = model.getEvents()[indexPath.row].newsTitle
        cell2.regMeta.text = model.getEvents()[indexPath.row].meta
        
        return cell2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as? NewsInfoViewController
        
        dest?._image = model.getEvents()[myTable.indexPathForSelectedRow!.row].image
        dest?._content = model.getEvents()[myTable.indexPathForSelectedRow!.row].content!
        dest?._title = model.getEvents()[myTable.indexPathForSelectedRow!.row].newsTitle!
    }
}
