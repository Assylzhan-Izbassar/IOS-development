//
//  CalculatorModel.swift
//  CalculatorApp
//
//  Created by macbook on 04.02.2021.
//

import Foundation

enum Operations {
    
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
    ]
    var typing: Bool = false
    var isZeroState: Bool = true
    var isEqualState: Bool = false
    var fromResult: Bool = false
    var prevOperation : String?
    var fromBinaryOperation: Bool = false
    var tempForEqual: Double?
    var seperatePressed: Bool = false
    var fromOperation: Bool = false
    var fromZeroToDot: Bool = false
    
//  Methods
    mutating func setOperand(_ operand: String) {
        temp_val = Double(operand)!
        if(isZeroState){
            saving.final_val = temp_val
        }
    }
    
    mutating func accumulateDigit(_ number: String, _ digit: String) -> String {
        var result : String = number
        if fromOperation {
            if digit == "0" {
                result = digit
                seperatePressed = false
            }
            fromOperation = false
        }
        if digit == "." && seperatePressed == false {
            if(fromResult){
                result = "0."
                isZeroState = true
                fromResult = false
            }else{
                result.append(digit)
            }
            typing = true
            seperatePressed = true
        }
        if typing {
            if(digit != "." || !seperatePressed){
                result.append(digit)
            }
        }else{
            if(digit != "0"){
                result = digit
                typing = true
            }else{
                if(fromResult){
                    result = digit
                    compute("AC")
                    fromResult = false
                }
            }
        }
        
        return result
    }
    
    var isOperationChanged: Bool = false
    
    mutating func compute(_ operation: String) {
        typing = false
        seperatePressed = false
        let symbol = operations[operation]!

        switch symbol {
            case .clear:
                setOperand("0")
                saving.final_val = 0
                isZeroState = true
                saving.operation = nil
                fromResult = false
                
            case .unaryOperation(let function):
                if (operation == "%") {
                    if prevOperation == "+" || prevOperation == "-"{
                        saving.final_val! *= (temp_val/100)
                    }
                }
                saving.unaryOperation = function
                saving.final_val = temp_val
                saving.final_val = saving.performUnaryOperation()
                
            case .binaryOperation(let function):
                fromBinaryOperation = true
                if isZeroState {
                    saving.operation = function
                    isZeroState = false
                }else{
                    saving.final_val = saving.performOperationWith(op2: temp_val)
                }
                saving.operation = function
                fromOperation = true
                
            case .equals:
                if(fromBinaryOperation == true){
                    tempForEqual = temp_val
                    fromBinaryOperation = false
                }
                isEqualState = true
                fromResult = true
                saving.final_val = saving.performOperationWith(op2: tempForEqual!)
        }
        prevOperation = operation
    }
    
    mutating func getResult() -> String {
        var value = String(saving.final_val!)
        if(value.last! == "0"){
            let len = value.count-2
            value = String(value.prefix(len))
        }
        if(isEqualState){
            //compute("AC") ??
            saving.operation = nil
            isZeroState = true
            isEqualState = false
        }
        return value
    }
    
    func result_val(x result_val: Double) -> String {
        if(Int(result_val * 10) % 10 == 0){
            return String(Int(result_val))
        }else{
            return String(result_val)
        }
    }
}
