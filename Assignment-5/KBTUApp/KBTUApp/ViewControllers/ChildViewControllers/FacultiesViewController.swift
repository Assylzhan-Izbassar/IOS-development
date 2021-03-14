//
//  FacultiesViewController.swift
//  KBTUApp
//
//  Created by macbook on 12.03.2021.
//

import UIKit

class FacultyContent {
    var mainImage: UIImage
    var title: String
    var content: String
    
    init(_ mainImage: UIImage, _ title: String, _ content: String) {
        self.mainImage = mainImage
        self.title = title
        self.content = content
    }
}
enum facultyOrder: Int {
    case fge = 0
    case fegi = 1
    case fit = 2
    case fged = 3
    case bs = 4
    case ise = 5
    case kma = 6
    case smc = 7
}
class FacultiesViewController: UIViewController {
    
    private var faclutiesInfo: Array<FacultyContent> = []
    private var status: facultyOrder = facultyOrder.fge
    
    @IBOutlet weak var first: UIButton!
    @IBOutlet weak var second: UIButton!
    @IBOutlet weak var third: UIButton!
    @IBOutlet weak var fourth: UIButton!
    @IBOutlet weak var fifth: UIButton!
    @IBOutlet weak var sixth: UIButton!
    @IBOutlet weak var seventh: UIButton!
    @IBOutlet weak var eight: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        
        self.makeCorner(first)
        self.makeCorner(second)
        self.makeCorner(third)
        self.makeCorner(fourth)
        self.makeCorner(fifth)
        self.makeCorner(sixth)
        self.makeCorner(seventh)
        self.makeCorner(eight)
    }
    
    func makeCorner(_ button: UIButton) {
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.layer.borderColor =  UIColor.white.cgColor
    }
    
    
    private func setData() {
        faclutiesInfo.append(FacultyContent(UIImage.init(named: "fakgeo")!, "Faculty of Geology and Exploration", "The faculty trains specialists in the field of geological survey, prospecting, and exploration of mineral deposits that meet the requirements of the modern market and international standards. Training is carried out at two levels – bachelor's and master's degrees in Geology and exploration of mineral deposits.\nStudents study on state grants and a fee basis. Students on a commercial basis have the opportunity to receive a grant from various companies that cooperate with KBTU and provide scholarships for students.\nIn order to increase the competitiveness of graduates, the teaching staff uses the latest specialized software products and technologies, actively involving students in research projects. Specialists of industrial organizations, professors of universities near and far abroad are involved in the educational process.\nAdvantages of training in the specialty 'Geology and exploration of mineral deposits':\nhighly qualified teaching staff;\ntraining with the use of active and innovative methods;\nhigh demand for KBTU graduates in international organizations, enterprises;\nthe possibility of obtaining a high-paying job both in Kazakhstan and abroad;\nthe possibility of obtaining a double-degree postgraduate education;\nthe close relationship with subsoil user companies participating in joint training;\nKBTU is considered to be one of the best universities in the country and our students and graduates confirm this with their success."))
        faclutiesInfo.append(FacultyContent(UIImage.init(named: "fengi")!, "Faculty of Energy and Oil and Gas Industry", "\nThe oil and gas industry plays a leading role in the economy of our country. Kazakhstan is included in the list of top countries where large reserves of hydrocarbons are available, developed and produced. Therefore, the oil and gas sector of the country’s economy always needs highly qualified specialists.\nThe Faculty of Energy and Oil and Gas Industry prepares specialists for the educational program “Petroleum Engineering” at three levels of training: bachelor’s, master’s and doctoral studies. For the training of specialists, we have a qualified staff of the teaching staff; representatives of industrial enterprises are involved in teaching. The faculty is equipped with laboratories for oil engineering, drilling and drilling and grouting fluids, mechanics and general hydraulics, applied modeling of oil and gas fields using DrillSim 20, Eclipse, Petrel programs. The faculty actively cooperates with many large oil and gas companies of the country, attracts them to assist in the development of curricula for educational programs, organization of student internships, and employment of graduates. Faculty students are active members of the Society of Petroleum Engineers.\nThe faculty also provides an opportunity for graduates of APEC PetroTechnic Graduate College to undergo reduced training and receive a bachelor’s degree. The faculty prepares masters for the educational program “Industrial Project Management and Engineering” under an agreement with Agip Karachaganak B.V. and Eni Corporate University S.p.A.\nFaculty graduates are always in demand in the labor market and meet the needs of employers in the oil and gas industry.\nIf you have chosen our educational programs for higher education and as a foundation for your future profession, we believe that you will become a competitive and qualified specialist.\nTogether with you, we will achieve high achievements in the main mission of the faculty - training personnel with the necessary knowledge and competencies in the oil and gas industry and educating the future generation of the country.\nBest regards,\nDean of the Faculty of Energy and Oil and Gas Industry\nYerdos Ongarbayev."))
        faclutiesInfo.append(FacultyContent(UIImage.init(named: "fits")!, "Faculty of Information Technologies", "The Faculty of Information Technology (FIT) was established 17 years ago,  now, it is the largest Faculty of the Kazakh-British Technical University (KBTU). Thousand of our graduates are working in Kazakhstan and abroad and are connected to the FIT thanks to our very own specialization---Information Technologies. In fact, the FIT has become a very large family of like-minded and mutually connected people, who are highly qualified and skilled. These professionals are serving and participating in knowledge generation in various parts of the world and at the same time are contributing in the growth and development of the KBTU Faculty of Information Technology."))
        faclutiesInfo.append(FacultyContent(UIImage.init(named: "fged")!, "Faculty of General Education", "I want to personally welcome you to our General Education Faculty. The faculty lives like a reef colony, united in a pursuit of knowledge on the grounds of which you can move to the chosen goal – gaining the quality professional education more confidently, efficiently and persistently.\nThe teaching staff of our faculty will teach you the set of disciplines that will open the world of knowledge about the mankind, society, cultural combination and global tendencies of the modernity, and meaning of modernization. Those will not be some routine lectures teeming with endless lists of names, dates, facts and events. Thanks to the pedagogical experience and skills, and highly-professional competencies of our teachers you will enjoy the participation in the process of constructive involvement, collaboration and perceptual creativity.\nParticularly, during the lessons on humanitarian disciplines you will obtain the skill and ability to discourse in the context of humanitarian values and their rational meanings, you will learn to form your views into logical written texts and essays, overcome being tongue-tied and will get rid of the lexical primitiveness, as you will gain the skill of smart use of the academic language.\nOur faculty is the heart and soul of the social student life. I am sure you will plunge into it with pleasure, demonstrate your qualities as an initiative, communicative personality, able to work in team and probably able to become its leader."))
        faclutiesInfo.append(FacultyContent(UIImage.init(named: "fakbiz")!, "Business School", "The KBTU Business School has experienced tremendous development since the establishment of the University in 2001. We are proud of who we are today, what values we bring to the society and the development of future leaders of Kazakhstan. Being the leader school in business education in the country, we are continuously upgrading our content and delivery methods.\nOur undergraduate and graduate programs are exclusively taught in English by top international and local faculty and are recognized by professional bodies such as CFA, ACCA, and CIMA. Furthermore, we are glad to announce that the KBTU Business School is candidate for the prestigious ACBSP accreditation by the American Accreditation Council.\nBeing a part of KBTU and having the vision for providing world class education and learning in the heart of Almaty, we are working hard on building the best quality partnerships with our individual and corporate partners both locally and internationally. For example, our students are exposed to international experience through exchange programs such as Erasmus+ and Abay-Verne. Moreover, the KBTU School is accredited by the  prestigious accreditation by the Accreditation Council for Business School and Programs (ACBSP).\nAre you looking for a top notch business school in Kazakhstan? The KBTU Business School is where your needs and expectations are going to be met."))
        faclutiesInfo.append(FacultyContent(UIImage.init(named: "ekonom")!, "International School of Economics", "International School of Economics is a unique faculty of KBTU that has been a recognized teaching center of the University of London since 2005.  All our students study for the University of London degree under the academic direction of the London School of Economics (LSE). It means that the study materials for each course are developed by one of the top universities in social sciences in the world, which is also one of the institutions of the University of London.  Consequently, our students pass both internal exams of KBTU and external exams of the University of London.\nWorld class faculty members with doctoral degrees from the best universities around the world are there to help you successfully complete your studies in ISE and achieve your goals. Our staff is committed to student success.\nISE has been a place of outstanding scholarly activities and excellence for many years. We teach our students not only how to study and apply their knowledge but also to be leaders and critical thinkers. Our students are competitive in the global markets which is reflected in their placements both in international companies and top western universities. We are looking for ambitious and hardworking students!\nIn 2020, ISE programs were extended to include a prestigious Data Science and Business Analytics program. This program is increasingly demanded in the modern workplace as data science analysis is expected to revolutionize our everyday life and change the social landscape.\nOn behalf of our faculty and staff let me welcome you in ISE, KBTU!"))
        faclutiesInfo.append(FacultyContent(UIImage.init(named: "kma")!, "Kazakhstan Maritime Academy", "Welcome to the Kazakhstan Maritime Academy.\nThe KMA educates and trains young men and women to become internationally recognized qualified navigators and marine engineers. These highly skilled merchant marine professionals can work anywhere in the world, either at sea or on shore. Our graduates can perform a wide range of professional duties in areas such as shipbuilding, chartering, laws of the sea, shipbuilding management, repair and maintenance of ships, as well as in related technical areas such as energy supply, energy management and application of renewable energy resources.\nHistorically, maritime professions have always been in demand. Maritime professions are often highly paid and have bright career prospects. Seafarers work on passenger and fishing vessels, bulk carriers and ferries, tankers and container ships. Our graduates do not always work at sea; there is a huge demand for our specialists on shore as well. The crew of a ship includes several different specialists: Marine engineers, and Deck officers. To become Ship's Captain is the main goal of each graduate. Education in Nautical Sciences is required to obtain this position. Marine Engineers, in turn, are the direct organizers of the vessel's energy supply and auxiliary machinery; they keep vessel's engine in the right modes, control and regulate electrical equipment, and much more. KMA graduates work as Deck Officers, shipbuilders and manage maintenance of the ships, ship electricians, mechanics, Chief Officers, and Chief Engineers.\nDmitry Kovtunenko "))
        faclutiesInfo.append(FacultyContent(UIImage.init(named: "math")!, "School of Mathematic and Cybernetics", "A degree in mathematics and applied mathematics opens doors to solid and successful career because mathematics is the foundation of everything. The SMC is one of the youngest faculties of the KBTU. We are proud of our strong faculty and popular programs. While studying at the SMC, students gain fundamental knowledge of mathematics and its various applications, practice high-performance computing, and participate in research seminars and projects. In addition, our students have the opportunity to study optimal management and learn to make effective management decisions.\nWe have bachelors and masters programs in “Mathematical and Computer Modeling” and also offer PhD study in the same specialty. In addition, there is a dissertation council for the defense of doctoral theses in the specialty “Mathematical and Computer Modeling”.\nAt KBTU, we believe in integrated teaching and learning approach and offer interdisciplinary learning programs. As a student, you will have the opportunity to study both the basic and elective courses at the SMC and also at the other schools of the KBTU. This interdisciplinary education will diversify your knowledge and learning experience. Moreover, the acquired knowledge and the desire for continuous self-improvement will help you to adapt in future work, since in the future universal specialists will be more in demand.\nAssylbek Issakhov"))
    }
    
    @IBAction func FCE(_ sender: UIButton) {
        status = facultyOrder.fge
    }
    @IBAction func FEGI(_ sender: UIButton) {
        status = facultyOrder.fegi
    }
    @IBAction func FIT(_ sender: UIButton) {
        status = facultyOrder.fit
    }
    @IBAction func FGE(_ sender: UIButton) {
        status = facultyOrder.fged
    }
    @IBAction func BS(_ sender: UIButton) {
        status = facultyOrder.bs
    }
    @IBAction func ISE(_ sender: UIButton) {
        status = facultyOrder.ise
    }
    @IBAction func KMA(_ sender: UIButton) {
        status = facultyOrder.kma
    }
    @IBAction func SMC(_ sender: UIButton) {
        status = facultyOrder.smc
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! FacultiesInfoViewController
        
        dest._title = faclutiesInfo[status.rawValue].title
        dest._content = faclutiesInfo[status.rawValue].content
        dest._image = faclutiesInfo[status.rawValue].mainImage
    }
}
