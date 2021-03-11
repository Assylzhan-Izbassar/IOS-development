//
//  SideTransition.swift
//  KBTUApp
//
//  Created by macbook on 11.03.2021.
//

import UIKit

class SideTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    private var isPresening = false
    private let dimmingView = UIView()
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard
            let toViewController = transitionContext.viewController(forKey: .to),
            let fromViewController = transitionContext.viewController(forKey: .from)
        else { return }
        
        let containerView = transitionContext.containerView
        
        let finalWidth = toViewController.view.bounds.width * 0.8
        let finalHight = toViewController.view.bounds.height
        
        if isPresening {
            
            // Add a dimming view
            dimmingView.backgroundColor = .black
            dimmingView.alpha = 0.0
            containerView.addSubview(dimmingView)
            dimmingView.frame = containerView.bounds
            // Add menu view controller to container VC
            containerView.addSubview(toViewController.view)
            
            // Initial frame off the screen
            toViewController.view.frame = CGRect(x: -finalWidth, y: 0, width: finalWidth, height: finalHight)
        }
        
        // Have to animate it -> group to enclosure
        let transform = {
            self.dimmingView.alpha = 0.5
            toViewController.view.transform = CGAffineTransform(translationX: finalWidth, y: 0)
        }
        
        // Animate back off screen, i.e. reset it
        let identity = {
            self.dimmingView.alpha = 0.0
            fromViewController.view.transform = .identity // to 35 stroke of code
        }
        
        // Animation of the transition
        let duration = transitionDuration(using: transitionContext)
        let isCanceled = transitionContext.transitionWasCancelled
        
        UIView.animate(withDuration: duration, animations: {
            self.isPresening ? transform() : identity()
        }) { (_) in
            transitionContext.completeTransition(!isCanceled)
        }
    }
    
    func getIsPresenting() -> Bool {
        return self.isPresening
    }
    
    func setIsPresenting(_ value: Bool) {
        self.isPresening = value
    }
}
