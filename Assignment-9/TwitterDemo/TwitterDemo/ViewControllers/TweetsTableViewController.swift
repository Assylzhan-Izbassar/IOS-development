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
//            let pathReference = Storage.storage().reference(withPath: tweets[indexPath.row].wrappedPictureUrl)
//
//            pathReference.getData(maxSize: 1 * 1024 * 1024) { data, error in
//              if let error = error {
//                print(error)
//                return
//              } else {
//                // Data for "images/island.jpg" is returned
//                cell.userImage.image = UIImage(data: data!)
//              }
//            }
        }
        
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
        
        dest.user = user
    }
}
