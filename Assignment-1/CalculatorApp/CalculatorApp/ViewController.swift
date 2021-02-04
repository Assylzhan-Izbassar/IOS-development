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
    var displayValue: String {
        get {
            return myDisplay.text!
        }
        set {
            myDisplay.text = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model.setOperand(displayValue)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressedDigit(_ sender: UIButton) {
        let current_digit = sender.currentTitle!
        if typing {
            let current_display = myDisplay.text!
            myDisplay.text = current_display + current_digit
            model.setCalcState("accumulate")
        }else if(myDisplay.text! == "0" && current_digit == "0"){
            myDisplay.text = current_digit
            typing = false
        }
        else {
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

