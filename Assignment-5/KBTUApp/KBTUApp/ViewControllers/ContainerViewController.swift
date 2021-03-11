//
//  ContainerViewController.swift
//  KBTUApp
//
//  Created by macbook on 11.03.2021.
//

import UIKit

class ContainerViewController: UIViewController {
    
    lazy var newsContainerView: NewsContainerView = {
        var viewController = storyboard?.instantiateViewController(withIdentifier: "NewsContainerView") as! NewsContainerView
        self.addViewControllerAsChildViewController(childVC: viewController)
        
        return viewController
    }()
    
    lazy var eventsContainerView: EventsContainerView = {
        var viewController = storyboard?.instantiateViewController(withIdentifier: "EventsContainerView") as? EventsContainerView
        self.addViewControllerAsChildViewController(childVC: viewController)
        
        return viewController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Helper Methods
    
    private func addViewControllerAsChildViewController(childVC: UIViewController) {
        addChild(childVC)
        
        view.addSubview(childVC.view)
        childVC.view.frame = view.bounds
        childVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        childVC.didMove(toParent: self)
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
