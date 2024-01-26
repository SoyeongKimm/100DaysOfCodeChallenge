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
    var isFinishedTypingNumber: Bool = true
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        //What should happen when a non-number button(calculation button) is pressed
        
//#5. Clear the label text and restart accumulating numbers
        isFinishedTypingNumber = true
    
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        //What should happen when a number or the digit-related button is entered into the keypad
    
/*
 The parameter SENDER has a whole bunch of different properties(background color, size of the button, title, etc.) We tap into the sender object and we use the dot to find all of its properties.
 */

//#1. Tap into the title property of the button and Set the display label's text to the current title of the button
/*
 var currentTitle: String? { get }
 Optional. Read-only property. The value cannot be set.
 e.g.
 sender.currentTitle = "1"
 Error: Cannot assign to property: 'currentTitle' is a get-only property
 */
        
        //displayLabel.text = sender.currentTitle
//#2. Unwrap the currentTitle
        //if let numValue = sender.currentTitle {
            //displayLabel.text = numValue
        //}
/*
 Only one digit is displayed => accumulate numbers
 Calculation button pressed and another digit pressed => clear the lable's text => keep hold of whether if the user is done typing the number => Create a variable
 */

//#4.
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
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
 1. privete: only accessible in between the curly braces of that block of code
 2. fileprvate: only accessible inside the file that it was declared
 3. internal: accessible anywhere inside your current app module(default level)
 4. public: access is granted to other modules (e.g. frameworks, APIs, SDKs, libraries you want other modules to be able to tap into and use)
 5. open: Everything can be accessed by other modules. PLUS, classes and functions can be subclassed and overridden.

 Advantage:
 You can't accidentally modify something that is not meant to be modified by a different class or from a different place.
 
 To prevent that and to make your code safer, try to use access levels by starting out with private for all of your vars and lets, and methods, and leveling it up only when it's necessary.
 */
