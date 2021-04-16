//
//  TableHeader.swift
//  TwitterDemo
//
//  Created by macbook on 12.04.2021.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class TableHeader: UIViewController {

    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var birthday: UILabel!
    
    @IBOutlet weak var currentUserImage: UIImageView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    private var ref = Database.database(url: "https://twitter-8ae9b-default-rtdb.europe-west1.firebasedatabase.app/").reference()
    
    var user: CustomUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        email.text = user?.wrappedEmail ?? "default"
        fullName.text = user?.fullName ?? "default"
        birthday.text = user?.dateToStr ?? "29/06/01"
        currentUserImage.loadImageUsingCache(user?.wrappedPictureURL ?? "default")
    }
    
    @IBAction func addTweet(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Tweet", message: "Enter a text", preferredStyle: .alert)

        alert.addTextField { (textField) in
            textField.placeholder = "What's up!"
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "#hashtag..."
        }

        alert.addAction(UIAlertAction(title: "Tweet", style: .default, handler: { [self, weak alert] (_) in
            let content = alert?.textFields![0]
            let hashtag = alert?.textFields![1]
            
            if let tweetContent = content, let tweetHashtag = hashtag {
                let tweet = Tweet(self._email, self._fullName, self.user?.wrappedPictureURL ?? "default", tweetContent.text! + tweetHashtag.text!, tweetHashtag.text!, Date())
                self.ref.child("tweets").childByAutoId().setValue(tweet.data)
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {_ in
        }))

        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func signOutPressed(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        self.dismiss(animated: true, completion: nil)
    }
}
