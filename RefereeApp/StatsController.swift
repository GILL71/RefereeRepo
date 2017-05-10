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
        
        //modifyReports(reports: self.reports)
        
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
        
        cell.detailTextLabel?.text = "\(String(describing: reports[indexPath.row].serverTime!))"
        cell.textLabel?.text = "\(String(describing: reports[indexPath.row].fullReport!))"
        if reports[indexPath.row].fighterColor == "B" {
            cell.textLabel?.textColor = UIColor.blue
        } else {
            cell.textLabel?.textColor = UIColor.red
        }
        return cell
    }
    
    func modifyReports(reports:[Report]) {
        var array = reports
        let startTime = reports[0].serverTime
        var pauseTime = "00:00:00"
        var pauseTimeStop: String?
        array.remove(at: 0)
        
        for r in array {
            if r.fullReport != "Start" && r.fullReport != "Stop" {
                r.time = subtractionTime(first: startTime!, second: r.serverTime!)
                r.time = subtractionTimeInSeconds(first: r.time!, second: pauseTime)
            } else if r.fullReport == "Start" {
                pauseTime = subtractionTime(first: r.serverTime!, second: pauseTimeStop!)
            } else if r.fullReport == "Stop" {
                pauseTimeStop = r.serverTime
            }
        }
        
        //в конце надо создать контрольную точку? чтобы можно было продожить бой
    }
    
    func subtractionTime(first: String, second: String) -> String {
        
        var time: String
        
        //time = server - start - pause
        
        //let dateString = first //"Thu, 22 Oct 2015 07:45:17 +0000" "2017-5-9 14:17:17"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-M-d hh:mm:ss"//"EEE, dd MMM yyyy hh:mm:ss +zzzz"
        dateFormatter.locale = Locale.init(identifier: "en_GB")
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        let zero = "0000-0-0 00:00:00"
        var zeroDate = dateFormatter.date(from: zero)
        
        
        let dateObjFirst = dateFormatter.date(from: first)
        let dateObjSecond = dateFormatter.date(from: second)
        
        //transformations with time time=dOF - dOS
        
        let timeInterval = dateObjSecond!.timeIntervalSince(dateObjFirst!)
       /* let min = Int(timeInterval / 60)
        let sec = timeInterval - Double(min*60)
        
        time = String("\(min):\(sec)")*/
        //dateObjFirst?.addTimeInterval(timeInterval)
        //dateObjFirst = dateObjFirst?.addingTimeInterval(-timeInterval)
        zeroDate?.addTimeInterval(timeInterval)
        //try to
        
        //dateFormatter.dateFormat = "mm:ss"
        
        time = dateFormatter.string(from: zeroDate!)
        
        return zero
    }
    
    func subtractionTimeInSeconds(first: String, second: String) -> String {
        var time: String
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm:ss"//"EEE, dd MMM yyyy hh:mm:ss +zzzz"
        dateFormatter.locale = Locale.init(identifier: "en_GB")
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        var dateObjFirst = dateFormatter.date(from: first)
        let dateObjSecond = dateFormatter.date(from: second)
        
        //transformations with time time=dOF - dOS
        
        let timeInterval = dateObjSecond!.timeIntervalSince(dateObjFirst!)
        
        //dateObjFirst?.addTimeInterval(timeInterval)
        
        //try to
        
        dateFormatter.dateFormat = "mm:ss"
        
        time = dateFormatter.string(from: dateObjFirst!)

        
        return time
    }
}

extension Date {
    /// Returns the amount of seconds from another date
    func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    /// Returns the a custom time interval description from another date
    func offset(from date: Date) -> String {
        if seconds(from: date) > 0 { return "\(seconds(from: date))s" }
        return ""
    }
}
