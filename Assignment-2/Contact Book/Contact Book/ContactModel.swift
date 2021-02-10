//
//  ContactModel.swift
//  Contact Book
//
//  Created by macbook on 10.02.2021.
//

import Foundation

struct ContactModel {
    private(set) var contacts: Array<Contact>?
    
    init(){
        contacts = Array<Contact>()
        contacts?.append(Contact("Assylzhan", "Izbassar", "+77717749895"))
        contacts?.append(Contact("Bob", "Simons", "+77717749895"))
        contacts?.append(Contact("Jack", "Junior", "+77717749895"))
    }
    
    mutating func addContact(_ newContact: Contact?) {
        if let x = newContact {
            contacts?.append(x)
        }
    }
}
