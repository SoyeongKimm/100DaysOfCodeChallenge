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
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button(calculation button) is pressed
    
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        //What should happen when a number or the digit-related button is entered into the keypad
    
/*
 The parameter SENDER has a whole bunch of different properties(background color, size of the button, title, etc.) We tap into the sender object and we use the dot to find all of its properties.
 */

//1. Tap into the title property of the button and Set the display label's text to the current title of the button
        displayLabel.text = sender.currentTitle
        
        
    }

}

