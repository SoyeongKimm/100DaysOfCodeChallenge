//
//  QuoteTableViewController.swift
//  InspoQuotes
//
//  Created by Angela Yu on 18/08/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit
//8. Import StoreKit
import StoreKit

//10-1. To process the payment, implement the protocol SKPaymentTransactionObserver and its delegate method(place it into In-App Purchase Method)
class QuoteTableViewController: UITableViewController, SKPaymentTransactionObserver {
    
//8-1. Create a constant to record the productID
//App Store Connect > Features > In-App Purchases > Product ID
    let productID = "com.sam.InspoQuotes.PremiumQuotes"
    
    var quotesToShow = [
        "Our greatest glory is not in never falling, but in rising every time we fall. — Confucius",
        "All our dreams can come true, if we have the courage to pursue them. – Walt Disney",
        "It does not matter how slowly you go as long as you do not stop. – Confucius",
        "Everything you’ve ever wanted is on the other side of fear. — George Addair",
        "Success is not final, failure is not fatal: it is the courage to continue that counts. – Winston Churchill",
        "Hardships often prepare ordinary people for an extraordinary destiny. – C.S. Lewis"
    ]
    
    let premiumQuotes = [
        "Believe in yourself. You are braver than you think, more talented than you know, and capable of more than you imagine. ― Roy T. Bennett",
        "I learned that courage was not the absence of fear, but the triumph over it. The brave man is not he who does not feel afraid, but he who conquers that fear. – Nelson Mandela",
        "There is only one thing that makes a dream impossible to achieve: the fear of failure. ― Paulo Coelho",
        "It’s not whether you get knocked down. It’s whether you get up. – Vince Lombardi",
        "Your true success in life begins only when you make the commitment to become excellent at what you do. — Brian Tracy",
        "Believe in yourself, take on your challenges, dig deep within yourself to conquer fears. Never let anyone bring you down. You got to keep going. – Chantal Sutherland"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
//10-3. Declare this current class as the delegate who's going to receive the messages from the SKPaymentTransactionObserver when the transaction status changes
        SKPaymentQueue.default().add(self)

//13-3. Check if the user purchased
        if isPurchased() {
            showPremiumQuotes()
        }
    }

    // MARK: - Table View Data Source Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//1. Number of rows = Number of items in the array
        //return quotesToShow.count
        
//4. Add one more cell for "Buy more quotes"
        //return quotesToShow.count + 1
        
//14. If purchased, remove the last cell
        if isPurchased() {
            return quotesToShow.count
        } else {
            return quotesToShow.count + 1
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

//2. Match the identifier name with the one in the storyboard
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuoteCell", for: indexPath)
        
//3. Configure the cell: texts, lines(set it to zero to use as many lines as required.)
//        cell.textLabel?.text = quotesToShow[indexPath.row]
//        cell.textLabel?.numberOfLines = 0
//        print(indexPath.row)
//        return cell
        
//5-1. Add configuration of the "Buy more quotes" cell
//5-2. Use the relation of indexPath.row and quotesToShow.count
//5-3. Change the UI of the cell, Make it look like it is clickable
        if indexPath.row < quotesToShow.count {
            cell.textLabel?.text = quotesToShow[indexPath.row]
            cell.textLabel?.numberOfLines = 0
//12. Set the cells to have a black text color and with no accessory
            cell.textLabel?.textColor = .black
            cell.accessoryType = .none
        } else {
            cell.textLabel?.text = "Get More Quotes"
            cell.textLabel?.textColor = .blue
            cell.accessoryType = .disclosureIndicator
        }
        return cell
    }

//6. Detect user interface.
    // MARK: - Table View Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//6-1/4. What happens when user clicks the "Buy" cell
        if indexPath.row == quotesToShow.count {
//6-2/4. Test whether the cell works
            //print("Buy Quotes clicked")
//6-4/4. Implement the buying of our in-app purchase by calling a method
            buyPremiumQuotes()
        }
//6-3/4. Cell turns back to white
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
//7. Create in-app purchase method triggering the in-app purchase
    // MARK: - In-App Purchase Method

    func buyPremiumQuotes() {
//9-1. Check if the user can actually make a purchase
        if SKPaymentQueue.canMakePayments() {
//9-2. if true, make an in-app purchase request
           let paymentRequest = SKMutablePayment()
            paymentRequest.productIdentifier = productID
            SKPaymentQueue.default().add(paymentRequest)
        } else {
            print("User can't make payments")
        }
        
        
    }

//10-2. Delegate Method of SKPaymentTransactionObserver protocol
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        
//10-4. Loop through the array of SKPaymentTransaction
        for transaction in transactions {
//10-5. Check the transaction's state
            if transaction.transactionState == .purchased {
                print("Transaction successful!")
                
//11-1. Give User access to purchased content by calling a method
                showPremiumQuotes()

//13-1. Check if the user already purchased as soon as the app runs
                UserDefaults.standard.set(true, forKey: productID)
                
//10-6. End the transaction when success
                SKPaymentQueue.default().finishTransaction(transaction)
                
            } else if transaction.transactionState == .failed {
                //print("Transaction failed")
                
//10-7. Get the accurate description of the error
                if let error = transaction.error {
                    let errorDescription = error.localizedDescription
                    print("Transaction failed due to error: \(errorDescription)")
                }
//10-6. End the transaction when failure
                SKPaymentQueue.default().finishTransaction(transaction)
            }
        }
    }
    
//11-2. Create the method to give user access to paid content
    func showPremiumQuotes() {
//11-3. Add the premiumQuotes array(let) to the quotesToShow array(var)
        quotesToShow.append(contentsOf: premiumQuotes)
//11-4. Reload the table view -> Trigger the data source methods
        tableView.reloadData()
    }
    
//13-2. Create a method for checking if purchased
// This method should be called in viewDidLoad()
    func isPurchased() -> Bool {
        let purchaseStatus = UserDefaults.standard.bool(forKey: productID)
        
        if purchaseStatus {
            print("Previously purchased")
            return true
        } else {
            print("Never purchased")
            return false
        }
    }
    
    

    @IBAction func restorePressed(_ sender: UIBarButtonItem) {
        
    }


}
