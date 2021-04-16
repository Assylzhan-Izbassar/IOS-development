//
//  SearchViewController.swift
//  TwitterDemo
//
//  Created by macbook on 16.04.2021.
//

import UIKit
import FirebaseDatabase

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myTableView: UITableView!
    let ref = Database.database(url: "https://twitter-8ae9b-default-rtdb.europe-west1.firebasedatabase.app/").reference()
    
    var searchedTweets: [Tweet] = []
    var allTweets: [Tweet] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func fetchData() {
        ref.child("tweets").observe(.value, with: { [weak self]
            (snapshot) in
            self?.allTweets.removeAll()
            for item in snapshot.children {
                if let x = item as? DataSnapshot {
                    self?.allTweets.append(Tweet(snapshot: x))
                }
            }
            self?.search()
            self?.myTableView.reloadData()
        })
    }
    
    func search() {
        searchedTweets.removeAll()
        if let hashtag = myTextField.text {
            for item in allTweets {
                if item.wrappedHashTag.dropFirst() == hashtag {
                    searchedTweets.append(item)
                }
            }
        }
    }
    
    @IBAction func searchPressed(_ sender: UIButton) {
        fetchData()
        print(searchedTweets)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedTweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchedCell", for: indexPath) as! TweetTableViewCell
        cell.handle.text = searchedTweets[indexPath.row].wrappedAuthor
        cell.content.text = searchedTweets[indexPath.row].wrappedContent
        cell.published.text = searchedTweets[indexPath.row].dateToStr
        cell.fullname.text = searchedTweets[indexPath.row].wrappedFullname
        
        cell.userImage.image = UIImage(named: "avatar")
        
        if searchedTweets[indexPath.row].wrappedPictureUrl != "default" {
            cell.userImage.loadImageUsingCache(searchedTweets[indexPath.row].wrappedPictureUrl)
        }

        return cell
    }
}
