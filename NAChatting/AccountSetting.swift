//
//  AccountSetting.swift
//  TutorUAndI
//
//  Created by zeyong shan on 2/28/17.
//  Copyright © 2017 zeyong shan. All rights reserved.
//


// =============Details in the end of the page!!!!!===============


import Foundation
import Firebase


class AccountSetting
{
    static private let emailListName = "emailList"
    
    
    class func signUpWithEmail(_ email: String, _ password: String, completionHandler: @escaping (String?) ->())
    {
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: {(user, error) in
            if error != nil
            {
                completionHandler(error?.localizedDescription);//("Email already been used!")
            }
            else
            {
                completionHandler(nil)
                saveAccountAndPassword(email, password)
            }
        })
    }
    
    
    class func logInWithEmail(_ email: String, _ password: String, completionHandler: @escaping (String?) -> ())
    {
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: {(user, error) in
            if error != nil
            {
                completionHandler(error?.localizedDescription)
            }
            else
            {
                completionHandler(nil)
                saveAccountAndPassword(email, password)
            }
        })
    }
    
    
    class func logInAdminAccount(completionHandler: @escaping (String?) -> ())
    {
        FIRAuth.auth()?.signIn(withEmail: "shan27@pdx.edu", password: "BIANhao5213", completion: {(user, error) in
            if error != nil
            {
                completionHandler(error?.localizedDescription)
            }
            else
            {
                completionHandler(nil)
            }
        })
    }

    
    class func logOut(completionHandler: @escaping (Bool) -> ())
    {
        do
        {
            try FIRAuth.auth()?.signOut()
            cleanAccountAndPassword()
        } catch {
            completionHandler(false)
        }
        
    }
    
    
    class func logInWithSavedAccount(completionHandler: @escaping (String?) -> ())
    {
        let account = UserDefaults.standard.string(forKey: "account")
        let password = UserDefaults.standard.string(forKey: "password")
        if account == nil || password == nil
        {
            completionHandler("Doesn't find the saved account !")
            return
        }
        logInWithEmail(account!, password!)
        {
            (error) in
            completionHandler(error)
        }
    }
    
    
    
    // private =====================================================================
    
    private class func saveAccountAndPassword(_ email: String, _ password: String)
    {
        UserDefaults.standard.setValue(email, forKey: "account")
        UserDefaults.standard.setValue(password, forKey: "password")
    }
    
    
    private class func cleanAccountAndPassword()
    {
        UserDefaults.standard.setValue(nil, forKey: "account")
        UserDefaults.standard.setValue(nil, forKey: "password")
    }
    
    // ===================================================================== private
}



/*
    Example for using the logInWithSavedAccount function:
 
    call the function to logIn before the app run in to the logIn viewController each time.
    if the completionHandler was calling with nil. Then it was loged in.
    if there is error and the error is "Doesn't find the saved account !", which means user need to log in by themselves.
    if there is other error except the former one, then, there might be some problem in the user's account.
 
    String error = logInWithSavedAccount()
    {
        (error) in
        if error == nil
        {
            ....type code to step into the Home page.
        }
        else
        {
            ....output the message then let user type the account and password.
        }
    }
 
 */




/*
 -- one example for using these functions:
 
 AccountSetting.signUpWithEmail("example@pdx.edu", "examplepassword", completionHandler: {(error) in
 print(error ?? "sign up successfully!")
 })
 
 -- the completionHandler can also be took out from the argument list:
 
 AccountSetting.signUpWithEmail("sdfsdf@pdf.cd", "hahahaaha"){ (error) in
 print(error ?? "sign up successfully!")
 }
 
 
 -- pass in these functions with a completionHandler instead of catch the return value.
 -- the type of completionHandler is a function which take string as argument and return nothing.
 -- if the string is nil, which means the operation successful, if it is not, which means some error in there
 and the error message was stored in the string.
 
 */

