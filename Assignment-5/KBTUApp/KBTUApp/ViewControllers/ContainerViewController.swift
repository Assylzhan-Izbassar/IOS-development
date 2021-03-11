//
//  ContainerViewController.swift
//  KBTUApp
//
//  Created by macbook on 11.03.2021.
//

import UIKit

extension ContainerViewController: ViewRefreshDelegate {
    
    func viewRefresh(with menuType: MenuType) {
        self.updateView(with: menuType)
    }
}

class ContainerViewController: UIViewController {
    
    // MARK: - View Pages
    
    lazy var homeContainerView: HomeContainerView = {
        var viewController = storyboard?.instantiateViewController(withIdentifier: "HomeContainerView") as! HomeContainerView
        self.addVCAsChildVC(childVC: viewController)
        
        return viewController
    }()
    
    lazy var covidContainerView: CovidContainerView = {
        var viewController = storyboard?.instantiateViewController(withIdentifier: "CovidContainerView") as! CovidContainerView
        self.addVCAsChildVC(childVC: viewController)
        
        return viewController
    }()

    
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
    
    lazy var aboutContainerView: AboutContainerView = {
        var viewController = storyboard?.instantiateViewController(withIdentifier: "AboutContainerView") as! AboutContainerView
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
        updateView(with: MenuType.home)
    }
    
    private func updateView(with menuType: MenuType) {
        homeContainerView.view.isHidden = !(menuType == .home)
        covidContainerView.view.isHidden = !(menuType == .covid)
        newsContainerView.view.isHidden = !(menuType == .news)
        eventsContainerView.view.isHidden = !(menuType == .events)
        aboutContainerView.view.isHidden = !(menuType == .aboutUs)
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
