//
//  Message.swift
//  Telegramme
//
//  Created by Charles on 18/9/19.
//  Copyright © 2019 Charles. All rights reserved.
//

import Foundation

class Message
{
    var date:Date
    var isSender:Bool
    var text:String
    
    init(messageDate:Date, messageIsSender:Bool, messageText:String) {
        date = messageDate
        isSender = messageIsSender
        text = messageText
    }
    
}

