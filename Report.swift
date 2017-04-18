//
//  Report.swift
//  RefereeApp
//
//  Created by Михаил Нечаев on 18.04.17.
//  Copyright © 2017 Михаил Нечаев. All rights reserved.
//

import UIKit

class Report {
    
    let refereeNum: Int
    let fighterColor: UIColor
    let mark: Int
    //var time: Timer
    
    init(refNum: Int, color: UIColor, mark: Int) {
        self.refereeNum = refNum
        self.fighterColor = color
        self.mark = mark
    }
    
    class func randomReport() -> Report {
        
        let num = Int(arc4random() % 2) + 1
        let colorNum = Int(arc4random() % 2) + 1
        let color: UIColor
        if colorNum == 1 {
            color = UIColor.red
        } else {
            color = UIColor.blue
        }
        let mark = Int(arc4random() % 2) + 1
        
        let report = Report.init(refNum: num, color: color, mark: mark)
        
        return report
    }
    
}
