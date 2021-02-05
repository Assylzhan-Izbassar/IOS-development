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
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressedDigit(_ sender: UIButton) {
        displayValue = model.accumulateDigit(myDisplay.text!, sender.currentTitle!)
        model.setOperand(displayValue)
    }
    
    var initial: Bool = true
    var prevOperationSign : String?
    
    @IBAction func pressedOperation(_ sender: UIButton) {
        model.setOperand(displayValue)
        if(initial){
            model.compute(sender.currentTitle!)
            prevOperationSign = sender.currentTitle!
            initial = false
        }else{
            if(prevOperationSign == sender.currentTitle!){
                model.compute(sender.currentTitle!)
            }
        }
        displayValue = model.getResult()
        
    }
}

