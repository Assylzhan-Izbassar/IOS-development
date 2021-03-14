//
//  DormitoryViewController.swift
//  KBTUApp
//
//  Created by macbook on 14.03.2021.
//

import UIKit

class DormitoryViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: myLabel.bottomAnchor).isActive = true
        
        self.makeCorner(myButton, UIColor(red: 53/255.0, green: 91/255.0, blue: 163/255.0, alpha: 1.00).cgColor)
        
        myLabel.text = "   For non-resident and international students in need of housing, KBTU provides places in our state- of- art Student residence that comprises four large buildings that can house 852 students. It is not an ordinary student residence. It is like real home with very comfortable and clean rooms, sitting rooms, green open spaces in a quiet area.\nAll the four buildings have excellent living conditions and superb sanitary services.  The buildings and residence sections include one, two, three and four bedrooms for undergraduate, postgraduate and doctoral students.\nFacilities:\n24-hours security\nAll the student housing spots are under CCTV surveillance cameras and security personnel. Each building has its own entrance card non-identical to the rest.\nWi-fi\nRooms have Internet cables launched and wi-fi everywhere around the campus.\n2 cafes\nOne for 12 seats, the other for 60 seats (the menu is prepared in consultation students)\nLibrary\nA library and separate reading rooms with a variety of literature and periodicals.\nIndoor and outdoor sports facilities\nGym, on-campus football fields are available for students’ active free time-spending.\nMedical  rooms\nIn case a student needs help whenever it is needed medical rooms are equipped with necessary provisions to get it on time. \nCosts:\nSingle bedroom -35000 tenge\nDouble bedroom - 25 000 tenge\nTree - beds room  -  20000 tenge\nFour - beds room -16500 tenge\nLiving cost per month includes room rent, services charges and utilities.\nEvery year we carry out maintenance work and make improvements in students’ living conditions that also include repair and replacement of house hold appliances, equipment and furniture.\nInternational students wishing to stay in the KBTU student residence must indicate to the     international office about reserving a place at the student residence as places are limited.\nThe international office will provide list requirements for finding a place in the student residence."
    }
    
    
    func makeCorner(_ button: UIButton, _ borderColor: CGColor) {
        button.layer.cornerRadius = 7
        button.layer.borderWidth = 2
        button.layer.borderColor =  borderColor
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
