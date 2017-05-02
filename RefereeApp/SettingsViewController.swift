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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorControl.tintColor = UIColor.blue
        connectionSwithcer.isOn = false
    }
    
    @IBAction func switcherChange(_ sender: UISwitch) {
        if connectionSwithcer.isOn {
            SocketIOManager.sharedInstance.establishConnection()
        } else {
            SocketIOManager.sharedInstance.closeConnection()
        }
    }
    
    @IBAction func colorChanged(_ sender: Any) {
        if colorControl.selectedSegmentIndex == 0 {
            colorControl.tintColor = UIColor.blue
        } else {
            colorControl.tintColor = UIColor.red
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




