//
//  StatsController.swift
//  RefereeApp
//
//  Created by Михаил Нечаев on 17.04.17.
//  Copyright © 2017 Михаил Нечаев. All rights reserved.
//

import UIKit

class StatsController: UITableViewController {
    
    var reports = [Report]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        let fightVC = self.tabBarController?.viewControllers?[1] as! FightController
        reports = fightVC.reportArray
        
        for r in reports {
            print("\(String(describing: r.fullReport!)) aasasasa \(String(describing: r.time!))")
        }
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if reports.count == 0 {
            return 1
        } else {
            return reports.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if reports.count == 0 {
            cell.textLabel?.text = "Нет зафиксированных событий"
            cell.textLabel?.textColor = UIColor.black
            cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
            cell.detailTextLabel?.text = ""
            return cell
        }
        
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        cell.detailTextLabel?.font = UIFont.italicSystemFont(ofSize: 9)
        
        cell.detailTextLabel?.text = "\(String(describing: reports[indexPath.row].time!))"
        cell.textLabel?.text = "\(String(describing: reports[indexPath.row].fullReport!))"
        if reports[indexPath.row].fighterColor == "B" {
            cell.textLabel?.textColor = UIColor.blue
        } else {
            cell.textLabel?.textColor = UIColor.red
        }
        return cell
    }
}
