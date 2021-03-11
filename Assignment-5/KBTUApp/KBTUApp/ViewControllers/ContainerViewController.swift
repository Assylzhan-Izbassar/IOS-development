//
//  ContainerViewController.swift
//  KBTUApp
//
//  Created by macbook on 11.03.2021.
//

import UIKit

extension ContainerViewController: ViewRefreshDelegate {
    
    func viewRefresh(with menuType: MenuType) {
        print(menuType)
        self.updateView(with: menuType)
        
//        switch menuType {
//        case .home:
//            break
//        case .covid:
//            break
//        case .news:
//            break
//        case .events:
//            break
//        case .aboutUs:
//            break
//        }
    }
}

class ContainerViewController: UIViewController {
    
    // MARK: - View Pages
    
    lazy var newsContainerView: NewsContainerView = {
        var viewController = storyboard?.instantiateViewController(withIdentifier: "NewsContainerView") as! NewsContainerView
        self.addVCAsChildVC(childVC: viewController)
        
        return viewController
    }()
    
    lazy var eventsContainerView: EventsContainerView = {
        var viewController = storyboard?.instantiateViewController(withIdentifier: "EventsContainerView") as! EventsContainerView
        self.addVCAsChildVC(childVC: viewController)
        
        return viewController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MainViewController.refresh = self
        
        setupView()
    }
    
    // MARK: - View Methods
    
    private func setupView() {
        updateView(with: MenuType.news)
    }
    
    private func updateView(with menuType: MenuType) {
        newsContainerView.view.isHidden = (menuType == .news)
        eventsContainerView.view.isHidden = (menuType == .events)
    }
    
    // MARK: - Helper Methods
    
    private func addVCAsChildVC(childVC: UIViewController) {
        addChild(childVC)
        
        view.addSubview(childVC.view)
        childVC.view.frame = view.bounds
        childVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        childVC.didMove(toParent: self)
    }
    
    private func removeVCAsChildVC(childVC: UIViewController) {
        childVC.willMove(toParent: nil)
        
        childVC.view.removeFromSuperview()
        
        childVC.removeFromParent()
    }
}
