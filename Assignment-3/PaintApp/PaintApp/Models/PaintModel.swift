//
//  PaintModel.swift
//  PaintApp
//
//  Created by macbook on 17.02.2021.
//

import Foundation
import UIKit

enum formState : String{
    
    case circle
    case rectangle
    case line
    case triangle
    case pen
    case undo
    case longUndo
}

struct PaintModel {
    
    var figures: [Drawable]? = []
    private(set) var form: formState? = formState.circle
    
    mutating func addFigure(_ p1: CGPoint?, _ point2: CGPoint?, _ lineWidth: CGFloat, _ isFilled: Bool, _ color: UIColor) {
        var fig: Drawable? = nil
        switch form {
            case .circle:
                fig = Circle(CGFloat(abs(p1!.x-point2!.x)/2), CGPoint(x: abs(point2!.x+p1!.x)/2, y: abs(point2!.y+p1!.y)/2), color, lineWidth, isFilled)
            case .rectangle:
                fig = Rectangle(p1!, point2!, color, lineWidth, isFilled)
            case .line:
                fig = Line(p1!, point2!, color, lineWidth, false)
            case .triangle:
                fig = Triangle(p1!, point2!, color, lineWidth, isFilled)
            case .pen:
                break
            case .undo:
                _ = figures?.popLast()
            case .longUndo:
                figures?.removeAll()
            case .none:
                break;
        }
        if let f = fig {
            figures?.append(f)
        }
    }
    
    func drawAll() {
        for figure in figures! {
            figure.drawPath()
        }
    }
    
    mutating func undo() {
        _ = figures?.removeAll()
    }
    mutating func clear() {
        self.figures?.removeAll()
    }
    
    mutating func setState(_ form: formState) {
        self.form = form
    }
}
