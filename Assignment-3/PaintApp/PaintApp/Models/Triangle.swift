//
//  Triangle.swift
//  PaintApp
//
//  Created by macbook on 17.02.2021.
//

import Foundation
import UIKit

class Triangle : Rectangle{
    
    override func drawPath() {
        let path = UIBezierPath()
        path.move(to: upperPoint)
        path.addLine(to: lowerPoint)
        path.addLine(to: CGPoint(x:upperPoint.x, y:lowerPoint.y))
        path.addLine(to: upperPoint)
        
        path.close()
        color.set()
        path.lineWidth = lineWeight
        isFilled ? path.fill() : path.stroke()
    }
}
