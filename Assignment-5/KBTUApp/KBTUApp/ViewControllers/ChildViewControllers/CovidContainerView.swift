//
//  CovidContainerView.swift
//  KBTUApp
//
//  Created by macbook on 12.03.2021.
//

import UIKit

class CovidContainerView: UITableViewController {
    
    private var model = CovidModel()
    @IBOutlet var myTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.getPosts().count
     }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = model.getPosts()[indexPath.row].title
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as? CovidInfoVC
        dest?._content = model.getPosts()[myTable.indexPathForSelectedRow!.row].content
    }
}
