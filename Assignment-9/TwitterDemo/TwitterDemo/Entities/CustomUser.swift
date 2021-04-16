//
//  User.swift
//  TwitterDemo
//
//  Created by macbook on 08.04.2021.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase

class CustomUser {
    private var name: String
    private var surname: String
    private var birthday: Date
    private var pictureURL: String
    private var email: String
    private var id: String
    
    var data: [String: String] {
        return [
            "id" : wrappedId,
            "name" : wrappedName,
            "surname" : wrappedSurname,
            "email": wrappedEmail,
            "birthday" : dateToStr,
            "pictureURL" : wrappedPictureURL
        ]
    }
    
    var wrappedId: String {
        get {return id}
        set {id = newValue}
    }
    
    var wrappedName: String {
        get { return name.prefix(1).capitalized + name.dropFirst() }
        set { name = newValue }
    }
    
    var wrappedSurname: String {
        get { return surname.prefix(1).capitalized + surname.dropFirst() }
        set { surname = newValue }
    }
    
    var fullName: String {
        get {
            return wrappedName + " " + wrappedSurname
        }
    }
    
    var wrappedEmail: String {
        get { return email }
        set { email = newValue }
    }
    
    var wrappedBirthday: Date {
        get { return birthday }
        set { birthday = newValue }
    }
    
    var wrappedPictureURL: String {
        get { return pictureURL }
        set { pictureURL = newValue }
    }
    
    var dateToStr: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat =  "dd/MM/yy"
            
            return dateFormatter.string(from: wrappedBirthday)
        }
    }
    
    init(_ id: String, _ name: String, _ surname: String, _ email: String, _ birthday: Date, _ pictureName: String) {
        self.name = name
        self.surname = surname
        self.email = email
        self.birthday = birthday
        self.pictureURL = pictureName
        self.id = id
    }
    
    init(snapshot: DataSnapshot) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "dd/MM/yy"
        
        let value = snapshot.value as! [String: String]
        
        name = value["name"] ?? ""
        surname = value["surname"] ?? ""
        email = value["email"] ?? ""
        birthday = dateFormatter.date(from: value["birthday"]!) ?? Date()
        pictureURL = value["pictureURL"] ?? ""
        id = value["id"] ?? ""
    }
}
