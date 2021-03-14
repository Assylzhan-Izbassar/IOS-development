//
//  AlumniViewController.swift
//  KBTUApp
//
//  Created by macbook on 14.03.2021.
//

import UIKit

class AlumniViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: myLabel.bottomAnchor).isActive = true
        
        myLabel.text = "Welcome to the KBTU Alumni Association webpage. KBTU graduates are recognized internationally among the best qualified and skilled scientists, technicians and professionals.  We take pride to inform that KBTU graduates work for top brands such as Google, Microsoft, Facebook, Twitter, Booking.com and many more leading IT companies in various parts of the world, including the Silicon Valley.  National and international oil and gas companies such as KazMunaiGas, TCO, NCOC, Schlumberger, Halliburton, Baker Hughes, Karachaganak Petroleum Operating, Eni have been hiring our graduates. Successful Kazakhstani and international businesses will continue to hire KBTU graduates because our graduates are competent specialists and excellent performers who are capable of delivering superb results and services.\nKBTU alumni are our goodwill ambassadors and we try to stay in touch with them wherever they are. For years, we have been actively working with thousands of KBTU graduates around the world and inform and involve them in the activities of their Alma Mater. Thanks to the extensive network of partner universities and the involvement of large companies in Kazakhstan and abroad (through the KBTU Advisory Council), we provide all possible assistance and support to our students in finding employment and keeping in touch with our graduates.\nThe KBTU Alumni Association believes in long lasting and strong bonds of friendship and brotherhood. Competence, professionalism, integrity, dedication and efficiency are our shared traits and values.  The relationship between the KBTU and its graduates does not end and should not be interrupted after graduation. Your positive and productive contributions are crucial for the growth and development of your Alma Mater. With your help and support KBTU continues to change for the better. This Institution will remain a symbol of pride for you in your career and life.\nThe Endowment Foundation of the KBTU has been functioning since 2018. It was created to strengthen KBTU’s mission and reputation through charitable projects. By making a contribution to the Endowment Foundation, it is you who can influence the improvement and development of your University and its current students.\nWe are happy to keep in touch with our graduates and always welcome their suggestions, advice and questions! Please contact us via e-mail (e.smolyakova@kbtu.kz);\n - via the FB page (https://www.facebook.com/groups/kbtuofficialgroup/);\n - via Instagram page (@kbtu_official)\n- Telegram channel t.me/KBTU_graduates\nBest wishes and good luck,\nYours,\nEkaterina Smolyakova,\nVice Rector for organizational and educational work\nTelephone No. 357 42 11, ext. 124"
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
