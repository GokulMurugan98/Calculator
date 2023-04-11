//
//  CalcLogic.swift
//  Calculator
//
//  Created by Gokul Murugan on 2023-04-11.
//  Copyright © 2023 London App Brewery. All rights reserved.

import Foundation

struct CalcLogic{
    
    private var number:Double?
    private var intermediateCalc:(number:Double, symbol:String)?
    
    mutating func setNumber(number:Double){
        self.number = number
    }
    
    mutating func calculate(symbol:String) -> Double?{
        if let n = number{
            
            if symbol == "+/-" {
                return n * -1.0
            } else if symbol == "AC"{
                return 0
            } else if symbol == "%"{
                return n * 0.01
            } else if symbol == "+"{
                intermediateCalc = (number: n, symbol: "+")
                return 0.0
            } else if symbol == "-"{
                intermediateCalc = (number: n, symbol: "-")
                return 0.0
            } else if symbol == "*"{
                intermediateCalc = (number: n, symbol: "*")
                return 0.0
            } else if symbol == "÷"{
                intermediateCalc = (number: n, symbol: "÷")
                return 0.0
            } else if symbol == "="{
                return performCalc(secondNumber: n)
            }
        }
        return nil
    }
    
    func performCalc(secondNumber:Double) -> Double?{
        
        guard let intermediateCalc = intermediateCalc else {fatalError("Found nil in the tuple")}
        
        switch intermediateCalc.symbol {
            
        case "+":
            return intermediateCalc.number + secondNumber
        case "-":
            return intermediateCalc.number - secondNumber
        case "*":
            return intermediateCalc.number * secondNumber
        case "÷":
            return intermediateCalc.number / secondNumber
        default:
            return nil
        }
    }
    
}
