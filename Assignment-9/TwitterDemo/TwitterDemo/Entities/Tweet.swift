//
//  Tweet.swift
//  TwitterDemo
//
//  Created by macbook on 08.04.2021.
//

import Foundation

class Tweet {
    private var author: CustomUser
    private var content: String
    private var hashtag: String
    private var tweetedDate: Date
    
    var wrappedAuthor: CustomUser {
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
    
    init(_ author: CustomUser, _ content: String, _ hashtag: String, _ tweetedDate: Date) {
        self.author = author
        self.content = content
        self.hashtag = hashtag
        self.tweetedDate = tweetedDate
    }
}
