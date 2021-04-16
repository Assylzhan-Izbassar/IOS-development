//
//  Extensions.swift
//  TwitterDemo
//
//  Created by macbook on 16.04.2021.
//

import Foundation
import UIKit
import FirebaseStorage

class ImageString {
    var url: String

    init(_ url: String) {
        self.url = url
    }
}

let imageCache = NSCache<ImageString, UIImage>()

extension UIImageView {
    
    func loadImageUsingCache(_ urlString: String) {
        
        let str = ImageString(urlString)
        
        if let cachedImage = imageCache.object(forKey: str) {
            self.image = cachedImage
            return
        }
        
        let pathReference = Storage.storage().reference(withPath: urlString)
        
        pathReference.getData(maxSize: 1 * 1024 * 1024) { data, error in
          if let error = error {
            print(error)
            return
          } else {
            if let downloadedImage = UIImage(data: data!) {
                imageCache.setObject(downloadedImage, forKey: str)
                self.image = downloadedImage
            }
          }
        }
    }
}
