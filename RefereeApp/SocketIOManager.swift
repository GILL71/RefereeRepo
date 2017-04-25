//
//  SocketIOManager.swift
//  RefereeApp
//
//  Created by Михаил Нечаев on 21.04.17.
//  Copyright © 2017 Михаил Нечаев. All rights reserved.
//

import Foundation

class SocketIOManager: NSObject {
    static let sharedInstance = SocketIOManager()
    
    override init() {
        super.init()
    }
    
    var socket: SocketIOClient = SocketIOClient(socketURL: NSURL(string: "http://192.168.1.33:8080")! as URL)
    
    func establishConnection() {
        socket.connect()
    }
    
    func closeConnection() {
        socket.disconnect()
    }
    
    func connectToServerWithNickname(nickname: String, completionHandler: (_ userList: [[String: AnyObject]]?) -> Void) {
        socket.emit("connectUser", nickname)
    }
}
