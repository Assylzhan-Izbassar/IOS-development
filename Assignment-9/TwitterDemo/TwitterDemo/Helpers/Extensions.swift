//
//  Extensions.swift
//  TwitterDemo
//
//  Created by macbook on 16.04.2021.
//

import Foundation
import UIKit
import FirebaseStorage
import Dispatch

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    func loadImageUsingCache(_ urlString: String) {
        
        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            self.image = cachedImage
            return
        }
        
        let pathReference = Storage.storage().reference(forURL: "gs://twitter-8ae9b.appspot.com/\(urlString)")
        
        pathReference.getData(maxSize: 4 * 2048 * 2048) { data, error in
          if let error = error {
            print(error)
            return
          } else {
                if let downloadedImage = UIImage(data: data!) {
                    imageCache.setObject(downloadedImage, forKey: urlString as NSString)
                    self.image = downloadedImage
                }
          }
        }
    }
}
