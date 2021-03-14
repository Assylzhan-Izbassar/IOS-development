//
//  VisionViewController.swift
//  KBTUApp
//
//  Created by macbook on 14.03.2021.
//

import UIKit

class VisionViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: myLabel.bottomAnchor).isActive = true
        
        myLabel.text = "VISION\nWe will be on par with the fast and unprecedented technological and scientific advances by offering the latest mathematical knowledge and skills that ensure problem solving, accuracy, relevance and excellence.\nMISSION\nTo prepare and train accurate and efficient problem solvers who will have the core knowledge of mathematical concepts and the skills to understand and apply their core knowledge in solving problems in variety of situations. We ensure creating an environment where professors and students have numerous interaction and problem solving opportunities through innovative teaching, learning and research methods.\nStrategic Goals:\nThe Faculty seeks to improve the quality of the educational process by introducing modern methods and methods of teaching, updating and creating new mathematical courses that take into account the needs of the developing oil and gas industry of the Republic of Kazakhstan.\nOur other core goals are:\n - To create mathematical models of technical or economic problems\n - To check the adequacy, accuracy of the constructed mathematical model\n - Solving mathematical problems\n - Applications of the results to predict"
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
