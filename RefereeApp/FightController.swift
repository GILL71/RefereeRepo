//
//  FightController.swift
//  RefereeApp
//
//  Created by Михаил Нечаев on 25.04.17.
//  Copyright © 2017 Михаил Нечаев. All rights reserved.
//

import Foundation
import UIKit

class FightController: UIViewController {
    
    var timer: Timer?
    var currentTime = 0
    var num, color: String?
    
    @IBOutlet weak var stopwatchDisplay: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 42
        num = "1"
        color = "R"
    }
    
    @IBAction func stopStartAction(_ sender: UIButton) {
        if timer != nil {
            self.tabBarController?.tabBar.items?[0].isEnabled = true
            self.tabBarController?.tabBar.items?[2].isEnabled = true
            sender.setTitle("Start", for: .normal)
            timer?.invalidate()
            timer = nil
        } else {
            self.tabBarController?.tabBar.items?[0].isEnabled = false
            self.tabBarController?.tabBar.items?[2].isEnabled = false
            sender.setTitle("Stop", for: .normal)
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
                self.currentTime += 1
                let minutesPortion = String(format: "%02d", self.currentTime / 60)
                let secondsPortion = String(format: "%02d", self.currentTime % 60)
                self.stopwatchDisplay.text = "\(minutesPortion):\(secondsPortion)"
            })
        }
    }
    
    
    @IBAction func onePointAction(_ sender: UIButton) {
        send(point: "1")
    }
    
    @IBAction func twoPointsAction(_ sender: UIButton) {
        send(point: "2")
    }
    
    func send(point: String) {
        var message: String
        message = num! + color! + point
        SocketIOManager.sharedInstance.send(message: message)
    }
}
