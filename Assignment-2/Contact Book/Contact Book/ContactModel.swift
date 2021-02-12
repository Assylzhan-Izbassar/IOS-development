//
//  ContactModel.swift
//  Contact Book
//
//  Created by macbook on 10.02.2021.
//

import Foundation
import UIKit

struct ContactModel {
    private(set) static var contacts: Array<Contact>? = Array<Contact>()
    
    init(){
    }
    
    mutating func addContact(_ newContact: Contact?) {
        if let x = newContact {
            ContactModel.contacts?.append(x)
        }
    }
    
    mutating func deleteContact(_ indexPath: IndexPath) {
        ContactModel.contacts?.remove(at: indexPath.row)
    }
    mutating func deleteContact(byId id: Int) {
        ContactModel.contacts?.remove(at: id)
    }
    
    mutating func editContact(_ id: Int, _ edited: Contact){
        print(id)
        for item in ContactModel.contacts! {
            print(item.name)
        }
        ContactModel.contacts?[id].name = edited.name
        ContactModel.contacts?[id].surname = edited.surname
        ContactModel.contacts?[id].phoneNumber = edited.phoneNumber
    }
    
    mutating func createTestData(){
        ContactModel.contacts?.append(Contact("Assyl", "Izbassar", "+7 776 874 93 03", UIImage.init(named: "male")!))
        ContactModel.contacts?.append(Contact("Yuliya", "Ivanova", "+1 432 324 23 32", UIImage.init(named: "female")!))
        ContactModel.contacts?.append(Contact("Jack", "Junior", "+7 754 423 43 43", UIImage.init(named: "male")!))
    }
}
