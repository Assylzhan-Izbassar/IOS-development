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
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    private var ref = Database.database(url: "https://twitter-8ae9b-default-rtdb.europe-west1.firebasedatabase.app/").reference()
    
    var _email = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        email.text = _email
    }
    
    @IBAction func addTweet(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Tweet", message: "Enter a text", preferredStyle: .alert)

        alert.addTextField { (textField) in
            textField.placeholder = "What's up!"
        }

        alert.addAction(UIAlertAction(title: "Tweet", style: .default, handler: { [weak alert] (_) in
            let content = alert?.textFields![0]
            
            if let tweetContent = content {
                let tweet = Tweet(self._email, tweetContent.text!, "#cool", Date())
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
