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
    var user: CustomUser?
    @IBOutlet weak var myTable: UITableView!
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if searchedTweets[indexPath.row].wrappedAuthor != user?.wrappedEmail {
            return
        }
        
        let alert = UIAlertController(title: "Tweet", message: "Edit your tweet", preferredStyle: .alert)

        alert.addTextField { (textField) in
            textField.text = String(self.searchedTweets[indexPath.row].wrappedContent.dropLast(self.searchedTweets[indexPath.row].wrappedHashTag.count))
        }
        
        alert.addTextField { (textField) in
            textField.text = self.searchedTweets[indexPath.row].wrappedHashTag
        }

        alert.addAction(UIAlertAction(title: "Tweet", style: .default, handler: { [self, weak alert] (_) in
            let content = alert?.textFields![0]
            let hashtag = alert?.textFields![1]
            
            if let tweetContent = content, let tweetHashtag = hashtag {
                let tweet = Tweet(self.searchedTweets[indexPath.row].wrappedId, self.user?.wrappedEmail ?? "default", self.user?.fullName ?? "default", self.user?.wrappedPictureURL ?? "default", tweetContent.text! + tweetHashtag.text!, tweetHashtag.text!, Date())
                self.ref.child("tweets").child( self.searchedTweets[indexPath.row].wrappedId).updateChildValues(tweet.data)
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {_ in
        }))

        self.present(alert, animated: true, completion: nil)
        
        if let selectedIndexPath = myTable.indexPathForSelectedRow {
            myTable.deselectRow(at: selectedIndexPath, animated: true)
        }
        
        fetchData()
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let size = Int(95 + searchedTweets[indexPath.row].wrappedContent.count / 3)
        return CGFloat(size)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        if searchedTweets[indexPath.row].wrappedAuthor != user?.wrappedEmail {
            return
        }
        
        let key = searchedTweets[indexPath.row].wrappedId
        ref.child("tweets").child(key).setValue(nil)
        searchedTweets.remove(at: indexPath.row)
                
        myTable.deleteRows(at: [indexPath], with: .automatic)
    }
}
