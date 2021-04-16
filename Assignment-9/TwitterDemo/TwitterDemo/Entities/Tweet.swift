//
//  Tweet.swift
//  TwitterDemo
//
//  Created by macbook on 08.04.2021.
//

import Foundation
import FirebaseDatabase

class Tweet {
    private var author: String
    private var content: String
    private var hashtag: String
    private var tweetedDate: Date
    private var fullName: String
    private var pictureName: String?
    
    var user: CustomUser?
    
    var data: [String: String] {
        return [
            "tweet" : wrappedContent,
            "author" : wrappedAuthor,
            "tweetedDate" : dateToStr,
            "hashtag" : wrappedPictureUrl,
            "fullname": wrappedFullname,
            "pictureName": user?.wrappedPictureURL ?? ""
        ]
    }
    
    var wrappedAuthor: String {
        get { return author }
        set { author = newValue }
    }
    
    var wrappedFullname: String {
        get { return fullName }
        set { fullName = newValue }
    }
    
    var wrappedPictureUrl: String {
        get { return pictureName ?? "default" }
        set { pictureName = newValue }
    }
    
    var wrappedContent: String {
        get { return content }
        set { content = newValue }
    }
    
    var wrappedHashTag: String {
        get { return hashtag }
        set { hashtag = newValue }
    }
    
    var wrappedDate: Date {
        get { return tweetedDate }
        set { tweetedDate = newValue }
    }
    
    var dateToStr: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/YY"
            
            return dateFormatter.string(from: wrappedDate)
        }
    }
    
    init(snapshot: DataSnapshot) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YY"
        
        let value = snapshot.value as! [String: String]
        
        self.author = value["author"] ?? ""
        self.content = value["tweet"] ?? ""
        self.hashtag = value["hashtag"] ?? ""
        self.fullName = value["fullname"] ?? ""
        self.tweetedDate = dateFormatter.date(from: value["tweetedDate"]!) ?? Date()
        self.pictureName = value["pictureName"] ?? ""
    }
    
    init(_ author: String, _ fullname: String, _ content: String, _ hashtag: String, _ tweetedDate: Date) {
        self.author = author
        self.content = content
        self.hashtag = hashtag
        self.tweetedDate = tweetedDate
        self.fullName = fullname
    }
    
    convenience init(_ author: String, _ fullname: String, _ pictureUrl: String, _ content: String, _ hashtag: String, _ tweetedDate: Date) {
        self.init(author, fullname, content, hashtag, tweetedDate)
        self.pictureName = pictureUrl
    }
}
