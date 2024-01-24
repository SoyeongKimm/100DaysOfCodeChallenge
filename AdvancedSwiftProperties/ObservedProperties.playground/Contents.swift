import UIKit

/*
 Observed property:
 Must be a variable
 To monitor when the value of a property gets changed.
 To observe when its value is changed, and to perform various bits of code or logic when that happens
 It is trigger when a property's value is changed.
 1. willSet - triggered right before it gets changed
 2. didSet - triggered right after it gets changed
 */

//var pizzaInInches: Int = 16 {
//    willSet {
//        print(pizzaInInches)
//        print(newValue)
//    }
//    didSet {
//        print(oldValue)
//        print(pizzaInInches)
//    }
//}

//Change value, willSet and didSet are triggered.
//pizzaInInches = 8


/*
 Observed property + if statement
 */
var pizzaInInches: Int = 16 {
    willSet {
    }
    didSet {
        if pizzaInInches >= 18 {
            print("Invalid size specified, pizzaInInches set to 18")
            pizzaInInches = 18
        }
    }
}

pizzaInInches = 33
print(pizzaInInches)




var numberOfPeople: Int = 12
let slicesPerPerson: Int = 4

var numberOfSlices: Int {
    get {
        return pizzaInInches - 4
    }
}

var numberOfPizza: Int {
    get {
        let numberOfPeopleFedPerPizza = numberOfSlices / slicesPerPerson
        return numberOfPeople / numberOfPeopleFedPerPizza
    }
    set {
        let totalSlices = numberOfSlices * newValue
        numberOfPeople = totalSlices / slicesPerPerson
    }
}
