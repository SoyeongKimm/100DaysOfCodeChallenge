import UIKit

//1.
let touple1 = ("Angela", 12)
//option click to see its type -> let touple1: (String, Int)
print(touple1.0)
print(touple1.1)
//with no name not explicit, difficult to see

//2.
//Give the tuple some parameter names
let touple2 = (name: "Angela", age: 12)
//option click to see its type -> let touple2: (name: String, age: Int)
//"Angela", 12 = value of the elements
//name of the element = identifier + :
print(touple2.name)
print(touple2.age)

//3.
let touple3: (name: String, age: Int)
touple3.name = "Angela"
touple3.age = 12
//touple3 = (name: "Angela", age: 12)

//Tuple: a data structure consisting of multiple parts
//Tuple Type: a comma-separated list of types, enclosed in parentheses. can contain two or more types.
//Usage: store two interrelated pieces of data, make inside something that can group them together, group together related pieces of data that have different data types
