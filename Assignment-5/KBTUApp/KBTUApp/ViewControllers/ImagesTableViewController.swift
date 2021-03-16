//
//  ImagesTableViewController.swift
//  KBTUApp
//
//  Created by macbook on 12.03.2021.
//

import UIKit

class ImagesTableViewController: UITableViewController {
    
    private var images:Array<UIImage> = Array<UIImage>()

    @IBOutlet var myTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setData()
    }
    
    private func setData() {
        self.images.append(UIImage.init(named: "kbtu_ro")!)
        self.images.append(UIImage.init(named: "rh")!)
        self.images.append(UIImage.init(named: "alb")!)
        self.images.append(UIImage.init(named: "st")!)
        self.images.append(UIImage.init(named: "sm")!)
        self.images.append(UIImage.init(named: "ise")!)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return images.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! ImageTableViewCell

        cell.kbtuImage.image = images[indexPath.row]

        return cell
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedIndexPath = myTable.indexPathForSelectedRow {
            myTable.deselectRow(at: selectedIndexPath, animated: animated)
        }
        myTable.reloadData()
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}