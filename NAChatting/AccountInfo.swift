//
//  AccountInfo.swift
//  NAChatting
//
//  Created by zeyong shan on 3/11/17.
//  Copyright © 2017 zeyong shan. All rights reserved.
//

import Foundation
import Firebase


class AccountInfo
{
    class func storeNameAndEmail(_ name: String, _ email: String)
    {
        let ref = FIRDatabase.database().reference()
        let user = FIRAuth.auth()?.currentUser
        ref.child((user?.uid)!).child("name").setValue(name)
        ref.child((user?.uid)!).child("email").setValue(email)
    }
}
