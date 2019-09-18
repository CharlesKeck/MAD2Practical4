//
//  Friend.swift
//  Telegramme
//
//  Created by Charles on 18/9/19.
//  Copyright © 2019 Charles. All rights reserved.
//

import Foundation

class Friend
{
    var name:String
    var profileImageName:String
    
    init(friendname:String, friendprofileImageName:String) {
        name = friendname
        profileImageName = friendprofileImageName
    }
}
