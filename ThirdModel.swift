//
//  ThirdModel.swift
//  ModelExample
//
//  Created by BrainDigit on 11/17/16.
//  Copyright © 2016 braindigit. All rights reserved.
//

import UIKit
import SwiftyJSON

class ThirdModel: NSObject {
    var appUserID       = ""
    var token           = ""
    var city            = ""
    var countryName     = ""
    var dob             = ""
    var email           = ""
    var firstName       = ""
    var lastName        = ""
    
    init(userData: JSON) {
        
        self.appUserID          = userData["appUserID"].stringValue
        self.token              = userData["token"].stringValue
        self.city               = userData["city"].stringValue
        self.countryName        = userData["countryName"].stringValue
        self.email              = userData["email"].stringValue
        self.firstName          = userData["firstName"].stringValue
        self.lastName           = userData["lastName"].stringValue
        
    }
    
    required init(coder aDecoder: NSCoder) {
        self.appUserID      = aDecoder.decodeObject(forKey: "appUserID") as! String
        self.token          = aDecoder.decodeObject(forKey: "token") as! String
        self.city           = aDecoder.decodeObject(forKey: "city") as! String
        self.countryName    = aDecoder.decodeObject(forKey: "countryName") as! String
        self.email          = aDecoder.decodeObject(forKey: "email") as! String
        self.firstName      = aDecoder.decodeObject(forKey: "firstName") as! String
        self.lastName       = aDecoder.decodeObject(forKey: "lastName") as! String
        
    }
    
    func encodeWithCoder(_ aCoder: NSCoder) {
        aCoder.encode(self.appUserID, forKey: "appUserID")
        aCoder.encode(self.token, forKey: "token")
        aCoder.encode(self.city, forKey: "city")
        aCoder.encode(self.countryName, forKey: "countryName")
        aCoder.encode(self.email, forKey: "email")
        aCoder.encode(self.firstName, forKey: "firstName")
        aCoder.encode(self.lastName, forKey: "lastName")
    }
    
    
    internal override var description: String {
        return "appUserID:\(self.appUserID), city:\(self.city), countryName:\(self.countryName), dob:\(self.dob), email:\(self.email), firstName:\(self.firstName), lastName:\(self.lastName)\n"
    }
}
