//
//  IntroViewController.swift
//  Euphoria
//
//  Created by macbook on 23.04.2021.
//

import UIKit

class IntroViewController: UIViewController, GradientBackground {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setGradientBackground(view: view)
    }
}
