//
//  PhoneContext.swift
//  AnimationApp
//
//  Created by macbook on 01.04.2021.
//

import Foundation

struct PhoneContext {
    static var phones: Array<Phone> = Array<Phone>()
    
    init(){demoData()}
    
    func addPhone(_ newPhone: Phone) {
        PhoneContext.phones.append(newPhone)
    }
    
    func demoData() {
        addPhone(Phone("iPhone 7 Plus", "350$", "A10 Fusion", 12))
        addPhone(Phone("Samsung Galaxy S8", "500$", "Snapgragon 835", 12))
        addPhone(Phone("LG G4", "400$", "Snapgragon 808", 16))
        addPhone(Phone("Nexus 6P", "700$", "Snapgragon 810", 12.3))
        addPhone(Phone("HTC One M9", "500$", "Snapgragon 810", 20))
        addPhone(Phone("Google Pixel", "650$", "Snapgragon 821", 12))
    }
    
}
