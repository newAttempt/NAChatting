//
//  FriendBase.swift
//  NAChatting
//
//  Created by zeyong shan on 3/11/17.
//  Copyright © 2017 zeyong shan. All rights reserved.
//

import Foundation
import Firebase


class FriendBase
{
    class func addFriend(email: String)
    {
        let ref = FIRDatabase.database().reference().child((FIRAuth.auth()?.currentUser?.uid)!)
        
        ref.child("friends").childByAutoId().setValue(email)
    }
}
