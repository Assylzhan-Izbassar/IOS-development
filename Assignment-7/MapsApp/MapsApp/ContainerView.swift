//
//  ContainerView.swift
//  MapsApp
//
//  Created by macbook on 27.03.2021.
//

import UIKit

extension ContainerView: AnnotationViewDelegate {
    func showAnnotationView(_ isHidden: Bool){
        self.isHidden = isHidden
    }
}

class ContainerView: UIView {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        ViewController.delegate = self
    }

}
