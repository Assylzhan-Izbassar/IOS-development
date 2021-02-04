//
//  CalculatorModel.swift
//  CalculatorApp
//
//  Created by macbook on 04.02.2021.
//

import Foundation

enum Operations {
    case const(Double)
    case unaryOperation((Double) -> Double)
    case binaryOperation((Double, Double) -> Double)
    case equals
}

struct Calculator {
    
    struct SaveFirstOperandAndOperation {
        var firstOperand: Double
        var operation: (Double, Double) -> Double
        
        func performOperationWith(secondOperand op2: Double) -> Double{
            return operation(firstOperand, op2)
        }
    }
    
    private var global_value: Double?
    private var saving: SaveFirstOperandAndOperation?
    private var operations: Dictionary<String, Operations> =
        [
            "+" : Operations.binaryOperation({$0+$1}),
            "-" : Operations.binaryOperation({$0-$1}),
            "x" : Operations.binaryOperation({$0*$1}),
            "/" : Operations.binaryOperation({$0/$1}),
            "=" : Operations.equals
        ]
    
    mutating func setOperand(_ operand: Double) {
        global_value = operand
    }
    
    mutating func performOperation(_ operation: String) {
        let symbol = operations[operation]!
        
        switch symbol {
        case .binaryOperation(let function):
            saving = SaveFirstOperandAndOperation(firstOperand: global_value!, operation: function)
        case .equals:
            global_value = saving?.performOperationWith(secondOperand: global_value!)
        default:
            break
        }
    }
    
    func getResult()-> Double {
        return global_value!
    }
}
