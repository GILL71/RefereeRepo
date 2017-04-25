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
    
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var stopwatchDisplay: UILabel!
    
    @IBAction func startStopAction(_ sender: UIButton) {
        if timer != nil {
            sender.setTitle("Start", for: .normal)
            timer?.invalidate()
            timer = nil
        } else {
            sender.setTitle("Stop", for: .normal)
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
                self.currentTime += 1
                let minutesPortion = String(format: "%02d", self.currentTime / 60)
                let secondsPortion = String(format: "%02d", self.currentTime % 60)
                self.stopwatchDisplay.text = "\(minutesPortion):\(secondsPortion)"
            })
        }
    }
    @IBAction func onePointAction(_ sender: Any) {
        
        
        
    }
    
    @IBAction func towPointsAction(_ sender: Any) {
        
        
        
    }
}
