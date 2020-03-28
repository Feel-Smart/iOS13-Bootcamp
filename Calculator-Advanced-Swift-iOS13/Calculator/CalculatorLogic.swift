//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Matthew Musgrove on 3/27/20.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermediateCalculation: (n1: Double, operand: String)?
    
    mutating func setNumber(to number: Double){
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let safeNum = number {
        
            switch symbol {
            case "AC":
                return 0
            case "+/-":
                return safeNum * -1
            case "%":
                return safeNum / 100
            case "=":
                return performCalculation(n2: safeNum)
            default:
                intermediateCalculation = (n1: safeNum, operand: symbol)
            }
            
        }
        
        return nil
        
    }
    
    private func performCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1,
            let operand = intermediateCalculation?.operand {
            
            switch operand {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operation passed in does not match any of the cases")
            }
            
        }
        
        return nil
        
    }
    
}
