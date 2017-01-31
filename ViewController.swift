//
//  ViewController.swift
//  ModelSwiftyJson
//
//  Created by Arun kumar Sah on 1/31/17.
//  Copyright © 2017 Arun kumar Sah. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    
    var dataObject          = [[String:String]]()
    var secondDataObject    = [SecondModel]()
    var thirdDataObject     = [ThirdModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dataObject = []
        getData1()
        //getData2()
        //getData3()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getData1(){
        let dic1 = ["appUserID":"456456456","token":"34534535","city":"Kathmandu","countryName":"Nepal","dob":"2016-03-03","email":"test@braindigit.com","firstName":"Suraj","lastName":"Shahi"]
        
        Util.saveDataToUserDefaults(dic1 as AnyObject, key: "AnyKey")
        FirstModel.destroy()
        
        print("User Data : \(FirstModel.sharedUser().description)")
        print("User Data First Name: \(FirstModel.sharedUser().firstName)")
        
    }
    
    func getData2(){
        let dic1 = ["appUserID":"456456456","token":"34534535","city":"Kathmandu","countryName":"Nepal","dob":"2016-03-03","email":"test@braindigit.com","firstName":"Suraj","lastName":"Shahi"]
        let dic2 = ["appUserID":"456456456","token":"34534535","city":"Kathmandu","countryName":"Nepal","dob":"2016-03-03","email":"test1@braindigit.com","firstName":"Suraj","lastName":"Shahi"]
        let dic3 = ["appUserID":"456456456","token":"34534535","city":"Kathmandu","countryName":"Nepal","dob":"2016-03-03","email":"test2@braindigit.com","firstName":"Suraj","lastName":"Shahi"]
        let dic4 = ["appUserID":"456456456","token":"34534535","city":"Kathmandu","countryName":"Nepal","dob":"2016-03-03","email":"test3@braindigit.com","firstName":"Suraj","lastName":"Shahi"]
        
        dataObject = [dic1,dic2,dic3,dic4]
        
        secondDataObject.removeAll()
        for adsDetail in dataObject {
            self.secondDataObject.append(SecondModel(userData: JSON(adsDetail)))
        }
        print("User Data : \(self.secondDataObject)")
        for userf in self.secondDataObject {
            print("Email : \(userf.email)")
        }
    }
    
    func getData3(){
        let dic1 = ["appUserID":"456456456","token":"34534535","city":"Kathmandu","countryName":"Nepal","dob":"2016-03-03","email":"test@braindigit.com","firstName":"Suraj","lastName":"Shahi"]
        let dic2 = ["appUserID":"456456456","token":"34534535","city":"Kathmandu","countryName":"Nepal","dob":"2016-03-03","email":"test@braindigit.com","firstName":"Suraj","lastName":"Shahi"]
        let dic3 = ["appUserID":"456456456","token":"34534535","city":"Kathmandu","countryName":"Nepal","dob":"2016-03-03","email":"test@braindigit.com","firstName":"Suraj","lastName":"Shahi"]
        let dic4 = ["appUserID":"456456456","token":"34534535","city":"Kathmandu","countryName":"Nepal","dob":"2016-03-03","email":"test@braindigit.com","firstName":"Suraj","lastName":"Shahi"]
        
        dataObject = [dic1,dic2,dic3,dic4]
        
        thirdDataObject.removeAll()
        for adsDetail in dataObject {
            self.thirdDataObject.append(ThirdModel(userData: JSON(adsDetail)))
        }
        if(self.thirdDataObject.count > 0){
            Util.saveDataToUserDefaults(NSKeyedArchiver.archivedData(withRootObject: self.thirdDataObject) as AnyObject, key: "StoringKey")
        }
        
        print("User Data : \(self.thirdDataObject)")
        for userf in self.thirdDataObject {
            print("Email : \(userf.email)")
        }
        
        guard let transactionData = Util.getUserDefaults("StoringKey") as? Data else {
            return
        }
        
        let offlineData = NSKeyedUnarchiver.unarchiveObject(with: transactionData) as! [ThirdModel]
        print("Stored Model Data : \(offlineData)")
        
        print("Stored Model Data at 0 index: \(offlineData[0])")
        print("Stored Model Data at 1 index: \(offlineData[1])")
    }
    
}

