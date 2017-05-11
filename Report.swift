//
//  Report.swift
//  RefereeApp
//
//  Created by Михаил Нечаев on 18.04.17.
//  Copyright © 2017 Михаил Нечаев. All rights reserved.
//

import UIKit

class Report {
    
    var refereeNum: String
    var fighterColor: String
    var mark: String
    var fullReport: String?
    var serverTime: String?
    var time: String?
    
    init(refNum: String, color: String, mark: String) {
        self.refereeNum = refNum
        self.fighterColor = color
        self.mark = mark
        self.fullReport = ""
        self.serverTime = ""
        self.time = ""
    }
    
    class func randomReport() -> Report {
        
        let num = Int(arc4random() % 2) + 1
        let colorNum = Int(arc4random() % 2) + 1
        let mark = Int(arc4random() % 2) + 1
        
        let fullReport = Report.init(refNum: String(num), color: String(colorNum), mark: String(mark))
        
        return fullReport
    }
    
    func makeReport(){//(with time: String, and serverTime: String) {
        if self.refereeNum == "1" {
            self.fullReport! += "Первый судья ставит"
        } else {
            self.fullReport! += "Второй судья ставит"
        }
        if self.mark == "1" {
            self.fullReport! += " один балл"
        } else {
            self.fullReport! += " два балла"
        }
        if self.fighterColor == "R" {
            self.fullReport! += " красному бойцу"
        } else {
            self.fullReport! += " синему бойцу"
        }
        /*
        let dateString = time //"Thu, 22 Oct 2015 07:45:17 +0000" "2017-5-9 14:17:17"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-M-d hh:mm:ss"//"EEE, dd MMM yyyy hh:mm:ss +zzzz"
        dateFormatter.locale = Locale.init(identifier: "en_GB")
        
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        let dateObj = dateFormatter.date(from: dateString)
        
        dateFormatter.dateFormat = "mm:ss"
        
        self.serverTime = dateFormatter.string(from: dateObj!)*/
    }
}
