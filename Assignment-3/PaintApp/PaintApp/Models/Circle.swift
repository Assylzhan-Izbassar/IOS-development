//
//  Circle.swift
//  PaintApp
//
//  Created by macbook on 17.02.2021.
//

import Foundation
import UIKit

class Circle : Shape, Drawable{
    
    private var radius: CGFloat
    private var origin: CGPoint
    
    init(_ radius: CGFloat, _ origin: CGPoint, _ color: UIColor,
         _ lineWeight: CGFloat, _ isFilled: Bool) {
        self.radius = radius
        self.origin = origin
        super.init(color, lineWeight, isFilled)
    }
    
    func drawPath() {
        let path = UIBezierPath(arcCenter: origin, radius: radius, startAngle: 0, endAngle: CGFloat(2*Double.pi), clockwise: true)
        color.set()
        path.lineWidth = lineWeight
        isFilled ? path.fill() : path.stroke()
    }
}
