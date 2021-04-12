//
//  TableHeader.swift
//  TwitterDemo
//
//  Created by macbook on 12.04.2021.
//

import UIKit

class TableHeader: UIViewController {


    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var birthday: UILabel!
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addTweet(_ sender: UIButton) {
    }
    
    @IBAction func signOutPressed(_ sender: UIButton) {
    }
}
