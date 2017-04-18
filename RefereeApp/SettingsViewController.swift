//
//  SettingsViewController.swift
//  RefereeApp
//
//  Created by Михаил Нечаев on 17.04.17.
//  Copyright © 2017 Михаил Нечаев. All rights reserved.
//

import Foundation
import  UIKit

class SettingsViewController: UITableViewController {
    
    @IBOutlet weak var ColorControl: UISegmentedControl!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        ColorControl.tintColor = UIColor.blue
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        if ColorControl.selectedSegmentIndex == 0 {
            ColorControl.tintColor = UIColor.blue
        } else {
            ColorControl.tintColor = UIColor.red
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

