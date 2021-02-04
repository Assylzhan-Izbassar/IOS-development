//
//  CalculatorModel.swift
//  CalculatorApp
//
//  Created by macbook on 04.02.2021.
//

import Foundation

enum Operations {
    case unaryOperation((Double) -> Double)
    case binaryOperation((Double, Double) -> Double)
    case equals
    case zero
    case separator
}

enum CalcState : String {
    case zero
    case accumulate
    case separate
    case compute
    case result
}

struct Calculator {
    
    struct SaveFirstOperandAndOperation {
//        Variables
        var firstOperand: Double?
        var unaryOperation: ((Double) -> Double)?
        var operation: ((Double, Double) -> Double)?
        
//        Constructors
        init(){
            
        }
        
        init(fstOp op1: Double, func uOp: @escaping (Double) -> Double){
            firstOperand = op1
            unaryOperation = uOp
        }
        
        init(fstOp op1: Double, func op: @escaping (Double,Double) -> Double){
            firstOperand = op1
            operation = op
        }
        
//        Methods
        func performUnaryOperation() -> (Double){
            return unaryOperation!(firstOperand!)
        }
        
        func performOperationWith(secondOperand op2: Double) -> Double{
            return operation!(firstOperand!, op2)
        }
    }
    
    private var global_value: Double?
    private var saving: SaveFirstOperandAndOperation = SaveFirstOperandAndOperation()
    private var operations: Dictionary<String, Operations> =
        [
            "+" : Operations.binaryOperation({$0 + $1}),
            "-" : Operations.binaryOperation({$0 - $1}),
            "x" : Operations.binaryOperation({$0 * $1}),
            "/" : Operations.binaryOperation({$0 / $1}),
            "%" : Operations.unaryOperation({$0 / 100}),
            "+/-": Operations.unaryOperation({$0 * (-1)}),
            "=" : Operations.equals,
            "AC": Operations.zero,
            ".": Operations.separator
        ]
    private var calcState: CalcState = CalcState.zero
    
//  Methods
    mutating func setOperand(_ operand: String) {
        global_value = Double(operand)
    }
    
    mutating func setCalcState(_ operand: String) {
        if operand == "accumulate" {
            calcState = CalcState.accumulate
        }
    }
    
    mutating func performOperation(_ operation: String) {
        let symbol = operations[operation]!
        
        switch symbol {
        
        case .unaryOperation(let function):
            saving.firstOperand = global_value!
            saving.unaryOperation = function
            global_value = saving.performUnaryOperation()
            
        case .binaryOperation(let function):
            saving.firstOperand = global_value!
            saving.operation = function
            global_value = saving.performOperationWith(secondOperand: global_value!)
            
        case .equals:
            global_value = saving.performOperationWith(secondOperand: global_value!)
            
        default:
            break
        }
    }
    
    func getResult() -> String {
        if(Int(global_value! * 10) % 10 == 0){
            return String(Int(global_value!))
        }else{
            return String(global_value!)
        }
    }
}
