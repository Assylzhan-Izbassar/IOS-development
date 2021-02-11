//
//  ContactInfoViewController.swift
//  Contact Book
//
//  Created by macbook on 11.02.2021.
//

import UIKit

class ContactInfoViewController: UIViewController {

    @IBOutlet weak var image: UIImageView?
    @IBOutlet weak var name: UILabel?
    @IBOutlet weak var surName: UILabel!
    @IBOutlet weak var phoneNum: UILabel!
    
    var _name = ""
    var _surName = ""
    var _phoneNum = ""
    var _image = UIImage()
    private var id: Int?
    private var model = ContactModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name!.text = _name
        surName.text = _surName
        phoneNum.text = _phoneNum
        image!.image = _image
    }
    
    func clearString(_ number: String) -> String {
        var result = ""
        for x in number{
            if x != " " {
                result.append(x)
            }
        }
        return result
    }
    

    @IBAction func callToNumber(_ sender: Any) {
        
        let result = clearString(_phoneNum)
        
        if let url = URL(string: "tel://\(result)") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }else{
                print("Can not call!")
            }
        }else{
            print(result)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ViewController
        
        if let x = id {
            destination.model.deleteContact(byId: x)
        }
        destination.myTable.reloadData()
    }
    
    func setId(_ id: Int){
        self.id = id
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
