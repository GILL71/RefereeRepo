//
//  FightController.swift
//  RefereeApp
//
//  Created by Михаил Нечаев on 25.04.17.
//  Copyright © 2017 Михаил Нечаев. All rights reserved.
//

import Foundation
import UIKit

let myNotificationKey = "com.bobthedeveloper.notificationKey"

class FightController: UIViewController {
    
    var timer: Timer?
    var currentTime = 0
    var stopTime = "00:00"
    var reportArray = [Report]()
    
    @IBOutlet weak var stopwatchDisplay: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var onePointButton: UIButton!
    @IBOutlet weak var twoPointsButton: UIButton!
    @IBOutlet weak var reset: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 42
        
        onePointButton.isEnabled = false
        twoPointsButton.isEnabled = false
        reset.isEnabled = false
        
        SocketIOManager.sharedInstance.getMessage { (messageInfo) -> Void in
            DispatchQueue.main.async(execute: { () -> Void in
                self.prepareMessages(messages: messageInfo)
            })
        }
    }
    
    @IBAction func resetTimer(_ sender: UIButton) {
        stopwatchDisplay.text = "00:00"
        timer?.invalidate()
        timer = nil
        currentTime = 0
        reportArray.removeAll()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func stopStartAction(_ sender: UIButton) {
        if timer != nil {
            self.tabBarController?.tabBar.items?[0].isEnabled = true
            self.tabBarController?.tabBar.items?[2].isEnabled = true
            sender.setTitle("Start", for: .normal)
            onePointButton.isEnabled = false
            twoPointsButton.isEnabled = false
            reset.isEnabled = true
            timer?.invalidate()
            timer = nil
            //SocketIOManager.sharedInstance.sendMessage(message: "Stop", withNickname: "Michael")
        } else {
            self.tabBarController?.tabBar.items?[0].isEnabled = false
            self.tabBarController?.tabBar.items?[2].isEnabled = false
            sender.setTitle("Stop", for: .normal)
            onePointButton.isEnabled = true
            twoPointsButton.isEnabled = true
            reset.isEnabled = false
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
                self.currentTime += 1
                let minutesPortion = String(format: "%02d", self.currentTime / 60)
                let secondsPortion = String(format: "%02d", self.currentTime % 60)
                self.stopwatchDisplay.text = "\(minutesPortion):\(secondsPortion)"
            })
            //SocketIOManager.sharedInstance.sendMessage(message: "Start", withNickname: "Michael")
        }
    }
    
    @IBAction func onePointAction(_ sender: UIButton) {
        send(point: "1")
    }
    
    @IBAction func twoPointsAction(_ sender: UIButton) {
        send(point: "2")
    }
    
    func send(point: String) {
        let message = String(describing: UserDefaults.standard.object(forKey: "referee")!) + String(describing: UserDefaults.standard.object(forKey: "color")!) + point
        SocketIOManager.sharedInstance.sendMessage(message: message, withNickname: "Michael")
    }
    
    func prepareMessages(messages:[String:AnyObject]) {
        let time: String = messages["date"] as! String
        let message: String = messages["message"] as! String
        let report = Report.init(refNum: "\(message[0])", color: "\(message[1])", mark: "\(message[2])")
        
        if message == "Stop" {
            //report.time
        } else if message == "Start" {
            //let report = Report.init(refNum: "-", color: "-", mark: "-")
        } else {
            //let report = Report.init(refNum: "\(message[0])", color: "\(message[1])", mark: "\(message[2])")
        }
        
        report.makeReport(with: time, and: stopwatchDisplay.text!)
        report.time = stopwatchDisplay.text!
        self.reportArray.append(report)
    }
}

extension String {
    subscript(idx: Int) -> Character {
        guard let strIdx = index(startIndex, offsetBy: idx, limitedBy: endIndex)
            else { fatalError("String index out of bounds") }
        return self[strIdx]
    }
}
