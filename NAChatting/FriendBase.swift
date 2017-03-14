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
    class func addFriend(_ email: String) -> String?
    {
        if FriendList.isFriendExist(email)
        {
            return "Friend you want to add already exist!"
        }
        let ref = FIRDatabase.database().reference().child((FIRAuth.auth()?.currentUser?.uid)!)
        ref.child("friends").childByAutoId().setValue(email)
        return nil
    }
    
    
}


class FriendList
{
    static private var friends:[String] = []
    static private let ref = FIRDatabase.database().reference().child((FIRAuth.auth()?.currentUser?.uid)!).child("friends")
    class func loadFriends()
    {
        ref.observe(.childAdded, with: {(snapshot) -> Void in
            let value = snapshot.value as? String
            if value != nil && !self.isFriendExist(value!)
            {
                self.friends.append(value!)
            }
        })
    }
    
    
    class func isFriendExist(_ email: String) -> Bool
    {
        return friends.contains(email)
    }
    
    
    class func friendCount() -> Int
    {
        return friends.count
    }
    
    
    class func getfriendList() -> [String]
    {
        return friends
    }
    
    
    class func clean()
    {
        friends = []
    }
}



