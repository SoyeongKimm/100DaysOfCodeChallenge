//
//  ClassExample.swift
//  Structs vs. Classes
//
//  Created by Soyeong Kim on 2/8/24.
//

import Foundation

class ClassHero {
    var name: String
    var universe: String
    
    //Must need the initializer
    init(name: String, universe: String) {
        self.name = name
        self.universe = universe
    }
}

//let hero = ClassHero(name: "Iron Man", universe: "Marvel")
