//
//  Line.swift
//  PaintApp
//
//  Created by macbook on 18.02.2021.
//

import Foundation
import UIKit

class Line: Rectangle {

    override func drawPath() {
        let path = UIBezierPath()
        path.move(to: upperPoint)
        path.addLine(to: lowerPoint)
        
        path.close()
        color.set()
        path.lineWidth = lineWeight
        path.stroke()
    }
}
