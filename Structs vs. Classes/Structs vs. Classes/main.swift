//
//  main.swift
//  Structs vs. Classes
//
//  Created by Soyeong Kim on 2/8/24.
//

import Foundation

//Class
var classHero = ClassHero(name: "Iron Man", universe: "Marvel")

var anotherClassHero = classHero //Make a copy of classHero

anotherClassHero.name = "Hulk"

var classAvengers = [classHero, anotherClassHero]
classAvengers[0].name = "Thor"

print("classHero name is \(classHero.name)")
print("anotherClassHero name is \(anotherClassHero.name)")
print("first classAvenger name is \(classAvengers[0].name)")

//Struct
var structHero = StructHero(name: "Iron Man", universe: "Marvel")

var anotherStructHero = structHero

anotherStructHero.name = "Hulk"

var structAvengers = [structHero, anotherStructHero]
structAvengers[0].name = "Thor"

print("structHero name is \(structHero.name)")
print("anotherStructHero name is \(anotherStructHero.name)")
print("first structAvenger name is \(structAvengers[0].name)")

