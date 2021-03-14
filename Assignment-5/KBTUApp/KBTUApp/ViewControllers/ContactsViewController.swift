//
//  ContactsViewController.swift
//  KBTUApp
//
//  Created by macbook on 12.03.2021.
//

import UIKit

class ContactsViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: myLabel.bottomAnchor).isActive = true

        myLabel.text = "Main Call-center for connection with services of KBTU\nTelephone No.  8 727 357 42 51\nE-mail: info@kbtu.kz\nkense@kbtu.kz\nFaculty of Geology and Exploration\n     Telephone No.  +7 (727) 357-42-40 ext. 326\nE-mail: z.bek@kbtu.kz\nz.tulemissova@kbtu.kz\nFaculty of Energy and Oil and Gas Industry\nTelephone No.  +7 (727) 294-00-37\nE-mail: d.kuralkhanov@kbtu.kz\nt.tikebaev@kbtu.kz\nFaculty of Information Technology\nTelephone No.  +7 (727) 357-42-40 ext. 342/343\nE-mail: f.gadzhiev@kbtu.kz\nr.nizamdinova@kbtu.kz\nSchool of Mathematics and Cybernetics\nTelephone No.  +7 (727) 357-42-40 ext. 316\nE-mail: a.isakhov@kbtu.kz\na.manapova@kbtu.kz\nKBTU Business School\nTelephone No.  +7 (727) 357-42-40 ext. 352/353\nE-mail: d.amirbekova@kbtu.kz\nm.bigabatova@kbtu.kz\nInternational School of Economics\nTelephone No.  +7 (727) 357-42-40 ext. 355\nE-mail: gavin.kbtu@gmail.com\na.islyami@kbtu.kz\nKazakhstan Maritime Academy\nTelephone No.  +7 (727) 357-42-40 ext. 392\nE-mail: d.kovtunenko@kbtu.kz\na.duisenbiev@kbtu.kz\nCenter of Chemical Engineering\nTelephone No.  +7 (727) 291-57-84\nE-mail: k.dzhamansrieva@kbtu.kz\nn.saparbaeva@kbtu.kz\nFaculty of General Education\nTelephone No.  +7 (727) 357-42-40 ext. 401/402\nE-mail: a.dzhumaseitova@kbtu.kz\nk.ermekova@kbtu.kz\nThe Center of Postgraduate Studies\nTel:  +7 (727) 357-42-40 ext. 443\nE-mail: g.yestekova@kbtu.kz\nr.zhagabaeva@kbtu.kz\nCareer Center\nTelephone No. +7 (727) 357-42-11 ext.124 / 126/nE-mail: z.besimbaeva@kbtu.kz/nm.dabylova@kbtu.kz/nEditorial Office of the Academic Journal ‘KBTU Bulletin’\nTelephone No.  +7 (727) 357 42 26/nHuman Resources Department\nTel: +7 (727) 357 42 49/nE-mail: v.gridneva@kbtu.kz/nd.baybarakova@kbtu.kz/nPublishing Center/nTelephone No.   +7 (727) 357 42 38/nE-mail: a.izbassarov@kbtu.kz/nic@kbtu.kz/nFee Department/nTelephone No.  +7 (727) 357 42 42/nE-mail: a.suindykova@kbtu.kz/nz.azhibaeva@kbtu.kz/nInternational Department/nTelephone No.  +7 (727) 357 42 16/nE-mail: international@kbtu.kz/nKBTU Helpline/nATTENTION! Dear KBTU students and staff,/nPlease call the Helpline: 357-42-45, ext.540, if you notice, experience, encounter any unlawful act, violent behavior, violation of internal rules or discipline inside the university premises. Confidentiality is guaranteed!"
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
