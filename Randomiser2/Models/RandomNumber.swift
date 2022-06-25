//
//  RandomNumber.swift
//  Randomiser2
//
//  Created by Алиага С on 23.6.2022.
//

import Foundation

struct RandomNumber {
    var minimumValue: Int
    var maximumValue: Int
    
    var getRandom: Int {
        Int.random(in: minimumValue...maximumValue)
    }
}
