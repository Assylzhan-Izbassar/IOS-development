//
//  TableHeader.swift
//  TwitterDemo
//
//  Created by macbook on 12.04.2021.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

extension TableHeader: UserHelper {
    func setUser(_ user: CustomUser) {
        self.user = user
    }
}

class TableHeader: UIViewController, Decoration {

    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var birthday: UILabel!
    
    @IBOutlet weak var currentUserImage: UIImageView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    private var ref = Database.database(url: "https://twitter-8ae9b-default-rtdb.europe-west1.firebasedatabase.app/").reference()
    
    var user: CustomUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(editUserProfile)))
        
        EditViewController.delegate = self
        
        decorate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YY"
        
        email.text = user?.wrappedEmail ?? "default"
        fullName.text = user?.fullName ?? "default"
        birthday.text = dateFormatter.string(from: user?.wrappedBirthday ?? Date())
        currentUserImage.loadImageUsingCache(user?.wrappedPictureURL ?? "default")
    }
    
    func decorate() {
        currentUserImage.layer.borderWidth = 1
        currentUserImage.layer.masksToBounds = false
        currentUserImage.layer.borderColor = UIColor.white.cgColor
        currentUserImage.layer.cornerRadius = currentUserImage.frame.height/2
        currentUserImage.clipsToBounds = true
    }
    
    @objc func editUserProfile() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        if let editVC = storyboard.instantiateViewController(identifier: "EditViewController") as? EditViewController {
            
            editVC.modalPresentationStyle = .fullScreen
            
            editVC.user = user
            
            present(editVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func addTweet(_ sender: UIBarButtonItem) {
        
        let key = ref.child("tweets").childByAutoId().key
        
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
                let tweet = Tweet(key!, self.user?.wrappedEmail ?? "default", self.user?.fullName ?? "default", self.user?.wrappedPictureURL ?? "default", tweetContent.text! + tweetHashtag.text!, tweetHashtag.text!, Date())
                self.ref.child("tweets").child(key!).setValue(tweet.data)
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
