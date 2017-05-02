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
     //var socket: SocketIOClient = SocketIOClient(socketURL: NSURL(string: "http://192.168.1.33:80")! as URL)
     var socket = SocketIOClient(socketURL: URL(string: "http://192.168.1.33:8080")!, config: [.log(false), .forcePolling(true)])
    
     override init() {
          super.init()
        
          socket.on("test") { dataArray, ack in
               print(dataArray)
          }
        
          socket.on("status update") { dataArray, ack in
               NotificationCenter.default
                    .post(name: Notification.Name(rawValue: "callStatusUpdateNotification"), object: dataArray[0] as? [String: AnyObject])
          }
     }
    
     func establishConnection() {
          socket.connect()
     }
    
     func closeConnection() {
          socket.disconnect()
     }
     
     func send(message: String) {
          
     }
}
    
    /*

 http://stackoverflow.com/questions/40584379/vapor-create-web-socket     - not work
     
     https://vapor.github.io/documentation/websockets/custom.html
 
 
 */
