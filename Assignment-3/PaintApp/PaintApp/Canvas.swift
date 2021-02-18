//
//  CustomView.swift
//  PaintApp
//
//  Created by macbook on 17.02.2021.
//

import UIKit

enum formState: String {
    
    case circle
    case rectangle
    case line
    case triangle
    case pen
}

class Canvas: UIView {
    
    @IBOutlet weak var isFilled: UISwitch!
    private var form: formState? = formState.circle
    
    var figures: [Drawable]? = []
    
    var point1: CGPoint?
    var point2: CGPoint!
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        if let p1 = point1 {
            var fig: Drawable? = nil
            
            switch form {
                case .circle:
                    fig = Circle(CGFloat(abs(p1.x-point2.x)/2), CGPoint(x: abs(point2.x+p1.x)/2, y: abs(point2.y+p1.y)/2), .blue, 3, isFilled.isOn)
                case .rectangle:
                    fig = Rectangle(p1, point2, .red, 3, isFilled.isOn)
                case .line:
                    break
                case .triangle:
                    break
                case .pen:
                    break
                case .none:
                    break
            }
            figures?.append(fig!)
            
            for figure in figures! {
                figure.drawPath()
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        point1 = touches.first?.location(in: self)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        point2 = touches.first?.location(in: self)
        setNeedsDisplay()
    }
    
    @IBAction func setCircle(_ sender: UIButton) {
        form = formState.circle
    }
    @IBAction func setRectangle(_ sender: UIButton) {
        form = formState.rectangle
    }
    @IBAction func setLine(_ sender: UIButton) {
        form = formState.line
    }
    @IBAction func setTriangle(_ sender: UIButton) {
        form = formState.triangle
    }
    @IBAction func setPen(_ sender: UIButton) {
        form = formState.pen
    }
}
