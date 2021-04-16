//
//  TweetsTableViewController.swift
//  TwitterDemo
//
//  Created by macbook on 11.04.2021.
//

import UIKit
import Firebase
import FirebaseAuth

class TweetsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var myTable: UITableView!
    let ref = Database.database(url: "https://twitter-8ae9b-default-rtdb.europe-west1.firebasedatabase.app/").reference()
    var tweets: [Tweet] = []
    var user: CustomUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
    }
    
    func fetchData() {
        ref.child("tweets").observe(.value, with: { [weak self]
            (snapshot) in
            self?.tweets.removeAll()
            for item in snapshot.children {
                if let x = item as? DataSnapshot {
                    self?.tweets.append(Tweet(snapshot: x))
                }
            }
            
            self?.myTable.reloadData()
        })
    }
    
    func roundCorners(cornerRadius: Double) {
        let path = UIBezierPath(roundedRect: self.view.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.view.bounds
        maskLayer.path = path.cgPath
        self.view.layer.mask = maskLayer
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath) as! TweetTableViewCell
        
        cell.handle.text = tweets[indexPath.row].wrappedAuthor
        cell.content.text = tweets[indexPath.row].wrappedContent
        cell.published.text = tweets[indexPath.row].dateToStr
        cell.fullname.text = tweets[indexPath.row].wrappedFullname
        
        cell.userImage.image = UIImage(named: "avatar")
        
        if tweets[indexPath.row].wrappedPictureUrl != "default" {
            cell.userImage.loadImageUsingCache(tweets[indexPath.row].wrappedPictureUrl)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if tweets[indexPath.row].wrappedAuthor != user?.wrappedEmail {
            return
        }
        
        let alert = UIAlertController(title: "Tweet", message: "Edit your tweet", preferredStyle: .alert)

        alert.addTextField { (textField) in
            textField.text = String(self.tweets[indexPath.row].wrappedContent.dropLast(self.tweets[indexPath.row].wrappedHashTag.count))
        }
        
        alert.addTextField { (textField) in
            textField.text = self.tweets[indexPath.row].wrappedHashTag
        }

        alert.addAction(UIAlertAction(title: "Tweet", style: .default, handler: { [self, weak alert] (_) in
            let content = alert?.textFields![0]
            let hashtag = alert?.textFields![1]
            
            if let tweetContent = content, let tweetHashtag = hashtag {
                let tweet = Tweet(self.tweets[indexPath.row].wrappedId, self.user?.wrappedEmail ?? "default", self.user?.fullName ?? "default", self.user?.wrappedPictureURL ?? "default", tweetContent.text! + tweetHashtag.text!, tweetHashtag.text!, Date())
                self.ref.child("tweets").child( self.tweets[indexPath.row].wrappedId).updateChildValues(tweet.data)
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
        
        let size = Int(95 + tweets[indexPath.row].wrappedContent.count / 3)
        return CGFloat(size)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        if tweets[indexPath.row].wrappedAuthor != user?.wrappedEmail {
            return
        }
        
        let key = tweets[indexPath.row].wrappedId
        ref.child("tweets").child(key).setValue(nil)
        tweets.remove(at: indexPath.row)
                
        myTable.deleteRows(at: [indexPath], with: .automatic)
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! TableHeader
        
        dest.user = user
    }
}
