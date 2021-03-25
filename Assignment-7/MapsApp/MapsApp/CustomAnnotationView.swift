//
//  CustomAnnotationView.swift
//  MapsApp
//
//  Created by macbook on 24.03.2021.
//

import Foundation
import MapKit

protocol PerformSegueInfoBtn {
    func setSegueToEdit(_ annotation: MKAnnotation)
}

class CustomAnnotationView: MKPinAnnotationView  {
    
    static var delegate: PerformSegueInfoBtn?
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
        canShowCallout = true
        
        let infoBtn = UIButton(type: .infoLight)
        infoBtn.addTarget(self, action: #selector(self.buttonClicked(sender:)), for: .touchUpInside)
        rightCalloutAccessoryView = infoBtn
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @objc func buttonClicked(sender: UIButton){
        CustomAnnotationView.delegate?.setSegueToEdit(annotation!)
    }
}
