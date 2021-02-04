//
//  ViewController.swift
//  CalculatorApp
//
//  Created by macbook on 02.02.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myDisplay: UILabel!
    private var model = Calculator()
    var typing: Bool = false
    var displayValue: Double {
        get {
            return Double(myDisplay.text!)!
        }
        set {
            myDisplay.text = String(newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressedDigit(_ sender: UIButton) {
        let current_digit = sender.currentTitle!
        if typing {
            let current_display = myDisplay.text!
            myDisplay.text = current_display + current_digit
        }else {
            myDisplay.text = current_digit
            typing = true
        }
    }
    
    @IBAction func pressedOperation(_ sender: UIButton) {
        model.setOperand(displayValue)
        model.performOperation(sender.currentTitle!)
        displayValue = model.getResult()
        typing = false
    }
}

