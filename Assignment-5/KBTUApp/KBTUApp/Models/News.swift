//
//  News.swift
//  KBTUApp
//
//  Created by macbook on 12.03.2021.
//

import Foundation
import UIKit

class News {
    
    var newsTitle: String?
    var content: String?
    var meta: String
    var image: UIImage
    static var date: String = "10 March 2021"
    static var meta_image: UIImage = UIImage.init(named: "clock-solid")!
    
    init(_ meta: String, _ image: UIImage) {
        self.image = image
        self.meta = meta
    }
    convenience init(_ title: String, _ content: String, _ meta: String, _ image: UIImage) {
        self.init(content, image)
        self.content = content
        self.newsTitle = title
    }
}
