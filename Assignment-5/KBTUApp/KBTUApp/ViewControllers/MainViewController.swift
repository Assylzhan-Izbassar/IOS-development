//
//  MainViewController.swift
//  KBTUApp
//
//  Created by macbook on 11.03.2021.
//

import UIKit

extension MainViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.setIsPresenting(true)
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.setIsPresenting(false)
        return transition
    }
}

protocol ViewRefreshDelegate: class {
    func viewRefresh(with menuType: MenuType)
}

class MainViewController: UIViewController {
    
    private let transition = SideTransition()
    private var topView: UIView?
    
    // Delegate between mainViewController
    weak static var refresh: ViewRefreshDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didSideLoad(_ sender: UIBarButtonItem) {
        guard
            let menuVC = storyboard?.instantiateViewController(withIdentifier: "SideMenuTableViewController") as? SideMenuTableViewController
        else { return }
        menuVC.didTapMenuType = { menuType in
            self.transitionToNew(view: menuType)
        }
        menuVC.modalPresentationStyle = .overCurrentContext
        menuVC.transitioningDelegate = self
        present(menuVC, animated: true)
    }
    
    private func transitionToNew(view menuType: MenuType) {
        var title = ""
        
        switch menuType {
        case .home:
            title = "Home"
        case .covid:
            title = "COVID-19"
        case .news:
            title = "News"
        case .faculties:
            title = "Faculties"
        case .events:
            title = "Events"
        case .aboutUs:
            title = "About Us"
        }
        self.title = title
    
        MainViewController.refresh?.viewRefresh(with: menuType)
    }
}
