//
//  ViewController.swift
//  MapsApp
//
//  Created by macbook on 21.03.2021.
//

import UIKit
import MapKit
import CoreData

class ViewController: UIViewController {
    
    /**
        Fields
     */
    @IBOutlet weak var myMapView: MKMapView!
    private var mapTypes: [Int: MKMapType] = [0: .standard, 1: .satellite, 2: .hybrid]
    var annotations: [NSManagedObject] = []
    var isInit: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myMapView.register(CustomAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        CustomAnnotationView.delegate = self
        AnnotationsViewController.delegate = self
    }
    
    /**
        Fetching the data from CoreData
     */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        guard
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
        else {
            return
        }
      
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CustomAnnotation")
      
        do {
            annotations = try managedContext.fetch(fetchRequest)
            
            if !isInit {
                loadAnnotations()
                isInit = true
            }
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    func loadAnnotations() {
        for object in annotations {
            let annotation = MKPointAnnotation()
            annotation.title = object.value(forKey: "title") as? String
            annotation.subtitle = object.value(forKey: "subtitle") as? String
            annotation.coordinate = CLLocationCoordinate2D(latitude: object.value(forKey: "latitude") as! CLLocationDegrees, longitude: object.value(forKey: "longitude") as! CLLocationDegrees)
            
            self.myMapView.addAnnotation(annotation)
        }
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
            
            self?.save(annotation)
            
            self?.myMapView.addAnnotation(annotation)
        }
        
        let cancelBtn = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alertController.addAction(saveBtn)
        alertController.addAction(cancelBtn)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Saving data to CoreData
    
    func save(_ newAnnotation: MKPointAnnotation) {
    
        guard
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
        else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "CustomAnnotation", in: managedContext)!
        let annotation = NSManagedObject(entity: entity, insertInto: managedContext)
        
        annotation.setValue(newAnnotation.title, forKeyPath: "title")
        annotation.setValue(newAnnotation.subtitle, forKeyPath: "subtitle")
        annotation.setValue(newAnnotation.coordinate.latitude, forKey: "latitude")
        annotation.setValue(newAnnotation.coordinate.longitude, forKey: "longitude")
        
        do {
            if managedContext.hasChanges {
                try managedContext.save()
                annotations.append(annotation)
            }
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EditViewController {
            destination._title = (sender as! MKAnnotation).title!!
            destination._subtitle = (sender as! MKAnnotation).subtitle!!
        }
        if let destination = segue.destination as? AnnotationsViewController {
            destination.annotations = self.annotations
        }
    }
}

extension ViewController: MKMapViewDelegate, PerformSegueInfoBtn, CoreDataDelegate {
    
    func setSegueToEdit(_ annotation: MKAnnotation) {
        performSegue(withIdentifier: "EditViewController", sender: annotation)
    }
    
    func removeFromMap(_ latitude: Double, _ longitude: Double) {
        
        let annotaion = MKPointAnnotation()
        annotaion.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        self.myMapView.removeAnnotation({() -> MKAnnotation in
            for o in self.myMapView.annotations {
                if o.coordinate.latitude == annotaion.coordinate.latitude &&
                    o.coordinate.longitude == annotaion.coordinate.longitude {
                    return o
                }
            }
            return annotaion
        }())
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation { return nil }

        let reuseIdentifier = "Placemark"

        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)

        if annotationView == nil {
            annotationView = CustomAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
        } else {
            annotationView?.annotation = annotation
        }

        return annotationView
    }

    func mapView(_ mapView: MKMapView,
           annotationView view: MKAnnotationView,
           calloutAccessoryControlTapped control: UIControl) {
        performSegue(withIdentifier: "EditViewController", sender: view)
    }
}

