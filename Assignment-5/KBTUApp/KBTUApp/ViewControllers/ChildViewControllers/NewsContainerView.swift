//
//  NewsContainerView.swift
//  KBTUApp
//
//  Created by macbook on 12.03.2021.
//

import UIKit

class NewsContainerView: UITableViewController {
    
    @IBOutlet var myTable: UITableView!
    var model = NewsModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedIndexPath = myTable.indexPathForSelectedRow {
            myTable.deselectRow(at: selectedIndexPath, animated: animated)
        }
        myTable.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NewsModel.news!.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsCustomViewCell
        
        cell.newsDate.text = News.date
        cell.newsMeta.text = NewsModel.news![indexPath.row].meta
        cell.newsImage.image = NewsModel.news![indexPath.row].image
        cell.clockImage.image = News.meta_image

        return cell
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as? NewsInfoViewController
        
        destVC?._title = NewsModel.news![myTable.indexPathForSelectedRow!.row].newsTitle!
        destVC?._image = NewsModel.news![myTable.indexPathForSelectedRow!.row].image
        destVC?._content = NewsModel.news![myTable.indexPathForSelectedRow!.row].content!
    }
}
