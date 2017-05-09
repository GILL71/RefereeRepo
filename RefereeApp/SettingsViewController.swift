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
    
    @IBOutlet weak var connectionSwithcer: UISwitch!
    @IBOutlet weak var colorControl: UISegmentedControl!
    var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorControl.tintColor = UIColor.blue
        connectionSwithcer.isOn = false
        defaults.set("1", forKey: "referee")
        defaults.set("B", forKey: "color")
        self.tabBarController?.tabBar.items?[1].isEnabled = false
        self.tabBarController?.tabBar.items?[2].isEnabled = false
    }
    
    @IBAction func refereeChanged(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            defaults.set("1", forKey: "referee")
        } else {
            defaults.set("2", forKey: "referee")
        }
    }
    
    @IBAction func switcherChange(_ sender: UISwitch) {
        if connectionSwithcer.isOn {
            SocketIOManager.sharedInstance.establishConnection()
            self.tabBarController?.tabBar.items?[1].isEnabled = true
            self.tabBarController?.tabBar.items?[2].isEnabled = true
        } else {
            SocketIOManager.sharedInstance.closeConnection()
            self.tabBarController?.tabBar.items?[1].isEnabled = false
            self.tabBarController?.tabBar.items?[2].isEnabled = false
        }
    }
    
    @IBAction func colorChanged(_ sender: Any) {
        if colorControl.selectedSegmentIndex == 0 {
            colorControl.tintColor = UIColor.blue
            defaults.set("B", forKey: "color")
        } else {
            colorControl.tintColor = UIColor.red
            defaults.set("R", forKey: "color")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


/* GET(path: "http://localhost:8080/app") {
 (data, response, error) -> Void in
 print(String(data: data! as Data, encoding: String.Encoding.utf8) ?? "UUUUUPPS")
 }*/

/*
 func GET(path : String, callback: @escaping (_ result: NSData?, _ response: HTTPURLResponse?, _ error: NSError?) -> Void) {
 let session = URLSession.shared
 let url = NSURL(string: path)
 let task = session.dataTask(with: url! as URL){
 (data, response, error) -> Void in
 if (error != nil) {
 // return the NSData as nil (since you have an error)
 callback(nil, response as? HTTPURLResponse, error! as NSError)
 } else {
 // return the NSData
 callback(data! as NSData, response as? HTTPURLResponse, nil)
 }
 }
 task.resume()
 }
 */




