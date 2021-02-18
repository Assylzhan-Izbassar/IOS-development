//
//  Shape.swift
//  PaintApp
//
//  Created by macbook on 17.02.2021.
//

import Foundation
import UIKit

class Shape {
    
    internal var color: UIColor
    internal var lineWeight: CGFloat
    internal var isFilled: Bool
    
    init(_ color: UIColor, _ lineWeight: CGFloat, _ isFilled: Bool) {
        self.color = color
        self.lineWeight = lineWeight
        self.isFilled = isFilled
    }
}
