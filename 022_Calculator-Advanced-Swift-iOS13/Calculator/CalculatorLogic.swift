//
//  CalcualtorLogic.swift
//  Calculator
//
//  Created by Soyeong Kim on 2/7/24.
//  Copyright © 2024 London App Brewery. All rights reserved.
//

import Foundation

//#11. Conform to MVC, create a model using Class
//class CalculatorLogic {
    
//#17. Turn class into struct
struct CalculatorLogic {
 
//#14. Create a new variable
//it's not going to have a value until we pass it over from the ViewController(computed property).
//Either optional Double or initialization
    //var number: Double?
    //var number: Double

//#21. Change Double to optional Double
    private var number: Double?
    
//#26. Create a tuple just specify its data type. Optional type.
// tuple -> first number and operation
// I don't actually have a value for this tuple when I initialize my CalculatorLogic structure, so I have to be able to set it to nil when I create CalculatorLogic. That means I have to turn it into an optional.
//Add keyword private
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    
//#23. Do not let other class modify the value of variable number. Make a function.
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
//18. Delete the initializer
    //init(number: Double) {
        //self.number = number
    //}
    
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
    mutating func calculate(symbol: String) -> Double? {
        
//#22. Unwrap variable number
//#25. Save the data(first number and calculation)
        if let n = number {
          //  if symbol == "+/-" {
               // return n * -1
           // } else if symbol == "AC" {
            //    return 0
           // } else if symbol == "%" {
              //  return n * 0.01
           // }

//#27. Save data using tuple
//#28. Call a calculation function
//#30. else if symbol == "+" -> else statement
//Warning: Result of call to 'performTwoNumCalculation(n2:)' is unused -> add keyword return
              //else if symbol == "+" {
                  //intermediateCalculation = (n1: n, calcMethod: symbol)
            // else if symbol == "=" {
               // return performTwoNumCalculation(n2: n)
             //} else {
                // intermediateCalculation = (n1: n, calcMethod: symbol)
             //}
        //}
        //return nil
    //}
    
//#33. if statement -> switch statement
        switch symbol {
        case "+/-":
            return n * -1
        case "AC":
            return 0
        case "%":
            return n * 0.01
        case "=":
            return performTwoNumCalculation(n2: n)
        default:
             intermediateCalculation = (n1: n, calcMethod: symbol)
         }
    }
    return nil
}

//#29. Create a calculation function with a keyword private
    private func performTwoNumCalculation(n2: Double) -> Double? {
        
        if let n1 = intermediateCalculation?.n1,
           let operation = intermediateCalculation?.calcMethod {
            
//#31. if statement -> switch statement
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operation passed in does not match any of the cases.")
            }
        }
//Error: Missing return in instance method expected to return 'Double'
        return nil
//Error: 'nil' is incompatible with return type 'Double'
//Output type Double -> Double?
    }
}


//#25. Save the data(first number and calculation)
//1)say that all in separate properties 2)create a brand-new struct that contains the first number and the operation 3)create a tuple

//#32. if let and guard let
//guard let(in ViewController): it means that you're guarding against something terrible. We're guarding against really bad things from happening. That should never really happen. In very few cases, you expect this "else" to be triggered.
//if let: we're expecting that nine times out of ten, this will not be nil and we will be able to trigger this block inside here. But we're also accepting that sometimes it might just be nil and that's fine. We don't have to do anything. We can simply ignore those cases.
