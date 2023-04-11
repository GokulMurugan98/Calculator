//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    private var calc = CalcLogic()
    private var finishTyping:Bool = true
    
    
    private var displayValue:Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert lable to Double ")
            }
            return number
        }
        set{
            displayLabel.text = "\(newValue)"
        }
        
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        finishTyping = true
        calc.setNumber(number: displayValue)
        
        guard let result = calc.calculate(symbol: sender.currentTitle!) else {fatalError("The result was found nil")}
        displayValue = result
        
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
       
        if let number = sender.currentTitle{
            if finishTyping{
                displayLabel.text = number
                finishTyping = false
            }else{
                if number == "."{
                    if !(floor(displayValue) == displayValue){
                        return
                    }
                }
                displayLabel.text! += number
            }
        }
    }
}

