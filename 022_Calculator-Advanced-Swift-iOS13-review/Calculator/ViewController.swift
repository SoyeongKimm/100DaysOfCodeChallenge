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
    
    private var isfinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        
        isfinishedTypingNumber = true
        
        //let number = displayLabel.text!
        //let number = Double(displayLabel.text!)!
//        guard let number = Double(displayLabel.text!) else {
//            fatalError("Cannot convert display label text to a Double.")
//        }
        
        //calcMethod = sender.currentTitle
        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
                //displayLabel.text = String(displayValue * -1)
                displayValue *= -1
            } else if calcMethod == "AC" {
                displayLabel.text = "0"
            } else if calcMethod == "%" {
                displayValue *= 0.01
            }
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        //displayLabel.text = sender.currentTitle
        if let numValue = sender.currentTitle {
            
            if isfinishedTypingNumber {
                displayLabel.text = numValue
                isfinishedTypingNumber = false
            } else {
                
                if numValue == "." {
                    
                    //let isInt = floor(Double(displayLabel.text!)) == Double(displayLabel.text!)
                    
//                    guard let currentDisplayValue = Double(displayLabel.text!) else {
//                        fatalError("Cannot convert display label text to a Double!")
//                    }

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

