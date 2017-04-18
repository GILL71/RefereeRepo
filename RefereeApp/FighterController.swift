//
//  FighterController.swift
//  RefereeApp
//
//  Created by Михаил Нечаев on 17.04.17.
//  Copyright © 2017 Михаил Нечаев. All rights reserved.
//

import UIKit

class FighterController: UITableViewController {
    
   
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var fightsLabel: UILabel!
    @IBOutlet weak var winsLabel: UILabel!
    @IBOutlet weak var atLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let testFighter = Fighter(name: "Alan Kasaev", age: 30, height: 170, weight: 75, fights: 10, wins: 2, attachment: "")
        
        nameLabel.text = testFighter.name
        ageLabel.text =  String(testFighter.age)
        heightLabel.text = String(testFighter.height)
        weightLabel.text = String(testFighter.weight)
        fightsLabel.text = String(testFighter.fights)
        winsLabel.text = String(testFighter.wins)
        atLabel.text = testFighter.attachment
        
        
    }
    
}
