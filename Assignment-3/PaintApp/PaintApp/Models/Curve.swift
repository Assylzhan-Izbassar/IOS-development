//
//  Pen.swift
//  PaintApp
//
//  Created by macbook on 19.02.2021.
//

import Foundation
import UIKit

class Curve: Shape, Drawable {
    
    var points: [CGPoint]
    
    override init(_ color: UIColor, _ lineWeight: CGFloat, _ isFilled: Bool){
        points = [CGPoint]()
        super.init(color, lineWeight, isFilled)
    }
    
    func drawPath() {
        let path = UIBezierPath()
        for (i,p) in points.enumerated() {
            if i == 0 {
                path.move(to: p)
            } else {
                path.addLine(to: p)
            }
        }
        color.set()
        path.lineWidth = lineWeight
        path.stroke()
    }
    
    func setPoints(_ points: [CGPoint]) {
        self.points = points
    }
}
