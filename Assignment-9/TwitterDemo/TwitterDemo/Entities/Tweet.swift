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
    
    var data: [String: String] {
        return [
            "tweet" : content,
            "author" : author,
            "tweetedDate" : dateToStr,
            "hashtag" : hashtag
        ]
    }
    
    var wrappedAuthor: String {
        get { return author }
        set { author = newValue }
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
            dateFormatter.dateFormat = "YY/MM/dd"
            
            return dateFormatter.string(from: wrappedDate)
        }
    }
    
    init(snapshot: DataSnapshot) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YY/MM/dd"
        
        let value = snapshot.value as! [String: String]
        
        self.author = value["author"] ?? ""
        self.content = value["tweet"] ?? ""
        self.hashtag = value["hashtag"] ?? ""
        self.tweetedDate = dateFormatter.date(from: value["tweetedDate"]!) ?? Date()
    }
    
    init(_ author: String, _ content: String, _ hashtag: String, _ tweetedDate: Date) {
        self.author = author
        self.content = content
        self.hashtag = hashtag
        self.tweetedDate = tweetedDate
    }
}
