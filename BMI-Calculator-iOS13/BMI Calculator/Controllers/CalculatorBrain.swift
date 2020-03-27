//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Matthew Musgrove on 3/3/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var bmi : BMI?
    var currentBMI = "0.0"
    
    mutating func calculateBMI(height: Float, weight: Float){
        let bmiValue = weight/pow(height,2)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies", color: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))
        } else if bmiValue < 25 {
            bmi = BMI(value: bmiValue, advice: "All good here", color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies", color: #colorLiteral(red: 0.8958184719, green: 0, blue: 0, alpha: 1))
        }
    }
    
    func getBMIValue() -> String{
        let currentBMI = String(format: "%.1f", bmi?.value ?? 0.0)
        return currentBMI
    }
    
    func getAdvice() -> String{
        let currentAdvice = bmi?.advice ?? "Something went wrong"
        return currentAdvice
    }
    
    func getColor() -> UIColor{
        let currentColor = bmi?.color ?? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return currentColor
    }
    
}
