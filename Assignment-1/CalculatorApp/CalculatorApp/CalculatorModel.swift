//
//  CalculatorModel.swift
//  CalculatorApp
//
//  Created by macbook on 04.02.2021.
//

import Foundation

enum Operations {
    
    case zero(Double)
    case nonZeroDigit(Double)
    case separator
    // MathOp
    case unaryOperation((Double) -> Double)
    case binaryOperation((Double, Double) -> Double)
    //
    case equals
    case clear
}

enum CalcState : String {
    case zero
    case accumulator
    case accumulatorDecimal
    case computed
    case error
}

struct Calculator {
    
    struct SaveFirstOperandAndOperation {
//        Variables
        var final_val: Double? // result value
        var unaryOperation: ((Double) -> Double)?
        var operation: ((Double, Double) -> Double)?
        var operationSign: String?
        
//        Constructors
        init(init_val x: Double){
            final_val = x
        }
        
//        Methods
        func performUnaryOperation() -> (Double){
            return unaryOperation!(final_val!)
        }
        
        func performOperationWith(op2 secondOperand: Double) -> Double{
            return operation!(final_val!, secondOperand)
        }
    }
    
    private var temp_val: Double = 0 // temporary value
    private var saving: SaveFirstOperandAndOperation = SaveFirstOperandAndOperation(init_val: 0)
    private var calcState: CalcState = CalcState.zero //?
    private var operations: Dictionary<String, Operations> = [
            "+" : Operations.binaryOperation({$0 + $1}),
            "-" : Operations.binaryOperation({$0 - $1}),
            "x" : Operations.binaryOperation({$0 * $1}),
            "/" : Operations.binaryOperation({$0 / $1}),
            "%" : Operations.unaryOperation({$0 / 100}),
            "+/-": Operations.unaryOperation({$0 * (-1)}),
            "=" : Operations.equals,
            "AC": Operations.clear,
            ".": Operations.separator
    ]
    var typing: Bool = false
    var isZeroState: Bool = true
    
//  Methods
    mutating func setOperand(_ operand: String) {
        temp_val = Double(operand)!
    }
    
    mutating func accumulateDigit(_ number: String, _ digit: String) -> String {
        var result : String = number
        if typing {
            result.append(digit)
        }else{
            if(digit != "0"){
                result = digit
                typing = true
            }
        }
        return result
    }
    
    var isOperationChanged: Bool = false
    
    mutating func compute(_ operation: String) {
        let symbol = operations[operation]!
        typing = false
        if(saving.operationSign != nil && saving.operationSign != operation){
            isOperationChanged = true
        }

        switch symbol {
            case .clear:
                calcState = CalcState.zero
                setOperand("0")
                saving.final_val = 0
                
            case .unaryOperation(let function):
                saving.unaryOperation = function
                temp_val = saving.performUnaryOperation()
                
            case .binaryOperation(let function):
                saving.operation = function
                if(isZeroState){
                    saving.final_val = temp_val
                    isZeroState = false
                }else{
                    saving.final_val = saving.performOperationWith(op2: temp_val)
                    temp_val = saving.final_val!
                }
                
            case .equals:
                temp_val = saving.performOperationWith(op2: temp_val)
            
            case .separator:
                break
                
            default:
                break;
        }
    }
    
    func getResult() -> String {
        return String(temp_val)
    }
    
    func result_val(x result_val: Double) -> String {
        if(Int(result_val * 10) % 10 == 0){
            return String(Int(result_val))
        }else{
            return String(result_val)
        }
    }
}
