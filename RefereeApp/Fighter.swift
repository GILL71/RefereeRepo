//
//  Fighter.swift
//  RefereeApp
//
//  Created by Михаил Нечаев on 18.04.17.
//  Copyright © 2017 Михаил Нечаев. All rights reserved.
//

import Foundation

class Fighter {
    let name: String
    var age: Int
    var height: Double
    var weight: Double
    var fights: Int
    var wins: Int
    
    init(name: String, age: Int, height: Double, weight: Double, fights: Int, wins: Int) {
        self.name = name
        self.age = age
        self.height = height
        self.weight = weight
        self.fights = fights
        self.wins = wins
    }
}
