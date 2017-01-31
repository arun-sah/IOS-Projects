//
//  Util.swift
//  ModelExample
//
//  Created by BrainDigit on 11/22/16.
//  Copyright © 2016 braindigit. All rights reserved.
//

import UIKit

class Util: NSObject {
    //MARK: User Defaults
    
    class func saveDataToUserDefaults(_ data: AnyObject, key: String) {
        UserDefaults.standard.set(data, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    
    
    class func getUserDefaults(_ key : String)->AnyObject? {
        return UserDefaults.standard.object(forKey: key) as AnyObject?
    }
    
    class func removeUserData(_ key: String) {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
}
