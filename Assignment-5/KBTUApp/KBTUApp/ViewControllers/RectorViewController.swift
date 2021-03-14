//
//  RectorViewController.swift
//  KBTUApp
//
//  Created by macbook on 14.03.2021.
//

import UIKit

class RectorViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: myLabel.bottomAnchor).isActive = true

        myLabel.text = "Education (IQQA).We aspire to become one of the top entrepreneurial institutions in the Eurasian region. Our main goal is to contribute in Kazakhstan’s scientific, entrepreneurial and economic development by preparing highly qualified and trained scholars, scientists and professionals.\nWe build bridges between science and society and between Kazakhstan and outer world in scientific, technical and business fields. It is a big challenge but we have confidence in our own capabilities and strengths; and also in the institutions, state bodies, scientific organizations and businesses with which we collaborate in our journey to excellence. Our interests stretch beyond merely one field. We work with a variety of partners, stakeholders in areas such as joint research projects and expertise exchanges.\nInnovation and creativity as well as curiosity and imagination of our scholars, experts and students have helped KBTU to produce excellent research and innovative projects. We perform scientific and technological tasks and resolve challenges through enquiry. We work hand in hand with regional businesses and industry to remain the best center of scientific and technical innovations in Central Asia.\nKBTU designs and improves its study and training programs in consultation with various enterprises and industries. Top managers of reputed companies sit on the KBTU Advisory Board. Our Industrial Committees include technical experts. Thanks to their participation and contributions KBTU training programs are of the highest quality and most relevant. Our active interaction with the business and industry make KBTU an attractive university for both Kazakhstani and foreign students.\nNinety eight percent of KBTU graduates find employment within months after graduation, or move on to higher studies. Some are invited by companies during their studies. Many of our graduates work in leading international IT and oil and gas companies, including the Silicon Valley.\nWe are proud of our highly qualified teachers, including well-known scientists. KBTU has modern scientific laboratories where researchers and students work on numerous projects.\nOne of the priorities of the KBTU strategy is internationalization. We have established partnerships and cooperation with the world's best universities, such as the University of London, Harvard Business School and many others. We are members of teacher and student exchange programs, including Erasmus + and Bolashak. The university is increasing the number of places for foreign students and scholars. Please consider joining our large and friendly family as a student or researcher! Together we can achieve a lot!\nTowards the end, on behalf of the KBTU management, I would like to thank our shareholder, the Ministry of Education and Science of RK, partner organizations and, of course, our students, professors and staff for their contribution to the development of the university, and wish them continued success!\nRespectfully,\nRector KBTU\nKenzhebek Ibrashev"
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
