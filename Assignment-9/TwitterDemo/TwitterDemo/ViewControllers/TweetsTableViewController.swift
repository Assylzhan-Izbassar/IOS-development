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
    
    var tweet: Tweet?
    var email = ""
    var tweets: [Tweet] = []
    @IBOutlet weak var myTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ref = Database.database(url: "https://twitter-8ae9b-default-rtdb.europe-west1.firebasedatabase.app/").reference()
        
        ref.child("tweets").observe(.value, with: { [weak self]
            (snapshot) in
            self?.tweets.removeAll()
            self?.tweets.append(Tweet(self!.email, "You can inspect references to better understand the files they point to using the fullPath, name, and bucket properties. These properties get the file's full path, name, and bucket.", "@coll", Date()))
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
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let size = Int(95 + tweets[indexPath.row].wrappedContent.count / 3)
        return CGFloat(size)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! TableHeader
        dest._email = email
    }
}
