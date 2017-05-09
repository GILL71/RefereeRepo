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
    var age: String//Int
    var height: String//Double
    var weight: String//Double
    var fights: String//Int
    var wins: String//Int
    
    init(name: String, age: String, height: String, weight: String, fights: String, wins: String) {
        self.name = name
        self.age = age
        self.height = height
        self.weight = weight
        self.fights = fights
        self.wins = wins
    }
}
