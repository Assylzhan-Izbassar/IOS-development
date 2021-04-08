//
//  User.swift
//  TwitterDemo
//
//  Created by macbook on 08.04.2021.
//

import Foundation
import UIKit

class User {
    private var name: String
    private var surname: String
    private var birthday: Date
    private var email: String
    private var password: String
    private var picture: UIImage?
    
    private var tweets = Array<Tweet>()
    
    var wrappedName: String {
        get { return name }
        set { name = newValue }
    }
    
    var wrappedSurname: String {
        get { return surname }
        set { surname = newValue }
    }
    
    var wrappedBirthday: Date {
        get { return birthday }
        set { birthday = newValue }
    }
    
    var wrappedEmail: String {
        get { return surname }
    }
    
    var wrappedPassword: String {
        get { return surname }
    }
    
    var wrappedPicture: UIImage {
        get { return picture ?? UIImage() }
        set { picture = newValue }
    }
    
    var wrappedTweets: Array<Tweet> {
        get { return tweets }
    }
    
    init(_ name: String, _ surname: String, _ birthday: Date, _ email: String, _ password: String) {
        self.name = name
        self.surname = surname
        self.email = email
        self.password = password
        self.birthday = birthday
    }
    
    func addTweet(_ newTweet: Tweet) {
        tweets.append(newTweet)
    }
    
    func deleteTweet(_ tweetID: Int) {
        tweets.remove(at: tweetID)
    }
    
    func editTweet(_ tweetID: Int, _ tweet: Tweet) {
        if tweetID + 1 <= tweets.count {
            tweets[tweetID].wrappedAuthor = tweet.wrappedAuthor
            tweets[tweetID].wrappedContent = tweet.wrappedContent
            tweets[tweetID].wrappedHashTag = tweet.wrappedHashTag
            tweets[tweetID].wrappedDate = tweet.wrappedDate
        }
    }
}
