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
     var socket = SocketIOClient(socketURL: URL(string: "http://192.168.1.33:3000")!, config: [.log(false), .forcePolling(true)])
     
     var messageDictionary = [[String: AnyObject]]()
    
     override init() {
          super.init()
        /*
          socket.on("test") { dataArray, ack in
               print(dataArray)
          }
        
          socket.on("status update") { dataArray, ack in
               NotificationCenter.default
                    .post(name: Notification.Name(rawValue: "callStatusUpdateNotification"), object: dataArray[0] as? [String: AnyObject])
          }*/
     }
    
     func establishConnection() {
          socket.connect()
     }
    
     func closeConnection() {
          socket.disconnect()
     }
     
     func connectToServerWithNickname(nickname: String, completionHandler: @escaping (_ userList: [[String: AnyObject]]?) -> Void) {
          socket.emit("connectUser", nickname)
          socket.on("userList") { ( dataArray, ack) -> Void in
               completionHandler(dataArray[0] as? [[String: AnyObject]])
          }
     }
     
     func sendMessage(message: String, withNickname nickname: String) {
          socket.emit("chatMessage", nickname, message)
     }
     
     func getMessage(completionHandler: @escaping (_ messageInfo: [String: AnyObject]) -> Void) {
          socket.on("newChatMessage") { (dataArray, socketAck) -> Void in
               var messageDictionary = [String: AnyObject]()
               messageDictionary["nickname"] = dataArray[0] as! String as AnyObject
               messageDictionary["message"] = dataArray[1] as! String as AnyObject
               messageDictionary["date"] = dataArray[2] as! String as AnyObject
               
               completionHandler(messageDictionary)
          }
     }
}
    
    /*

 http://stackoverflow.com/questions/40584379/vapor-create-web-socket     - not work
     
     https://vapor.github.io/documentation/websockets/custom.html
 
 
 */
