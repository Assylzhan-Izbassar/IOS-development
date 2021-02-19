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
    var point2: CGPoint?
    var color: UIColor?
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        if let p1 = point1 {
            model.addFigure(p1, point2, isFilled.isOn, color ?? .systemIndigo)
            model.drawAll()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        point1 = touches.first?.location(in: self)
        
        if model.form == formState.pen {
            model.figures?.append(Curve(color ?? .systemIndigo, 3, false))
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if model.form == formState.pen {
            guard let point = touches.first?.location(in: self) else { return }
            
            if let curve = model.figures?.popLast() as? Curve {
                curve.points.append(point)
                model.figures?.append(curve)
            }
            setNeedsDisplay()
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        point2 = touches.first?.location(in: self)
        if model.form != formState.pen {
            setNeedsDisplay()
        }
    }
    
    /**
     Setting the form of figures
     */
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
    
    /**
     Setting the color
     */
    @IBAction func setRed(_ sender: UIButton) {
        color = sender.backgroundColor
    }
    @IBAction func setOrange(_ sender: UIButton) {
        color = sender.backgroundColor
    }
    @IBAction func setYellow(_ sender: UIButton) {
        color = sender.backgroundColor
    }
    @IBAction func setGreen(_ sender: UIButton) {
        color = sender.backgroundColor
    }
    @IBAction func setLightBlue(_ sender: UIButton) {
        color = sender.backgroundColor
    }
    @IBAction func setBlue(_ sender: UIButton) {
        color = sender.backgroundColor
    }
    @IBAction func setIndigo(_ sender: UIButton) {
        color = sender.backgroundColor
    }
}
