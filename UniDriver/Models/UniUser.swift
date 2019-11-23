//
//  UniUser.swift
//  UniDriver
//
//  Created by user155127 on 11/17/19.
//  Copyright © 2019 Robert Cook. All rights reserved.
//

import Foundation
import Firebase

class UniUser{
    enum UserType:String{
        case Rider = "Rider"
        case Driver = "Driver"
        
        //var description: String{
        //    switch self {
        //        case .Rider: return "Rider"
        //        case .Driver: return "Driver"
        //    }
        //}
    }
    
    var ref: DatabaseReference!
    var key: String
    var email: String
    var username: String
    var password: String
    var name: String
    var userType: UserType
    var currentLocation: Location?
    var currentTrip: Trip?
    var previousTrips: Array<Trip>?
    var car: Vehicle?
    var bankInfo: FinancialInfo?
    var driverFare: Double?
    var isLoggedIn = false
    
    init (username: String, password: String, name: String, email: String, userType: UserType){
        self.username = username
        self.password = password
        self.name = name
        self.email = email
        self.userType = userType
        self.ref = nil
        self.key = "" //will change this tomorrow, possibly adding code below to UniDataController -Melanie
            /*ref.childByAutoId().key!
        ref.child(key).setValue(self)*/
    }
    

    init?(snapshot: DataSnapshot, lookupKey: String) {
        guard
            let topValue = snapshot.value as? [String: AnyObject],
            let value = topValue[lookupKey] as? [String: AnyObject],
            let email = value["email"] as? String,
            let username = value["username"] as? String,
            let password = value["password"] as? String,
            let name = value["name"] as? String,
            let userType = value["userType"] as? String
            else {
            return nil
        }
        
        self.ref = snapshot.ref
        self.key = snapshot.key
        self.email = email
        self.username = username
        self.password = password
        self.name = name
        self.userType = UserType(rawValue: userType)!
        self.isLoggedIn = false
        
        if let isLoggedIn = value["isLoggedIn"] as? String{
            if isLoggedIn == "true" {self.isLoggedIn = true}
        }
        
        //load bank info
        if let bankInfoArray = value["bankInfo"] as? NSMutableArray,
            let bankInfo = bankInfoArray[0] as? [String: AnyObject] {
            self.bankInfo = FinancialInfo()
            self.bankInfo?.bankAccountNumber = bankInfo["bankAccountNumber"] as? String
            self.bankInfo?.bankRoutingNumber = bankInfo["bankRoutingNumber"] as? String
            self.bankInfo?.ccExpDate = bankInfo["ccExpDate"] as? String
            self.bankInfo?.ccNumber = bankInfo["ccNumber"] as? String
            self.bankInfo?.cvv = bankInfo["cvv"] as? String
        }
        
        //load car info
        if let carInfoArray = value["car"] as? NSMutableArray,
            let carInfo = carInfoArray[0] as? [String: AnyObject]{
            self.car = Vehicle()
            self.car?.color = carInfo["color"] as? String
            self.car?.licensePlate = carInfo["licensePlate"] as? String
            self.car?.make = carInfo["make"] as? String
            self.car?.model = carInfo["model"] as? String
        }
        
        //load location info
        if let locationInfoArray = value["location"] as? NSMutableArray,
            let locationInfo = locationInfoArray[0] as? [String: AnyObject],
            let lat = Double(locationInfo["latitude"] as! String),
            let long = Double(locationInfo["longitude"] as! String) {
            self.currentLocation = Location(latitude: lat, longitude: long)
        }
        
        //load trip info
        
        //load previous trip array info

    }
    
    init?(value: [String: AnyObject], ref: DatabaseReference?, key: String) {
        guard
            let email = value["email"] as? String,
            let username = value["username"] as? String,
            let password = value["password"] as? String,
            let name = value["name"] as? String,
            let userType = value["userType"] as? String
            else {
            return nil
        }
        
        self.ref = ref
        self.key = key
        self.email = email
        self.username = username
        self.password = password
        self.name = name
        self.userType = UserType(rawValue: userType)!
        self.isLoggedIn = false
        
        if let isLoggedIn = value["isLoggedIn"] as? String{
            if isLoggedIn == "true" {self.isLoggedIn = true}
        }

        //load bank info
        if let bankInfoArray = value["bankInfo"] as? NSMutableArray,
            let bankInfo = bankInfoArray[0] as? [String: AnyObject] {
            self.bankInfo = FinancialInfo()
            self.bankInfo?.bankAccountNumber = bankInfo["bankAccountNumber"] as? String
            self.bankInfo?.bankRoutingNumber = bankInfo["bankRoutingNumber"] as? String
            self.bankInfo?.ccExpDate = bankInfo["ccExpDate"] as? String
            self.bankInfo?.ccNumber = bankInfo["ccNumber"] as? String
            self.bankInfo?.cvv = bankInfo["cvv"] as? String
        }
        
        //load car info
        if let carInfoArray = value["car"] as? NSMutableArray,
            let carInfo = carInfoArray[0] as? [String: AnyObject]{
            self.car = Vehicle()
            self.car?.color = carInfo["color"] as? String
            self.car?.licensePlate = carInfo["licensePlate"] as? String
            self.car?.make = carInfo["make"] as? String
            self.car?.model = carInfo["model"] as? String
        }
        
        //load location info
        if let locationInfoArray = value["location"] as? NSMutableArray,
            let locationInfo = locationInfoArray[0] as? [String: AnyObject],
            let lat = Double(locationInfo["latitude"] as! String),
            let long = Double(locationInfo["longitude"] as! String) {
            self.currentLocation = Location(latitude: lat, longitude: long)
        }
        
        //load trip info
        
        //load previous trip array info

    }

    func toAnyObject() -> Any{
        
        return [
            "key": key,
            "email": email,
            "username": username,
            "password": password,
            "name": name,
            "userType": userType.rawValue,
            "location":[currentLocation?.toAnyObject()],
            "car":[car?.toAnyObject()],
            "bankInfo":[bankInfo?.toAnyObject()],
            "currentTrip":[currentTrip?.toAnyObject()],
            "isLoggedIn": isLoggedIn.description
        ]
    }
    
    //Set location
    func setCurrentLocation(lat: Double, long: Double){
        self.currentLocation = Location(latitude: lat, longitude: long)
    }
    
    //Set vehicle information - expecting this to only be used for Drivers
    func setVehicle(make: String, model: String, color: String, licensePlate: String){
        self.car = Vehicle()
        self.car?.make = make
        self.car?.model = model
        self.car?.color = color
        self.car?.licensePlate = licensePlate
    }
    
    //set driver's current fare
    func setFare(fare: Double) {
        self.driverFare? = fare
    }
    
    //Two seperate set functions here because Riders only need cc info and Drivers only need bank info
    func setCCInfo(ccNumber: String, ccExpDate: String, cvv: String){
        self.bankInfo = FinancialInfo()
        self.bankInfo?.ccNumber = ccNumber
        self.bankInfo?.ccExpDate = ccExpDate
        self.bankInfo?.cvv = cvv
    }
    
    func setBankInfo(bankAccountNumber: String, bankRoutingNumber: String){
        self.bankInfo = FinancialInfo()
        self.bankInfo?.bankAccountNumber = bankAccountNumber
        self.bankInfo?.bankRoutingNumber = bankRoutingNumber
    }
    
//    func addTrip(startLocation: Location, destination: Location, fare: Double){
//        guard let trips = self.previousTrips else {
//            self.previousTrips = Array<Trip>()
//
//        }
//    }
    
    func getBankInfo(userInfo: [String: AnyObject]) -> FinancialInfo? {
        var returnBank = FinancialInfo()
        
        
        
        return returnBank
    }

}
