//
//  Rectangle.swift
//  PaintApp
//
//  Created by macbook on 17.02.2021.
//

import Foundation
import UIKit

class Rectangle : Shape, Drawable{
    
    internal var upperPoint: CGPoint
    internal var lowerPoint: CGPoint
    
    convenience init(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat,
         _ color: UIColor, _ lineWeight: CGFloat, _ isFilled: Bool) {
        self.init(CGPoint(x: x, y: y), CGPoint(x: x + width, y: y + height), color, lineWeight, isFilled)
    }
    
    init(_ upperPoint: CGPoint, _ lowerPoint: CGPoint, _ color: UIColor,
         _ lineWeight: CGFloat, _ isFilled: Bool) {
        self.upperPoint = upperPoint
        self.lowerPoint = lowerPoint
        super.init(color, lineWeight, isFilled)
    }
    
    func drawPath() {
        let path = UIBezierPath(rect: CGRect(x: upperPoint.x, y: upperPoint.y, width: CGFloat(lowerPoint.x-upperPoint.x), height: CGFloat(lowerPoint.y-upperPoint.y)))
        color.set()
        path.lineWidth = lineWeight
        isFilled ? path.fill() : path.stroke()
        path.close()
    }
}
