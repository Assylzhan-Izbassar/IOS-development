//
//  CustomView.swift
//  PaintApp
//
//  Created by macbook on 17.02.2021.
//

import UIKit

class Canvas: UIView {
    
    @IBOutlet weak var isFilled: UISwitch!
    var model = PaintModel()
    
    var point1: CGPoint?
    var point2: CGPoint!
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        if let p1 = point1 {
            model.addFigure(p1, point2, isFilled.isOn)
            model.drawAll()
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
        model.setState(formState.circle)
    }
    @IBAction func setRectangle(_ sender: UIButton) {
        model.setState(formState.rectangle)
    }
    @IBAction func setLine(_ sender: UIButton) {
        model.setState(formState.line)
    }
    @IBAction func setTriangle(_ sender: UIButton) {
        model.setState(formState.triangle)
    }
    @IBAction func setPen(_ sender: UIButton) {
        model.setState(formState.pen)
    }
}
