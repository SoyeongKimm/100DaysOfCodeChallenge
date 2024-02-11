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
    
//#3. Create a variable to keeps hold of whether if the user is done typing the number
    private var isFinishedTypingNumber: Bool = true
    
//#9. Refactoring with computed property
//Coding convention: Whenever creating a global variable, put keyword private in front.
//We're converting numbers into Strings, and then Strings into numbers all over the place.
//Bring the code(guard let) from #6 and #8 to setter -> Go and refactor #6 #7 and #8
//return number is the value of the variable displayValue.
//get-return
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double")
            }
            return number
        }
//#10. Setter - sets the displayLabel whenever the displayValue is updated
//Refactor #7(#9)
        set {
            displayLabel.text = String(newValue)
        }
    }
    
//#19. Change it to global variable and add keyword private(Move it out of the function)
//When initializing a data model structure, for efficiency make it as a global variable rather than a local variable.
//Error: Cannot use instance member 'displayValue' within property initializer; property initializers run before 'self' is available.
//-> because this is a global variable, which happens even before viewDidLoad gets called, the Swift compiler can be sure that display value is not nil at the point when you're trying to initialize CalculatorLogic.

//#20. Delete the parameter
    //private let calculator = CalculatorLogic(number: displayValue)
    private var calculator = CalculatorLogic()

    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        //What should happen when a non-number button(calculation button) is pressed
        
//#5. Clear the label text and restart accumulating numbers
        isFinishedTypingNumber = true
    
//#24. Call the method
        calculator.setNumber(displayValue)
        
//#6. Change the text(in the display) into Double to perform calculation
        //let number = Double(displayLabel.text!)!
        //guard let number = Double(displayLabel.text!) else {
            //fatalError("Cannot convert display label text to a Double")
        //}
        
//#7. +/-, A/C, % currentTitle unwrap -> match -> calculate
        //if let calcMethod = sender.currentTitle {
            //if calcMethod == "+/-" {
                //displayLabel.text = String(number * -1)
            //} else if calcMethod == "AC" {
                //displayLabel.text = "0" // =String(0)
            //} else if calcMethod == "%" {
                //displayLabel.text = String(number * 0.01) // =String(number/100)
            //}
        //}
        
//9. Refactor: number -> displayValue
        //if let calcMethod = sender.currentTitle {
            //if calcMethod == "+/-" {
                //displayLabel.text = String(displayValue * -1)
            //} else if calcMethod == "AC" {
                //displayLabel.text = "0" // =String(0)
            //} else if calcMethod == "%" {
                //displayLabel.text = String(displayValue * 0.01) // =String(number/100)
            //}
        //}
        
//#10. Refactor: displayLabel.text -> displayValue
        //if let calcMethod = sender.currentTitle {
            //if calcMethod == "+/-" {
                //displayValue = displayValue * -1 // = displayValue *= -1
            //} else if calcMethod == "AC" {
                //displayLabel.text = "0" // =String(0)
            //} else if calcMethod == "%" {
                //displayValue = displayValue * 0.01 // = displayValue *= 0.01
            //}
        
//#16. Call the function calculate in CalculatorLogic Class
        if let calcMethod = sender.currentTitle {
            //let calculator = CalculatorLogic(number: displayValue)
            //calculator.calculate(symbol: calcMethod)
            //displayValue = calculator.calculate(symbol: calcMethod)
            guard let result = calculator.calculate(symbol: calcMethod) else {
                fatalError("The result of the calculation is nil.")
            }
            displayValue = result
        }
    }
        
//#11. Conforming to MVC
//Create CalculatorLogic file, move #10 to it.

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number or the digit-related button is entered into the keypad
    
/*
 The parameter SENDER has a whole bunch of different properties(background color, size of the button, title, etc.) We tap into the sender object and we use the dot to find all of its properties.
 */

//#1. Tap into the title property(currentTitle) of the button and Set the display label's text to the current title of the button
/*
 About the property "currentTitle"
 var currentTitle: String? { get }
 Optional, read-only property. The value cannot be set.
 e.g.
 sender.currentTitle = "1"
 Error: Cannot assign to property: 'currentTitle' is a get-only property.
 Title of the button is already written and displayed on the button, the property currentTitle only can read it.
 */
        
        //displayLabel.text = sender.currentTitle
        
//#2. Unwrap the currentTitle
        //if let numValue = sender.currentTitle {
            //displayLabel.text = numValue
        //}
/*
 Problem: Only one digit can be displayed => Let's accumulate numbers.
 Calculation button pressed and another digit pressed => keep hold of whether if the user is done typing the number => clear the lable's text => Create a global variable to check the typing is done or not. Go to #3.
 */

//#4.
        //if let numValue = sender.currentTitle {
            //if isFinishedTypingNumber {
                //displayLabel.text = numValue
                //isFinishedTypingNumber = false
            //} else {
                //displayLabel.text = displayLabel.text! + numValue
            //}
        //}
        
//#8. Dealing with the decimal place. Check the dot inside else statement.
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                if numValue == "." {
                    
                    //guard let currentDisplayValue = Double(displayLabel.text!) else {
                        //fatalError("Cannot convert display label text to a Double!")
                    //}

                    //let isInt = floor(currentDisplayValue) == currentDisplayValue
                    //floor: Round down (e.g. 8.1 -> 8)
                    //number rounded down == number -> Int

//9. Refactor
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
}



/*
 keyword private (put in front of the property or method)
 to make our code a little bit more secure and less prone to unexpected errors
 This private property or method can be accessible only inside the current class(parent block).
 
 Swift Access Levels (like the clearance level)
 most restrictive <------------> least restrictive access level
 1. privete: only accessible in between the curly braces of the block of code
 2. fileprvate: only accessible inside the file that it was declared
 3. internal: accessible anywhere inside your current app module(default level)
 4. public: access is granted to other modules (e.g. frameworks, APIs, SDKs, libraries you want other modules to be able to tap into and use)
 5. open: Everything can be accessed by other modules. PLUS, classes and functions can be subclassed and overridden.

 Advantage:
 You can't accidentally modify something that is not meant to be modified by a different class or from a different place.
 
 To prevent that and to make your code safer, try to use access levels by starting out with private for all of your vars and lets, and methods, and leveling it up only when it's necessary.
 */


/*
#6. Optionals
 App crash is not bad. Crash silently is dangerous.
 Make your code express the error(Use guard let-else of if-else statement)
 Forced unwrapping can be necessary to test unexpected errors.
*/


/*
 Xcode shortcuts and tips
 option cmd left-arrow: collapse indivisual method or block of code
 option cmd right-arrow: expand it back
 */
