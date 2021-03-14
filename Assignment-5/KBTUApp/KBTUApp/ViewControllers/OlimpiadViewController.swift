//
//  OlimpiadViewController.swift
//  KBTUApp
//
//  Created by macbook on 14.03.2021.
//

import UIKit

class OlimpiadViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: myLabel.bottomAnchor).isActive = true
        
        myLabel.text = "Dear students and college graduates! We are pleased to announce to you the holding of the KBTU Republican Subject Olympiad among among students in grades 10-12 and college graduates! (citizens of the Republic of Kazakhstan). \n The Olympiad will be held in five areas:\n- Information and communication technologies\n- Business and management\n- Manufacturing and processing industries\n- Marine transport and technology\n- Chemical engineering and processes.\nThe winners of the Olympiad will receive GRANTS and DISCOUNTS for studying at KBTU!\nFormat: Online        \nRound 1: March 11, 2021\nRound 2: March 17, 2021\nYou can read the terms and conditions in the Olympiad Regulations.        \nRegistration is available at the link: http://bit.ly/2ZCEEhl/nRegistration will be open until March 7, 2021 at 23:59\nTelegram group for Olympiad participants: https://t.me/joinchat/IXmVkxIyPDmX-UQ1\nHurry up to register and get a chance to win a grant from KBTU!"
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
