//
//  ViewController.swift
//  MapsApp
//
//  Created by macbook on 21.03.2021.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    /**
        Fields
     */
    @IBOutlet weak var myMapView: MKMapView!
    private var mapTypes: [Int: MKMapType] = [0: .standard, 1: .satellite, 2: .hybrid]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    /**
     To change type of the map throw segmented control
     */
    @IBAction func segmentSelected(_ sender: UISegmentedControl) {
        myMapView.mapType = mapTypes[sender.selectedSegmentIndex] ?? .standard
    }
    
    /**
     To add location to the map
     */
    @IBAction func longPressed(_ sender: UILongPressGestureRecognizer) {
        // converts CGPoint to Map coordinates
        let touchedPoint = sender.location(in: self.myMapView)
        let mapCoordinate = self.myMapView.convert(touchedPoint, toCoordinateFrom: self.myMapView)
        
        // show the alert
        let alertController = UIAlertController(title: "New Location", message: "Fill the fields", preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Location"
        }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Description"
        }
        
        let saveBtn = UIAlertAction(title: "OK", style: .default) { [weak self](alert) in
            let firstTextField = alertController.textFields![0] as UITextField
            let secondTextField = alertController.textFields![1] as UITextField
            
            let annotation = MKPointAnnotation()
            annotation.title = firstTextField.text
            annotation.subtitle = secondTextField.text
            annotation.coordinate = mapCoordinate
            
            self?.myMapView.addAnnotation(annotation)
        }
        
        let cancelBtn = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alertController.addAction(saveBtn)
        alertController.addAction(cancelBtn)
        
        self.present(alertController, animated: true, completion: nil)
    }
}

