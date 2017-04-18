//
//  StatsController.swift
//  RefereeApp
//
//  Created by Михаил Нечаев on 17.04.17.
//  Copyright © 2017 Михаил Нечаев. All rights reserved.
//

import UIKit

class StatsController: UITableViewController {
    
    var fightMarksByFirstReferee: [Report] = []
    let testNum = 25
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0..<testNum {
            let report = Report.randomReport()
            fightMarksByFirstReferee.append(report)
        }
        
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fightMarksByFirstReferee.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
     
        cell.textLabel?.text = "\(fightMarksByFirstReferee[indexPath.row].refereeNum) referee set \(fightMarksByFirstReferee[indexPath.row].mark) point"
        cell.textLabel?.textColor = fightMarksByFirstReferee[indexPath.row].fighterColor
    
        return cell
    }
}
