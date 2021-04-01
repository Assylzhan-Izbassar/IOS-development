//
//  Phone.swift
//  AnimationApp
//
//  Created by macbook on 01.04.2021.
//

import Foundation

class Phone {
    private var title: String
    private var price: String
    private var processorType: String
    private var cameraPixel: String
    
    init(_ title: String, _ price: String, _ processorType: String, _ cameraPixel: Double) {
        self.title = title
        self.price = price
        self.processorType = processorType
        
        if cameraPixel / 10 == 0 {
            self.cameraPixel = String(Int(cameraPixel)) + "MPX"
        } else {
            self.cameraPixel = String(cameraPixel) + "MPX"
        }
    }
    
    func getTitle() -> String {
        return title
    }
    
    func getPrice() -> String {
        return price
    }
    
    func getProcessorType() -> String {
        return processorType
    }
    
    func getCameraPixel() -> String {
        return cameraPixel
    }
}
