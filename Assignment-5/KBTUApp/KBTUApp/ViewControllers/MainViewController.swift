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

class MainViewController: UIViewController {
    
    private let transition = SideTransition()
    private var topView: UIView?

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
        let title = String(describing: menuType).capitalized
        self.title = title
        
        switch menuType {
        case <#pattern#>:
            <#code#>
        default:
            <#code#>
        }
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
