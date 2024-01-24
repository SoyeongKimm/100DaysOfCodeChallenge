//Utility Pane > Playground Settings > Platform macOS > import Foundation
import Foundation

/*
 Stored Properties
*/
//var pizzaInInches: Int = 10
//var numberOfSlices: Int = 6

/*
 Computed Property (variable + method)
 Note 1. Keyword "return" necessary
 Note 2. Specify the data type of the computed property
 
 Depending on the value of pizzaInInches, the value of numberOfSlices changes dymatically. i.e. The value of numberOfSlices is dependent on pizzaInInches properties
*/
//var pizzaInInches: Int = 10
//var numberOfSlices: Int {
//    return pizzaInInches - 4
//}

/*
 Computed property => variable + method
 More lines of code, potential sources of error and places where things can go wrong
 Use computed property rather than function
 When methods with no inputs and outputs, just execute a block of code.
*/
//var pizzaInInches: Int = 10
//var numberOfSlices: Int = 6
//func clacPizzaSlices() {
//    numberOfSlices = pizzaInInches - 4
//}


/*
 Computed property
 1. getter - it will execute the code in order to get the value of this property
 2. setter - Specify some code that should be executed when its value is set. The block of code inside the set will be executed whenever this property gets a new value set to it. The setter code is called the exact moment that the property is set with a new value.
 */

// var pizzaInInches: Int = 10
// 
// var numberOfSlices: Int {
//     get {
//         return pizzaInInches - 4
//     } 
//     set {
//         print("numberOfSlices now has a new value which is \(newValue)")
//     }
// }
 
/*
 newValue : Special variable newValue that's been given to numberOfSlices.
 */

//numberOfSlices = 12

/*
 The moment we set the new value to numberOfSlices, the block of set is triggered.
 It allows us to tap into the exact moment when our property is set with a new value, and it allows us to use that new value in computations or various bits of code, and to execute it at the exact time when this property's value gets updated.
 */

/*
 Without set, it is a get-only(read-only) property.
 We can set the value by using another constant or variable.
 */
//var pizzaInInches: Int = 10
//
//var numberOfSlices: Int {
//    get {
//        return pizzaInInches - 4
//    }
//}
//
//let a = numberOfSlices + 3
//
//print(numberOfSlices)

let pizzaInInches: Int = 16
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

numberOfPizza = 6

//print(numberOfPizza)
print(numberOfPeople)

/*
 Using computed property, minimizes errors, makes our code more dynamic and more maintainable, and easier to understand
 */

