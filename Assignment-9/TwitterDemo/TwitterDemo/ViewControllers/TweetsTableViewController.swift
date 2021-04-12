//
//  TweetsTableViewController.swift
//  TwitterDemo
//
//  Created by macbook on 11.04.2021.
//

import UIKit

class TweetsTableViewController: UITableViewController{
    
    var tweet: Tweet?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func roundCorners(cornerRadius: Double) {
        let path = UIBezierPath(roundedRect: self.view.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.view.bounds
        maskLayer.path = path.cgPath
        self.view.layer.mask = maskLayer
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweet?.wrappedAuthor.wrappedTweets.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath) as! TweetTableViewCell
        cell.nameSurname.text = (tweet?.wrappedAuthor.wrappedName)! + " " + (tweet?.wrappedAuthor.wrappedSurname)!
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let text = tweet?.wrappedAuthor.wrappedTweets[indexPath.row].wrappedContent
        return CGFloat(text?.count ?? 0 / 10)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
