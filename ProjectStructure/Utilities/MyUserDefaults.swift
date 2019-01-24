//
//  MyUserDefaults.swift
//  ProjectFramework
//
//  Created by Aqib Ali on 09/07/18.
//  Copyright © 2018 SignYourself. All rights reserved.
//

import Foundation
class MyUserDefaults{
    
    //MARK:- KEYS
    static let USER_ID = "userid"
    
    static var userPreference = UserDefaults.standard
    
    static func setUserID(id:String) {
        userPreference.set(id, forKey: USER_ID)
        userPreference.synchronize()
    }
    
    static func getUserID() -> String? {
        return userPreference.string(forKey: USER_ID)
    }
    
}
