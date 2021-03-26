//
//  AnnotationsViewController.swift
//  MapsApp
//
//  Created by macbook on 26.03.2021.
//

import UIKit
import CoreData
import MapKit

protocol CoreDataDelegate: class {
    func removeFromMap(_ latitude: Double, _ longitude: Double)
    func zoomToAnnotation(_ coordinate: CLLocationCoordinate2D, _ title: String)
    func showAnnotations()
    func setNavTitle(_ title: String)
}

extension AnnotationsViewController: AnnotationViewDataSource {
    func refershData() {
        guard
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
        else {
            return
        }
      
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CustomAnnotation")
      
        do {
            annotations = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        myTable.reloadData()
    }
}

class AnnotationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTable: UITableView!
    
    var annotations: [NSManagedObject] = []
    static var delegate: CoreDataDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTable.dataSource = self
        myTable.delegate = self
        
        ViewController.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedIndexPath = myTable.indexPathForSelectedRow {
            myTable.deselectRow(at: selectedIndexPath, animated: animated)
        }
        
        // fetching the data
        self.refershData()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return annotations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let annotation = annotations[indexPath.row]
        let cell = myTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = annotation.value(forKey: "title") as? String
        cell.detailTextLabel?.text = annotation.value(forKey: "subtitle") as? String
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        let object = annotations[indexPath.row]
        annotations.remove(at: indexPath.row)
        removeAnnotaion(object)

        myTable.deleteRows(at: [indexPath], with: .automatic)
    }

    func removeAnnotaion(_ annotation: NSManagedObject) {
        
        AnnotationsViewController.delegate?.setNavTitle("Maps")
        // remove from the map
        AnnotationsViewController.delegate!.removeFromMap((annotation.value(forKey: "latitude") as? Double)!, (annotation.value(forKey: "longitude") as? Double)!)
        
        // remove from the core data
        guard
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
        else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        managedContext.delete(annotation)
        do {
            if managedContext.hasChanges {
                try managedContext.save()
            }
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        let coordinateIndex = myTable.indexPath(for: (sender as! UITableViewCell))!.row
        let longitude = annotations[coordinateIndex].value(forKey: "longitude") as! CLLocationDegrees
        let latitude = annotations[coordinateIndex].value(forKey: "latitude") as! CLLocationDegrees
        let title = annotations[coordinateIndex].value(forKey: "title") as! String
        
        AnnotationsViewController.delegate?.zoomToAnnotation(CLLocationCoordinate2D(latitude: latitude, longitude: longitude), title)
        AnnotationsViewController.delegate?.showAnnotations()
    }

}
