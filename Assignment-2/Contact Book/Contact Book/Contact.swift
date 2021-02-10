//
//  Contact.swift
//  Contact Book
//
//  Created by macbook on 10.02.2021.
//

import Foundation
import UIKit

class Contact{
    var name : String
    var surname : String
    var phoneNumber : String
    var image : UIImage
    
    init(_ name: String, _ surname: String, _ phoneNumber: String, _ image : UIImage){
        self.name = name
        self.surname = surname
        self.phoneNumber = phoneNumber
        self.image = image
    }
}
