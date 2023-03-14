//
//  RandomNumber.swift
//  Randomizer
//
//  Created by Ilya Zemskov on 13.03.2023.
//

import Foundation

struct RandomNumber {
    var minimumValue: Int
    var maximumValue: Int
    
    var getRandom: Int {
        Int.random(in: minimumValue...maximumValue)
    }
}
