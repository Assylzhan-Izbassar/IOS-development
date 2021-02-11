//
//  ContactModel.swift
//  Contact Book
//
//  Created by macbook on 10.02.2021.
//

import Foundation
import UIKit

struct ContactModel {
    private(set) var contacts: Array<Contact>?
    
    init(){
        contacts = Array<Contact>()
        createTestData()
    }
    
    mutating func addContact(_ newContact: Contact?) {
        if let x = newContact {
            contacts?.append(x)
        }
    }
    
    mutating func deleteContact(_ indexPath: IndexPath) {
        contacts?.remove(at: indexPath.row)
    }
    mutating func deleteContact(byId id: Int) {
        contacts?.remove(at: id)
    }
    
    mutating func createTestData(){
        contacts?.append(Contact("Assyl", "Izbassar", "+7 776 874 93 03", UIImage.init(named: "male")!))
        contacts?.append(Contact("Yuliya", "Ivanova", "+1 432 324 23 32", UIImage.init(named: "female")!))
        contacts?.append(Contact("Jack", "Junior", "+7 754 423 43 43", UIImage.init(named: "male")!))
    }
}
