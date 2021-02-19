//
//  Pen.swift
//  PaintApp
//
//  Created by macbook on 19.02.2021.
//

import Foundation
import UIKit

class Pen: Shape, Drawable {
    
    static var points: [CGPoint] = []
    
    override init(_ color: UIColor, _ lineWeight: CGFloat, _ isFilled: Bool){
        super.init(color, lineWeight, isFilled)
    }
    
    func drawPath() {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        for (i,p) in Pen.points.enumerated() {
            if i == 0 {
                context.move(to: p)
            } else {
                context.addLine(to: p)
            }
        }
        context.strokePath()
    }
}
