//
//  CalcualtorLogic.swift
//  Calculator
//
//  Created by Soyeong Kim on 2/7/24.
//  Copyright © 2024 London App Brewery. All rights reserved.
//

import Foundation

//#11. Conform to MVC, create a model using Class
class CalculatorLogic {
 
//#14. Create a new variable
//it's not going to have a value until we pass it over from the ViewController(computed property).
//Either optional Double or initialization
    //var number: Double?
    var number: Double
    
    init(number: Double) {
        self.number = number
    }
    
    //init(n: Double) {
        //number = n
    //}
    
    
    
//#12. Create a function taking a single parameter called symbol in the form of a String.
    //func calculate(symbol: String) {
        
//#13. Transplant #10 over except if-let statement. "sender" should be there.
//Replace "calcMethod" with "symbol"
//displayValue?? Create a new variable Go to #14
            //if symbol == "+/-" {
                //displayValue = displayValue * -1 // = displayValue *= -1
            //} else if symbol == "AC" {
                //displayLabel.text = "0" // =String(0)
            //} else if symbol == "%" {
                //displayValue = displayValue * 0.01 // = displayValue *= 0.01
            //}
    //}
    
//#15. Modify function to return type. displayValue -> number
//Error: Missing return in instance method expected to return 'Double' -> add return(bottom one)
//Error: 'nil' is incompatible with return type 'Double' -> Change the return type Double to Double?
//Go to #16 to call this function
    func calculate(symbol: String) -> Double? {
        if symbol == "+/-" {
            return number * -1
        } else if symbol == "AC" {
            return 0
        } else if symbol == "%" {
            return number * 0.01
        }
        return nil
    }
}
