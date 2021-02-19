//
//  PaintModel.swift
//  PaintApp
//
//  Created by macbook on 17.02.2021.
//

import Foundation
import UIKit

enum formState: String {
    
    case circle
    case rectangle
    case line
    case triangle
    case pen
}

struct PaintModel {
    
    var figures: [Drawable]? = []
    private var form: formState? = formState.circle
    
    mutating func addFigure(_ p1: CGPoint, _ point2: CGPoint, _ isFilled: Bool) {
        var fig: Drawable? = nil
        switch form {
            case .circle:
                fig = Circle(CGFloat(abs(p1.x-point2.x)/2), CGPoint(x: abs(point2.x+p1.x)/2, y: abs(point2.y+p1.y)/2), .blue, 3, isFilled)
            case .rectangle:
                fig = Rectangle(p1, point2, .red, 3, isFilled)
            case .line:
                fig = Line(p1, point2, .yellow, 3, false)
            case .triangle:
                fig = Triangle(p1, point2, .brown, 3, isFilled)
            case .pen:
                break
            case .none:
                break
        }
        figures?.append(fig!)
    }
    
    func drawAll() {
        for figure in figures! {
            figure.drawPath()
        }
    }
    
    mutating func setState(_ form: formState) {
        self.form = form
    }
}
