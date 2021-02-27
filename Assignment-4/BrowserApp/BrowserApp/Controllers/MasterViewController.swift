//
//  MasterViewController.swift
//  BrowserApp
//
//  Created by macbook on 25.02.2021.
//

import UIKit

protocol WebSelectionDelegate: class {
  func webSelected(_ newPage: WebPage)
}

extension MasterViewController: TableRefreshDelegate {
    func tableRefresh() {
        self.myTable.reloadData()
    }
}

class MasterViewController: UITableViewController {
    
    @IBOutlet var myTable: UITableView!
    var model = WebPageModel()
    weak var delegate: WebSelectionDelegate?
    var selectedSegment: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.getSegment()[selectedSegment].count
    }


    @IBAction func switchSegment(_ sender: UISegmentedControl) {
        selectedSegment = sender.selectedSegmentIndex
        myTable.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let page = model.getSegment()[selectedSegment][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = page.getTitle()
        // Configure the cell...

        return cell
    }

    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath) {
        if
          let detailViewController = delegate as? DetailViewController,
          let detailNavigationController = detailViewController.navigationController {
            splitViewController?
              .showDetailViewController(detailNavigationController, sender: nil)
        }
        let selectedPage = model.getSegment()[selectedSegment][indexPath.row]
        delegate?.webSelected(selectedPage)
    }

    @IBAction func addButton(_ sender: Any) {
        let alert = UIAlertController(title: "Add website", message: nil, preferredStyle: .alert)
        alert.addTextField {
            (title) in title.placeholder = "Enter a title"
        }
        alert.addTextField {
            (url) in url.placeholder = "Enter a url"
        }
        var http = "https://"
        let action = UIAlertAction(title: "Add", style: .default) { [self]
            (_) in
            guard
                let title = alert.textFields?.first?.text,
                let url = alert.textFields?.last?.text
            else { return }
            
            http += url
            model.addPage(title, http)
            myTable.reloadData()
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
